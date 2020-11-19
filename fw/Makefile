# Makefile for embedded part of WS2812B Controller

CC     = avr-gcc
CXX    = avr-g++
OBJCPY = avr-objcopy
OBJDMP = avr-objdump
SIZE   = avr-size
AD     = avrdude

# GCC MCU
MCU      = atmega328p
DEF_FREQ = 16000000
DEF_MCU  = AVR_ATmega328P
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
       device/time_service.cpp  \
       system/input.cpp  \
       tools/timer.cpp tools/button_filter.cpp  \
       system.cpp main.cpp

CPPFLAGS  = -I. -DF_CPU=$(DEF_FREQ)UL -D__$(DEF_MCU)__
CFLAGS    = -c -ggdb -O2 -mmcu=$(MCU)
CXXFLAGS  = -c -ggdb -O2 -std=c++14 -fno-exceptions -mmcu=$(MCU)
LDFLAGS   = -ggdb -O2 -mmcu=$(MCU)
LDLIBS    =
SIZEFLAGS = -C --mcu=$(MCU)

################################################################################
OBJ = $(addsuffix .o, $(basename $(SRC)))
DEP = $(OBJ:.o=.d)

.PHONY: all clean stats prog fuses

all: $(PROJ).elf $(PROJ).hex $(PROJ).lss stats

ifeq ($(findstring clean,$(MAKECMDGOALS)),)
-include $(DEP)
endif

stats: $(PROJ).elf
	$(SIZE) $(SIZEFLAGS) $<

prog: $(PROJ).hex
	$(AD) -c $(PROG) -p $(PART) -P $(PORT) -U flash:w:$<:i

fuses:
	$(AD) -c $(PROG) -p $(PART) -P $(PORT) -B 10 -D             \
	    -U lfuse:w:0xFF:m -U hfuse:w:0xDE:m -U efuse:w:0xFF:m

$(PROJ).elf: $(OBJ)
	$(CXX) $(LDFLAGS) $(OBJ) -o $@ $(LOADLIBES) $(LDLIBS)

$(PROJ).hex: $(PROJ).elf
	$(OBJCPY) -R .eeprom -O ihex $< $@

$(PROJ).lss: $(PROJ).elf
	$(OBJDMP) -h -S $<  > $@

%.d: %.c
	$(CC) -MM $(CPPFLAGS) $(CFLAGS) $< -MF $@

%.d: %.cpp
	$(CXX) -MM $(CPPFLAGS) $(CXXFLAGS) $< -MF $@

clean:
	$(RM) $(PROJ).elf $(PROJ).hex $(PROJ).lss $(OBJ) $(DEP)

