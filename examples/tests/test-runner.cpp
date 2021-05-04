//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include <getopt.h>
#include <cstdio>
#include <iostream>
#include <thread>
#include <vector>
#include <stdio.h>
#include "edge_wrapper.h"
#include "host/keystone.h"
#include "verifier/report.h"
#include "verifier/test_dev_key.h"
#include <stdlib.h>
#include <unistd.h>  //Header file for sleep(). man 3 sleep for details.
#include <pthread.h>

const char* longstr = "hellohellohellohellohellohellohellohellohellohello";

unsigned long
print_buffer(char* str) {
  printf("Enclave said: %s", str);
  return strlen(str);
}

void
print_value(unsigned long val) {
  printf("Enclave said value: %u\n", val);
  return;
}

const char*
get_host_string() {
  return longstr;
}

static struct report_t report;

void
print_hex(void* buffer, size_t len) {
  int i;
  for (i = 0; i < len; i += sizeof(uintptr_t)) {
    printf("%.16lx ", *((uintptr_t*)((uintptr_t)buffer + i)));
  }
  printf("\n");
}

void
copy_report(void* buffer) {
  Report report;

  report.fromBytes((unsigned char*)buffer);

  if (report.checkSignaturesOnly(_sanctum_dev_public_key)) {
    printf("Attestation report SIGNATURE is valid\n");
  } else {
    printf("Attestation report is invalid\n");
  }
}

void *encl_runner(void* encl) {
  printf("some te\n");
  Keystone::Enclave* e = (Keystone::Enclave*)encl;

  uintptr_t temp_ret;
  e->run(&temp_ret);
  printf("The enclave returned: %u\n", temp_ret);

  return NULL;
}

int
main(int argc, char** argv) {

  /* note: ./test-runner attestation eyrie-rt --time --policy 400
  [sdk]The following is argc: 6 -> so argc counts how many separat args there are  */

/* assumption for now:
 * the arguments should be passed as follows
 * ./test-runner 2 eapp1 eapp2 rd1 rt2 --time --policy 500  // the flags will be applied to all the enclaves
 */


  if (argc < 4) {
    printf(
        "Usage: %s <eapp> <runtime> [--utm-size SIZE(K)] [--freemem-size "
        "SIZE(K)] [--time] [--load-only] [--utm-ptr 0xPTR] [--retval EXPECTED] [--policy CYCLES_PER_EPOCH]\n",
        argv[0]);
    return 0;
  }

  int no_of_enlcaves = atoi(argv[1]);
  printf("Number of enclaves to start is %d\n", no_of_enlcaves);

  int self_timing = 0;
  int load_only   = 0;

  size_t untrusted_size = 2 * 1024 * 1024;
  size_t freemem_size   = 48 * 1024 * 1024;
  uintptr_t utm_ptr     = (uintptr_t)DEFAULT_UNTRUSTED_PTR;
  bool retval_exist = false;
  unsigned long retval = 0;
  bool policy_set = false;
  uint64_t cycles_per_epoch = 0;

  static struct option long_options[] = {
      {"time", no_argument, &self_timing, 1},
      {"load-only", no_argument, &load_only, 1},
      {"policy", required_argument, 0, 'c'},
      {"utm-size", required_argument, 0, 'u'},
      {"utm-ptr", required_argument, 0, 'p'},
      {"freemem-size", required_argument, 0, 'f'},
      {"retval", required_argument, 0, 'r'},
      {0, 0, 0, 0}};

  char* eapp_files[no_of_enlcaves];
  char* rt_files[no_of_enlcaves];

  for(int n = 0; n < no_of_enlcaves; n++) {
    eapp_files[n] = argv[n+2];
    rt_files[n] = argv[n+2+no_of_enlcaves];
  }

  int c;
  int opt_index = 2+2*no_of_enlcaves;

  while (1) {
    c = getopt_long(argc, argv, "c:u:p:f:", long_options, &opt_index);

    if (c == -1) break;
    
    switch (c) {
      case 0:
        break;
      case 'u':
        untrusted_size = atoi(optarg) * 1024;
        break;
      case 'p':
        utm_ptr = strtoll(optarg, NULL, 16);
        break;
      case 'f':
        freemem_size = atoi(optarg) * 1024;
        break;
      case 'r':
        retval_exist = true;
        retval = atoi(optarg);
        break;
      case 'c':
        policy_set = true;
        cycles_per_epoch = atoi(optarg); 
    }
  }

   Keystone::Enclave enclaves[no_of_enlcaves];
   Keystone::Params params;

   unsigned long cycles1, cycles2, cycles3, cycles4;

   params.setFreeMemSize(freemem_size);
   params.setUntrustedMem(utm_ptr, untrusted_size);
   if (policy_set) {
     params.setPolicy(cycles_per_epoch);
   }

   if (self_timing) {
     asm volatile("rdcycle %0" : "=r"(cycles1));
   }

    for(int e = 0; e < no_of_enlcaves; e++) {
      enclaves[e].init(eapp_files[e], rt_files[e], params);
    }

   if (self_timing) {
     asm volatile("rdcycle %0" : "=r"(cycles2));
   }

  for(int e = 0; e < no_of_enlcaves; e++) {
    edge_init(&enclaves[e]);
  }

   if (self_timing) {
     asm volatile("rdcycle %0" : "=r"(cycles3));
   }


  if (!load_only) {
   //uintptr_t encl_ret[no_of_enlcaves];
    
    for(int e = 0; e < no_of_enlcaves; e++) {
      pthread_t thread_id;
      pthread_create(&thread_id, NULL, encl_runner, (void*)(&enclaves[e]) );
      pthread_join(thread_id, NULL); 
      // enclaves[e].run(&encl_ret[e])
    }
    
  }

  if (self_timing) {
    asm volatile("rdcycle %0" : "=r"(cycles4));
    printf("[keystone-test] Init: %lu cycles\r\n", cycles2 - cycles1);
    printf("[keystone-test] Runtime: %lu cycles\r\n", cycles4 - cycles3);
  }

  return 0;
}
