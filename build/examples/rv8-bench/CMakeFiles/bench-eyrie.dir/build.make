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

# Utility rule file for bench-eyrie.

# Include the progress variables for this target.
include examples/rv8-bench/CMakeFiles/bench-eyrie.dir/progress.make

examples/rv8-bench/CMakeFiles/bench-eyrie: examples/rv8-bench/.options_log
examples/rv8-bench/CMakeFiles/bench-eyrie: examples/rv8-bench/eyrie-rt


examples/rv8-bench/.options_log: examples/rv8-bench/runtime/src/eyrie-bench-eyrie/.options_log
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating .options_log"
	cd /keystone/sdk/build/examples/rv8-bench && cp /keystone/sdk/build/examples/rv8-bench/runtime/src/eyrie-bench-eyrie/.options_log .options_log

examples/rv8-bench/eyrie-rt: examples/rv8-bench/runtime/src/eyrie-bench-eyrie/eyrie-rt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/keystone/sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating eyrie-rt"
	cd /keystone/sdk/build/examples/rv8-bench && cp /keystone/sdk/build/examples/rv8-bench/runtime/src/eyrie-bench-eyrie/eyrie-rt eyrie-rt

bench-eyrie: examples/rv8-bench/CMakeFiles/bench-eyrie
bench-eyrie: examples/rv8-bench/.options_log
bench-eyrie: examples/rv8-bench/eyrie-rt
bench-eyrie: examples/rv8-bench/CMakeFiles/bench-eyrie.dir/build.make

.PHONY : bench-eyrie

# Rule to build all files generated by this target.
examples/rv8-bench/CMakeFiles/bench-eyrie.dir/build: bench-eyrie

.PHONY : examples/rv8-bench/CMakeFiles/bench-eyrie.dir/build

examples/rv8-bench/CMakeFiles/bench-eyrie.dir/clean:
	cd /keystone/sdk/build/examples/rv8-bench && $(CMAKE_COMMAND) -P CMakeFiles/bench-eyrie.dir/cmake_clean.cmake
.PHONY : examples/rv8-bench/CMakeFiles/bench-eyrie.dir/clean

examples/rv8-bench/CMakeFiles/bench-eyrie.dir/depend:
	cd /keystone/sdk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /keystone/sdk /keystone/sdk/examples/rv8-bench /keystone/sdk/build /keystone/sdk/build/examples/rv8-bench /keystone/sdk/build/examples/rv8-bench/CMakeFiles/bench-eyrie.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/rv8-bench/CMakeFiles/bench-eyrie.dir/depend

