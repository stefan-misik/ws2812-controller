
################################################################################
# Prepare variables
################################################################################

## Target needs to update soem variables for debugging
ifeq ($(call is_debug),yes)
DEFINE   += _DEBUG DEBUG $(DEBUGDEFINE)
CFLAGS   += -g3 -Wall
CXXFLAGS += -g3 -Wall
LDFLAGS  +=
endif

################################################################################
# Rules
################################################################################

build: $(OUT)

clean:
	$(RM) -r Release Debug

.PHONY: clean
