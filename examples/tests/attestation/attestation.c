//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include "app/eapp_utils.h"
#include "app/string.h"
#include "app/syscall.h"

#include "edge_wrapper.h"

void EAPP_ENTRY eapp_entry(){
  unsigned long cycle_count, cycle_count2;
  asm volatile ("rdcycle %0" : "=r" (cycle_count));

  edge_init();

  char* data = "nonce";
  char buffer[2048];

  attest_enclave((void*) buffer, data, 5);

  ocall_copy_report(buffer, 2048);

  asm volatile ("rdcycle %0" : "=r" (cycle_count2));
  ocall_print_value((unsigned long)cycle_count2-cycle_count);

  EAPP_RETURN(0);
}
