
################################################################################
# Common environment variables
################################################################################

# Test source files common to all test binaries
TEST_SRC             ?=
# Files to be examined for code coverage (these can be header files) common to
# all test binaries
TEST_COV             ?=
# Include directories common to all test binaries
TEST_INCLUDE         ?=
# Parameters passed to each test in the project
TEST_ARGS            ?=
# List of test binaries
TEST_LIST            ?=
# Skip execution of test binaries
TEST_JUST_BUILD      ?=
# Generate test coverage (set to 'std' for standard output report,
# 'html' for html report)
TEST_COVERAGE        ?=
# Static linkage of the test binary (set to 'yes')
TEST_STATIC_LINK     ?=
# Test-related sources
# TEST_SRC__name     ?=
# Files to be examined for code coverage (these can be header files)
# TEST_GCOVR__name   ?=
# Test-related include directories
# TEST_INCLUDE__name ?=
# Parameters passed to the test binary
# TEST_ARGS__name    ?=

################################################################################
# Test Functions
################################################################################

## Register test executable
# $(1) Test name
define register_test
$(eval TEST_LIST += $(1))
endef

################################################################################
# Build environment-private variables
################################################################################

# List of available tests
TEST_LIST ?=
# Root directory for testing binaries and reports
BUILD_ROOT = build

################################################################################
# Build environment-private functions
################################################################################

## Function will return 'yes' if test coverage is requested, 'no' otherwise.
define do_coverage
$(if $(findstring std,$(TEST_COVERAGE))$(findstring \
html,$(TEST_COVERAGE)),yes,no)
endef

################################################################################
# Prepare variables
################################################################################

ifneq ($(findstring windows,$(BUILDENV))$(findstring cygwin,$(BUILDENV)),)
OUT_EXT = .exe
else
OUT_EXT = .out
endif
