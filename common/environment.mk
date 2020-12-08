
################################################################################
# Common environment variables
################################################################################

# Path to directory containing common build resources
COMMON_DIR ?=
# List of source files
SRC        ?=
# List of macros to be defined
DEFINE     ?=
# List of include directories
INCLUDE    ?=
# List of files to be removed on 'make clean'
CLEANUP    ?=
# Additional build dependencies of the output file (such as linker script file, etc.)
EXTDEP     ?=
# Build environment variant (e.g. 'test')
VARIANT    ?= embedded
# Directory containing all the builds
BUILDROOT  ?= build

## Generic tools used by build environment
# Command to run python scripts
PYTHON3    ?= python3

################################################################################
# Check the build environment
################################################################################

# Check Make tool features
define check_feature
$(if $(findstring $(1),$(.FEATURES)),,$(error Make feature '$(1)' is \
required. Please update your version of Make tool.))
endef
$(call check_feature,order-only)
$(call check_feature,second-expansion)
$(call check_feature,target-specific)


################################################################################
# Common environment functions
################################################################################

## Include common build rules
define load_rules
$(eval include $(COMMON_DIR)/variants/$(VARIANT).rules.mk) \
$(eval include $(COMMON_DIR)/rules.mk)
endef

## Use sed to collapse unnecessary parent directories, e.g.
## '../common/..shared' => '../shared'
# $(1) Path to be collapsed
define collapse_parentdirs
$(shell echo "$(1)" | sed -e ":loop;s/[a-zA-Z0-9._-]*\/\.\.\///g;t loop")
endef

## Function used to convert paths to filenames to be used e.g. to generate
## object filenames for given source files.
# $(1) List of file paths to convert
define path_to_fname
$(subst ..,$(PARENT_DIR),$(1))
endef

## Function used to convert filenames back to path to original file. This
## function needs to be an inverse to 'path_to_fname' function.
# $(1) List of filenames to convert back to original file paths
define fname_to_path
$(subst $(PARENT_DIR),..,$(1))
endef

## Build list of object files from provided list of source files
# $(1) List of source (*.c, *.cpp, *.cc, *.s) files
define make_obj_files
$(addsuffix .o,$(addprefix $(BUILDDIR)/,$(call path_to_fname,$(basename \
$(1)))))
endef

## Build list of dependency files from provided list of source files
# $(1) List of source (*.c, *.cpp, *.cc, *.s) files
define make_depend_files
$(patsubst %.o,%.d,$(call make_obj_files,$(1)))
endef

## Verify wheather current invokation of make is building the binary
define is_building
$(strip $(if $(findstring clean,$(MAKECMDGOALS)),no,yes))
endef

## Call from project's Makefile to ignore specified warning types
# $(1) List of source files (*.c, *.cpp) which warning should be suppressed
# $(2) List of ignore types (see -W* compiler switches) to ignore
#      (e.g. unused-variable switch)
define ignore_warnings
$(eval $(call make_obj_files,$(1)): CXXFLAGS += $(addprefix -Wno-,$(2))) \
$(eval $(call make_obj_files,$(1)): CFLAGS += $(addprefix -Wno-,$(2)))
endef

## Call from project's Makefile to add specific defines
# $(1) List of source files (*.c, *.cpp) which warning should be suppressed
# $(2) List of defines to be added for specified files
define add_defines
$(eval $(call make_obj_files,$(1)): CPPFLAGS += $(addprefix -D,$(2))) \
$(eval $(call make_depend_files,$(1)): CPPFLAGS += $(addprefix -D,$(2)))
endef

## Call from project's Makefile to add specific includes
# $(1) List of source files (*.c, *.cpp) which warning should be suppressed
# $(2) List of include directories to be added for specified files
define add_includes
$(eval $(call make_obj_files,$(1)): CPPFLAGS += $(addprefix -I,$(2))) \
$(eval $(call make_depend_files,$(1)): CPPFLAGS += $(addprefix -I,$(2)))
endef

################################################################################
# Build environment-private variables
################################################################################

# Variable used to determine whether to include dependency files
INCLUDE_DEPS_IF_EMPTY ?=
# The suffix of the output binary file
OUTSUFFIX ?=
# Name of the directory used as substitute inside build directory for '..'
PARENT_DIR = _PARENT_DIR_
# The directory that will contain built binaries
BUILDDIR ?=

################################################################################
# Build environment-private functions
################################################################################

## Call to skip dependency file inclusion / building
define dep_skip
$(eval INCLUDE_DEPS_IF_EMPTY = x)
endef

################################################################################
# Prepare variables
################################################################################

# Select the toolchain

# Build Environment type
ifeq ($(OS),Windows_NT)
    ifeq ($(findstring mingw32,$(shell $(MAKE) -v)),)
        ifeq ($(shell uname -o),Cygwin)
            BUILDENV ?= cygwin
        else
            BUILDENV ?= unknown
        endif
    else
        BUILDENV ?= windows
    endif
else
    BUILDENV ?= unknown
endif

################################################################################
# Load the target definitions
################################################################################

include $(COMMON_DIR)/variants/$(VARIANT).environment.mk
