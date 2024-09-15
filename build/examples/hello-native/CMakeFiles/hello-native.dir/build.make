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

# Include any dependencies generated for this target.
include examples/hello-native/CMakeFiles/hello-native.dir/depend.make

# Include the progress variables for this target.
include examples/hello-native/CMakeFiles/hello-native.dir/progress.make

# Include the compile flags for this target's objects.
include examples/hello-native/CMakeFiles/hello-native.dir/flags.make

examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o: examples/hello-native/CMakeFiles/hello-native.dir/flags.make
examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o: ../examples/hello-native/eapp/eapp_native.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o"
	cd /keystone/sdk/build/examples/hello-native && /keystone/riscv64/bin/riscv64-unknown-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hello-native.dir/eapp/eapp_native.c.o   -c /keystone/sdk/examples/hello-native/eapp/eapp_native.c

examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hello-native.dir/eapp/eapp_native.c.i"
	cd /keystone/sdk/build/examples/hello-native && /keystone/riscv64/bin/riscv64-unknown-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /keystone/sdk/examples/hello-native/eapp/eapp_native.c > CMakeFiles/hello-native.dir/eapp/eapp_native.c.i

examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hello-native.dir/eapp/eapp_native.c.s"
	cd /keystone/sdk/build/examples/hello-native && /keystone/riscv64/bin/riscv64-unknown-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /keystone/sdk/examples/hello-native/eapp/eapp_native.c -o CMakeFiles/hello-native.dir/eapp/eapp_native.c.s

examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.requires:

.PHONY : examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.requires

examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.provides: examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.requires
	$(MAKE) -f examples/hello-native/CMakeFiles/hello-native.dir/build.make examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.provides.build
.PHONY : examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.provides

examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.provides.build: examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o


# Object files for target hello-native
hello__native_OBJECTS = \
"CMakeFiles/hello-native.dir/eapp/eapp_native.c.o"

# External object files for target hello-native
hello__native_EXTERNAL_OBJECTS =

examples/hello-native/hello-native: examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o
examples/hello-native/hello-native: examples/hello-native/CMakeFiles/hello-native.dir/build.make
examples/hello-native/hello-native: ../build64/lib/libkeystone-eapp.a
examples/hello-native/hello-native: ../build64/lib/libkeystone-edge.a
examples/hello-native/hello-native: examples/hello-native/CMakeFiles/hello-native.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable hello-native"
	cd /keystone/sdk/build/examples/hello-native && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello-native.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/hello-native/CMakeFiles/hello-native.dir/build: examples/hello-native/hello-native

.PHONY : examples/hello-native/CMakeFiles/hello-native.dir/build

examples/hello-native/CMakeFiles/hello-native.dir/requires: examples/hello-native/CMakeFiles/hello-native.dir/eapp/eapp_native.c.o.requires

.PHONY : examples/hello-native/CMakeFiles/hello-native.dir/requires

examples/hello-native/CMakeFiles/hello-native.dir/clean:
	cd /keystone/sdk/build/examples/hello-native && $(CMAKE_COMMAND) -P CMakeFiles/hello-native.dir/cmake_clean.cmake
.PHONY : examples/hello-native/CMakeFiles/hello-native.dir/clean

examples/hello-native/CMakeFiles/hello-native.dir/depend:
	cd /keystone/sdk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /keystone/sdk /keystone/sdk/examples/hello-native /keystone/sdk/build /keystone/sdk/build/examples/hello-native /keystone/sdk/build/examples/hello-native/CMakeFiles/hello-native.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/hello-native/CMakeFiles/hello-native.dir/depend

