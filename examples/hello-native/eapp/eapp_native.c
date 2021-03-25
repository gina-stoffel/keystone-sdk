//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include "eapp_utils.h"
#include "string.h"
#include "edge_call.h"
#include <syscall.h>

#define OCALL_PRINT_STRING 1

unsigned long ocall_print_string(char* string);

int main(){
  unsigned long cycle_count, cycle_count2;
  asm volatile ("rdcycle %0" : "=r" (cycle_count));

  ocall_print_string("Hello World");

  asm volatile ("rdcycle %0" : "=r" (cycle_count2));
  ocall_print_string("EAPP: cycles used:");
  //ocall_print_value((unsigned long)cycle_count2-cycle_count);
  // ocall_print_string((char *)100);

  EAPP_RETURN(0);
}

unsigned long ocall_print_string(char* string){
  unsigned long retval;
  ocall(OCALL_PRINT_STRING, string, strlen(string)+1, &retval ,sizeof(unsigned long));
  return retval;
}

