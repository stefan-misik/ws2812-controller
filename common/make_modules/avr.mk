# Makefile build module for building code for AVR processors
# Author: Stefan Misik

# THIS MODULE CONFIGURES THE BUILD ENVIRONMENT FOR BUILDING CODE FOR AVR
# PROCESSORS USING GNU TOOLCHAIN

################################################################################
# Module input variables
################################################################################

# AVR MCU model (e.g. atmega328p)
AVR_MODEL ?=

################################################################################
# Module definitions
################################################################################

TOOLCHAIN_PREFIX = avr

AVR_CPUFLAGS = -mmcu=$(AVR_MODEL)

ifeq ($(AVR_MODEL),atmega328p)
    DEFINE += __AVR_ATmega328P__
endif

# Apply CPU-related flags flags
CFLAGS   += $(AVR_CPUFLAGS)
CXXFLAGS += $(AVR_CPUFLAGS)
LDFLAGS  += $(AVR_CPUFLAGS)

# Place each function or data into its own section and allow them to be
# collected by garbage collector to reduce size of the binary
CFLAGS   += -ffunction-sections -fdata-sections
CXXFLAGS += -ffunction-sections -fdata-sections
LDFLAGS  += -Wl,--gc-sections
# Generate map with cross reference table
LDFLAGS += -Wl,-Map=$(BUILDDIR)/$(PROJ).map -Wl,--cref
CLEANUP += $(BUILDDIR)/$(PROJ).map

## Additional rules to make binary firmware packages
# Hex output
hex: $(basename $(OUT)).hex

$(basename $(OUT)).hex: $(OUT)
	$(OCP) --strip-all $< -O ihex $@

# Bin output
bin: $(basename $(OUT)).bin

$(basename $(OUT)).bin: $(OUT)
	$(OCP) --strip-all $< -O binary $@

.PHONY: hex bin
