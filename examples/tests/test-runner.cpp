//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include <getopt.h>
#include <cstdio>
#include <iostream>
#include "edge_wrapper.h"
#include "host/keystone.h"
#include "verifier/report.h"
#include "verifier/test_dev_key.h"

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

int
main(int argc, char** argv) {
  printf("[sdk]The following is argc: %d\n", argc); // argcount? 

  /* note: ./test-runner attestation eyrie-rt --time --policy 400
  [sdk]The following is argc: 6 -> so argc counts how many separat args there are  */

/* assumption for now:
 * only the policy flag is used, no other flags
 * thus we will always have argc as multiple of 3
 */

  if (argc < 3) {
    printf(
        "Usage: %s <eapp> <runtime> [--utm-size SIZE(K)] [--freemem-size "
        "SIZE(K)] [--time] [--load-only] [--utm-ptr 0xPTR] [--retval EXPECTED] [--policy CYCLES_PER_EPOCH]\n",
        argv[0]);
    return 0;
  }

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

  char* eapp_file = argv[1];
  char* rt_file   = argv[2];

  int c;
  int opt_index = 3;
  while (1) {
    c = getopt_long(argc, argv, "u:p:f:", long_options, &opt_index);

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

  Keystone::Enclave enclave1;
  Keystone::Enclave enclave2;
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

  enclave1.init(eapp_file, rt_file, params);
  /* todo: verify if the above actually calls eyrie boot but it looks like it sets
   * the entry point to the runtime, and in the entry point to the runtime the function
   * eyrie_boot
   * wait, I might not have permissions to do this call tho
   */
  uintptr_t a0 = 0;
  __asm__ volatile("ecall" : "+r"(a0) : "r"(0), "r"(0), "r"(3001), "r"(0x08424b45): "memory");  

  /* start a second enclave as well */
  enclave2.init(eapp_file, rt_file, params);

  if (self_timing) {
    asm volatile("rdcycle %0" : "=r"(cycles2));
  }

  edge_init(&enclave1);

  if (self_timing) {
    asm volatile("rdcycle %0" : "=r"(cycles3));
  }

  uintptr_t encl_ret;
  if (!load_only) enclave1.run(&encl_ret);

  if (retval_exist && encl_ret != retval) {
    printf("[FAIL] enclave1 returned a wrong value (%d != %d)\r\n", encl_ret, retval);
  }

  if (self_timing) {
    asm volatile("rdcycle %0" : "=r"(cycles4));
    printf("[keystone-test] Init: %lu cycles\r\n", cycles2 - cycles1);
    printf("[keystone-test] Runtime: %lu cycles\r\n", cycles4 - cycles3);
  }

  return 0;
}
