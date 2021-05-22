# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /keystone/sdk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /keystone/sdk/build

# Utility rule file for hello-package.

# Include the progress variables for this target.
include examples/hello/CMakeFiles/hello-package.dir/progress.make

examples/hello/CMakeFiles/hello-package: examples/hello/pkg/.options_log
examples/hello/CMakeFiles/hello-package: examples/hello/pkg/eyrie-rt
examples/hello/CMakeFiles/hello-package: examples/hello/pkg/hello
examples/hello/CMakeFiles/hello-package: examples/hello/pkg/hello-runner
	cd /keystone/sdk/build/examples/hello && /usr/bin/makeself --noprogress /keystone/sdk/build/examples/hello/pkg hello.ke "Keystone Enclave Package" ./hello-runner hello eyrie-rt

examples/hello/pkg/.options_log: examples/hello/.options_log
examples/hello/pkg/.options_log: examples/hello/pkg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating pkg/.options_log"
	cd /keystone/sdk/build/examples/hello && cp .options_log /keystone/sdk/build/examples/hello/pkg/.options_log

examples/hello/pkg/eyrie-rt: examples/hello/eyrie-rt
examples/hello/pkg/eyrie-rt: examples/hello/pkg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating pkg/eyrie-rt"
	cd /keystone/sdk/build/examples/hello && cp eyrie-rt /keystone/sdk/build/examples/hello/pkg/eyrie-rt

examples/hello/pkg/hello: examples/hello/hello
examples/hello/pkg/hello: examples/hello/pkg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating pkg/hello"
	cd /keystone/sdk/build/examples/hello && cp hello /keystone/sdk/build/examples/hello/pkg/hello

examples/hello/pkg/hello-runner: examples/hello/hello-runner
examples/hello/pkg/hello-runner: examples/hello/pkg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating pkg/hello-runner"
	cd /keystone/sdk/build/examples/hello && cp hello-runner /keystone/sdk/build/examples/hello/pkg/hello-runner

examples/hello/.options_log: examples/hello/runtime/src/eyrie-hello-eyrie/.options_log
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating .options_log"
	cd /keystone/sdk/build/examples/hello && cp /keystone/sdk/build/examples/hello/runtime/src/eyrie-hello-eyrie/.options_log .options_log

examples/hello/pkg:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Generating pkg"
	cd /keystone/sdk/build/examples/hello && mkdir /keystone/sdk/build/examples/hello/pkg

examples/hello/eyrie-rt: examples/hello/runtime/src/eyrie-hello-eyrie/eyrie-rt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Generating eyrie-rt"
	cd /keystone/sdk/build/examples/hello && cp /keystone/sdk/build/examples/hello/runtime/src/eyrie-hello-eyrie/eyrie-rt eyrie-rt

examples/hello/hello:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Generating hello"
	cd /keystone/sdk/build/examples/hello && riscv64-unknown-linux-musl-gcc -static -o /keystone/sdk/build/examples/hello/hello /keystone/sdk/examples/hello/eapp/hello.c

hello-package: examples/hello/CMakeFiles/hello-package
hello-package: examples/hello/pkg/.options_log
hello-package: examples/hello/pkg/eyrie-rt
hello-package: examples/hello/pkg/hello
hello-package: examples/hello/pkg/hello-runner
hello-package: examples/hello/.options_log
hello-package: examples/hello/pkg
hello-package: examples/hello/eyrie-rt
hello-package: examples/hello/hello
hello-package: examples/hello/CMakeFiles/hello-package.dir/build.make

.PHONY : hello-package

# Rule to build all files generated by this target.
examples/hello/CMakeFiles/hello-package.dir/build: hello-package

.PHONY : examples/hello/CMakeFiles/hello-package.dir/build

examples/hello/CMakeFiles/hello-package.dir/clean:
	cd /keystone/sdk/build/examples/hello && $(CMAKE_COMMAND) -P CMakeFiles/hello-package.dir/cmake_clean.cmake
.PHONY : examples/hello/CMakeFiles/hello-package.dir/clean

examples/hello/CMakeFiles/hello-package.dir/depend:
	cd /keystone/sdk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /keystone/sdk /keystone/sdk/examples/hello /keystone/sdk/build /keystone/sdk/build/examples/hello /keystone/sdk/build/examples/hello/CMakeFiles/hello-package.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/hello/CMakeFiles/hello-package.dir/depend

