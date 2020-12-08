
################################################################################
# Commands
################################################################################

# Change directory command
CD = cd
# Awk tool
AWK = awk

# Prefix to run executables in current directory
ifneq ($(findstring windows,$(BUILDENV)),)
CMD_PREFIX =
else
CMD_PREFIX = ./
endif

################################################################################
# Prepare variables
################################################################################

# Test binaries
TEST_OUTS = $(addsuffix $(OUT_EXT),$(addprefix $(BUILD_ROOT)/,$(TEST_LIST)))

# Directory containing the final build
BUILDDIR  = $(BUILD_ROOT)/$(TEST)
# Output file
OUT       = $(BUILD_ROOT)/$(TEST)$(OUT_EXT)

SRC       = $(TEST_SRC__$(TEST)) $(TEST_SRC)
INCLUDE   = $(TEST_INCLUDE__$(TEST)) $(TEST_INCLUDE)
LDLIBS    = -lCppUTest -lCppUTestExt
LDFLAGS   =
CFLAGS   += -O0 -ggdb -Wall
CXXFLAGS += -O0 -ggdb -Wall -std=c++14

TEST_CMD_ARGS = $(TEST_ARGS) $(TEST_ARGS__$(TEST))
ifeq ($(JUNIT_REPORT),yes)
TEST_CMD_ARGS += -ojunit -k$(TEST)
endif

ifeq ($(strip $(call do_coverage)),yes)
LDFLAGS  += --coverage
CFLAGS   += --coverage
CXXFLAGS += --coverage
endif

ifeq ($(strip $(TEST_STATIC_LINK)),yes)
    LDFLAGS += -static
endif

################################################################################
# Rules
################################################################################

.DEFAULT_GOAL = all

.PHONY: all clean

ifneq ($(TEST),)
### Test build

# Verify that the chosen test exists
ifeq ($(filter $(TEST),$(TEST_LIST)),)
$(error Test '$(TEST)' does not exist)
endif

all: $(OUT)
ifneq ($(strip $(TEST_JUST_BUILD)),yes)
ifeq ($(strip $(TEST_COVERAGE)),html)
	$(RM) $(OBJ:.o=.gcda)
endif
	$(CD) $(dir $<) && $(CMD_PREFIX)$(notdir $<) $(TEST_CMD_ARGS)
ifeq ($(strip $(TEST_COVERAGE)),std)
	$(PYTHON3) -m gcovr $(TEST_GCOVR__$(TEST)) | $(AWK) -P '  \
		{  \
			if ($$0 ~ /^TOTAL +[0-9]+/ && $$2 > 0)  \
				{ printf "TOTAL %42d %7d %5.2f%%\n",  \
					$$2, $$3, ($$3 / $$2) * 100 }  \
			else  \
				{ print $$0 }  \
		}'
endif
ifeq ($(strip $(TEST_COVERAGE)),html)
	$(PYTHON3) -m gcovr $(TEST_GCOVR__$(TEST)) --html-details \
	    -o $(BUILD_ROOT)/$(TEST).html
endif
endif

else
### Test management

# All test
all: $(TEST_OUTS)

# Specific test
$(TEST_OUTS):
	$(MAKE) TEST=$(basename $(notdir $@)) TEST_COVERAGE=$(TEST_COVERAGE)
endif

clean:
	$(RM) -r $(BUILD_ROOT)
