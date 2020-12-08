
################################################################################
# Common environment variables
################################################################################

# Project name
PROJ ?=

################################################################################
# Common environment functions
################################################################################

## Load module
# $(1) module name
define load_module
$(eval include $(COMMON_DIR)/make_modules/$(strip $(1)).mk)
endef

## Test if the current build is a debug one (evaluates to 'yes')
define is_debug
$(strip \
$(if $(findstring yes,$(strip $(DBG))),yes,\
$(if $(findstring no,$(strip $(DBG))),no,\
$(if $(findstring Debug,$(BUILD_CONFIGURATION)),yes,\
no))))
endef

################################################################################
# Build environment-private functions
################################################################################

################################################################################
# Prepare variables
################################################################################

# Make sure ARM GCC toolchain is being used
TOOLCHAIN_PREFIX =
OUTSUFFIX = .elf

# Directory containing the final build
ifeq ($(call is_debug),yes)
    BUILDDIR = Debug
else
    BUILDDIR = Release
endif

# Output file
OUT      ?= $(BUILDDIR)/$(PROJ)$(OUTSUFFIX)
# Changelog file
CHANGELOG = $(BUILDDIR)/$(PROJ)-changes.log

################################################################################
# Build process phases
################################################################################
all: prebuild build postbuild

.PHONY: all prebuild build postbuild

