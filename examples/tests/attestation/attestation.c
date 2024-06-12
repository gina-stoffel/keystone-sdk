//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include "app/eapp_utils.h"
#include "app/string.h"
#include "app/syscall.h"
//#include <unistd.h>

#include "edge_wrapper.h"

void EAPP_ENTRY eapp_entry(){
  //unsigned long cycle_count, cycle_count2;

  edge_init();
  //asm volatile ("rdcycle %0" : "=r" (cycle_count));

  char* data = "nonce";
  char buffer[2048];

  attest_enclave((void*) buffer, data, 5);
  
  // not sure if host should actually stop it while running and then resume it after sleep?
//  // sleep(5)
//  // works but is weird (too long maybe?) adjust steps per sec
//  #define STEPS_PER_SEC 650000000
//  unsigned int i,s;
//  for (s=0; s < 5; s++) {
//    for (i=0; i < STEPS_PER_SEC; i++) {
//       asm("nop");
//    }
//  }

  ocall_copy_report(buffer, 2048);

  //asm volatile ("rdcycle %0" : "=r" (cycle_count2));
  //ocall_print_value((unsigned long)cycle_count2-cycle_count);

  EAPP_RETURN(0);
}
