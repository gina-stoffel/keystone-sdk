# set(CMAKE_C_COMPILER "/opt/riscv/musl-riscv-toolchain-10.2.0-1/bin/riscv64-unknown-linux-musl-gcc")
# set(CMAKE_CXX_COMPILER "/keystone/riscv64/bin/riscv64-unknown-linux-gnu-g++")

# define benchmark runner
set(host_bin bench-runner)
set(host_src host/host.cpp)

# describe package
set(package_name "bench.ke")
set(package_script "./bench-runner sha512 eyrie-rt")

if(RISCV32)
  set(eyrie_plugins "freemem untrusted_io_syscall linux_syscall env_setup rv32")
else()
  set(eyrie_plugins "freemem untrusted_io_syscall linux_syscall env_setup")
endif()

# sha512
add_custom_command(OUTPUT sha512
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/sha512
/keystone/sdk/examples/rv8-bench/eapp/sha512.c)

# sha512
# add_executable(sha512 eapp/sha512.c)
# target_link_libraries(sha512 ${KEYSTONE_LIB_EAPP})

# aes
add_custom_command(OUTPUT aes
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/aes
/keystone/sdk/examples/rv8-bench/eapp/aes.c)

# bigint
add_custom_command(OUTPUT bigint
  COMMAND
  riscv64-unknown-linux-gnu-g++ -static -o ${CMAKE_CURRENT_BINARY_DIR}/bigint
/keystone/sdk/examples/rv8-bench/eapp/bigint.cc)

# dhrystone
add_custom_command(OUTPUT dhrystone
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/dhrystone
/keystone/sdk/examples/rv8-bench/eapp/dhrystone.c)

# miniz
add_custom_command(OUTPUT miniz
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/miniz
/keystone/sdk/examples/rv8-bench/eapp/miniz.c)

# norx
add_custom_command(OUTPUT norx
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/norx
/keystone/sdk/examples/rv8-bench/eapp/norx.c)

# primes
add_custom_command(OUTPUT primes
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/primes
/keystone/sdk/examples/rv8-bench/eapp/primes.c)

# qsort
add_custom_command(OUTPUT qsort
  COMMAND
  riscv64-unknown-linux-musl-gcc -static -o ${CMAKE_CURRENT_BINARY_DIR}/qsort
/keystone/sdk/examples/rv8-bench/eapp/qsort.c)

# host

add_executable(${host_bin} ${host_src})
target_link_libraries(${host_bin} ${KEYSTONE_LIB_HOST} ${KEYSTONE_LIB_EDGE})

# add target for Eyrie runtime (see keystone.cmake)

set(eyrie_files_to_copy .options_log eyrie-rt)
add_eyrie_runtime(bench-eyrie
  "v1.0.0"
  ${eyrie_plugins}
  ${eyrie_files_to_copy})

# add target for packaging (see keystone.cmake)

add_keystone_package(bench-package
  ${package_name}
  ${package_script}
  ${eyrie_files_to_copy} sha512 aes bigint dhrystone miniz norx primes qsort ${host_bin})

add_dependencies(bench-package bench-eyrie)

# add package to the top-level target
add_dependencies(examples bench-package)
