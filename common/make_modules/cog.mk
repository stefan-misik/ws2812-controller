# Makefile build module for generating source files using python Cog tool
# Author: Stefan Misik (stefan.misik@tescan.com)

# DEFINES RULES TO GENERATE SOURCE FILES USING COG PYTHON TOOL
#
# This tool requires python 3 to be installed with cog library. To install Cog,
# you can use the pip tool by executing.
#
# $ pip install cogapp
#
# To include a new Cog-generated file name the source file '*.cog.[c|cpp|inc]'.
# The generated file is named '*.cogout.[c|cpp|inc]'. These files can be easily
# ignored in gitigonre.
#
# Alternatively, this module can replace all registered files with re-generated
# versions by making 'recog' rule.
#

################################################################################
# Module input variables
################################################################################

# Cog source files (e.g. file.cog.c, file.cog.cpp, file.cog.inc)
COG_SRC     ?=
# Cog source files to be replaced with updated versions (e.g. file.inc)
COG_REPLACE ?=

################################################################################
# Module definitions
################################################################################


COG_OUT += $(patsubst %.cog.c,%.cogout.c,$(filter %.cog.c,$(COG_SRC))) \
           $(patsubst %.cog.cpp,%.cogout.cpp,$(filter %.cog.cpp,$(COG_SRC))) \
           $(patsubst %.cog.inc,%.cogout.inc,$(filter %.cog.inc,$(COG_SRC)))

RECOG_PHONY = $(addsuffix .recog_phony,$(COG_REPLACE))

# Generate rules
%.cogout.c: %.cog.c
	$(PYTHON3) -m cogapp -o $@ $<

%.cogout.cpp: %.cog.cpp
	$(PYTHON3) -m cogapp -o $@ $<

%.cogout.inc: %.cog.inc
	$(PYTHON3) -m cogapp -o $@ $<

# Replace rules
recog: $(RECOG_PHONY)

$(RECOG_PHONY):
	$(PYTHON3) -m cogapp -r $(patsubst %.recog_phony,%,$@)

ifeq ($(MAKECMDGOALS),recog)
    $(call dep_skip)
endif

SRC += $(filter-out %.inc,$(COG_OUT))
EXTDEP += $(filter %.inc,$(COG_OUT))
CLEANUP += $(COG_OUT)

.PHONY: recog $(RECOG_PHONY)
