# Makefile for embedded part of WS2812B Controller

# First define common directory path and intended version
COMMON_DIR = ../common
# Include common build environment definitions
include $(COMMON_DIR)/environment.mk

CC     = avr-gcc
CXX    = avr-g++
OBJCPY = avr-objcopy
OBJDMP = avr-objdump
SIZE   = avr-size
AD     = avrdude

# GCC MCU
DEF_FREQ = 20000000
# Avrdude part name
PART = m328p
# Avrdude programmer name
PROG = usbasp
# Avrdude port name
PORT = usb

# Project name
PROJ = ws2812-controller
# Source files
SRC  = device/lcd.cpp device/output.cpp device/keypad.cpp  \
       device/time_service.cpp device/led_controller.cpp  \
       tools/timer.cpp tools/button_filter.cpp tools/generic_queue.cpp \
       system/input.cpp system/event_queue.cpp system/frame_buffer.cpp  \
       system/clock.cpp system/draw_context.cpp system/display_object.cpp  \
       system/control.cpp system/controls/tab.cpp system/controls/menu.cpp  \
       system/core.cpp visual/led_chain.cpp visual/animation.cpp  \
       application/screen/startup.cpp application/screen/control.cpp  \
       application/screen/settings.cpp application/screen_union.cpp  \
       application/settings.cpp application/text.cpp  \
       application/core.cpp  \
       system.cpp main.cpp
DEFINE   = F_CPU=$(DEF_FREQ)UL
INCLUDE  = .
LDLIBS   =
CFLAGS   = -std=c99 -ggdb -O2
CXXFLAGS = -std=c++11 -ggdb -O2 -fno-exceptions
LDFLAGS  = -ggdb -O2
EXTDEP   =


################################################################################
$(call module_section_begin)

# AVR Atmega 328P
AVR_MODEL = atmega328p
$(call load_module, avr)


################################################################################
# Include common build rules
$(call load_rules)

.PHONY: stats prog fuses

stats: $(OUT)
	$(SIZE) -C --mcu=$(AVR_MODEL) $<

prog: $(basename $(OUT)).hex
	$(AD) -c $(PROG) -p $(PART) -P $(PORT) -U flash:w:$<:i

fuses:
	$(AD) -c $(PROG) -p $(PART) -P $(PORT) -B 10 -D             \
	    -U lfuse:w:0xFF:m -U hfuse:w:0xDE:m -U efuse:w:0xFF:m

postbuild: stats


