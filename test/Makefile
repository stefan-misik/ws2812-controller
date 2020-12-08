# Testing makefile
# Author: Stefan Misik

# First define common directory path and intended version
COMMON_DIR = ../common
# Project variant
VARIANT = test
# Include common build environment definitions
include $(COMMON_DIR)/environment.mk

define tested_source
main_unit/$(1) ../fw/$(1)
endef

# Settings common for all test binaries
TEST_SRC     = common_main.cpp
TEST_COV     =
TEST_INCLUDE = .
TEST_ARGS    =
CXXFLAGS     = -fno-exceptions

# Tests of main functionality
TEST_SRC__main     =   \
    $(call tested_source,tools/generic_queue.cpp)
TEST_GCOVR__main   = -f ../fw
TEST_INCLUDE__main = ../fw
TEST_ARGS__main    =
$(call register_test,main)


$(call load_rules)
