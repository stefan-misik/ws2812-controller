
################################################################################
# Commands
################################################################################

ifeq ($(BUILDENV),windows)
    # Create directory
    MKDIR = mkdir
else
    # Create directory
    MKDIR = mkdir
endif

# Select the toolchain
ifneq ($(TOOLCHAIN_PREFIX),)
AR  = $(TOOLCHAIN_PREFIX)-ar
AS  = $(TOOLCHAIN_PREFIX)-as
CC  = $(TOOLCHAIN_PREFIX)-gcc
CXX = $(TOOLCHAIN_PREFIX)-g++
OCP = $(TOOLCHAIN_PREFIX)-objcopy
SZ  = $(TOOLCHAIN_PREFIX)-size
else
AR  = ar
AS  = as
CC  = gcc
CXX = g++
OCP = objcopy
SZ  = size
endif

################################################################################
# Rules-local functions
################################################################################

## Remove the topmost directory from the path string
# $(1) Path string (e.g. dir_a/dir_b/dir_c/)
define remove_top_dir
$(if $(findstring /,$(1)),$(patsubst %/,%,$(dir $(patsubst %/,%,$(1)))),)
endef

## Generate list of sub-directory paths from directory path
# $(1) Path string (e.g. dir_a/dir_b/dir_c/)
define get_subdirs
$(if $(1),\
$(patsubst %/,%,$(1)) $(call get_subdirs,$(call remove_top_dir,$(1))),\
)
endef

## Make each directory from the list depend on its parent directory
define make_dirs_depend_on_their_parent
$(foreach DIR,$(1),$(eval \
$(DIR): | $(call remove_top_dir,$(DIR))))
endef


################################################################################
# Prepare auxiliary variables
################################################################################

# Object files
OBJ = $(call make_obj_files,$(SRC))

# List of directories containing object files
OBJDIRS = $(sort $(foreach DIR,$(sort $(dir $(OBJ) $(OUT))),$(call \
get_subdirs,$(DIR))))

# Dependencies
DEP = $(OBJ:.o=.d)

# Append defines to C Pre-Processor flags
CPPFLAGS += $(addprefix -D,$(DEFINE))
# Append include direcories to C Pre-Processor flags
CPPFLAGS += $(addprefix -I,$(INCLUDE))

# Files to be cleaned-up on 'make clean'
CLEANUP += $(OUT)

# Determine linker command
ifeq ($(findstring .cpp,$(suffix $(SRC))),)
    LINKER = $(CC)
else
    LINKER = $(CXX)
endif

################################################################################
# Rules
################################################################################

# Pull in dependency info (only if we are not cleaning)
ifeq ($(filter clean,$(MAKECMDGOALS)),)
    ifeq ($(INCLUDE_DEPS_IF_EMPTY),)
        -include $(DEP)
    endif
endif

# Dependency files also depend on object directories
$(DEP) $(OBJ): | $(OBJDIRS)

# Make sure directory creation is ordered during multi-thread build
$(call make_dirs_depend_on_their_parent,$(OBJDIRS))
# Create object directories
$(OBJDIRS):
ifeq ($(BUILDENV),windows)
	$(MKDIR) $(subst /,\,$@)
else
	$(MKDIR) $@
endif

# Invoke appropriate command to link the project
$(OUT): $(OUT).objlst $(EXTDEP)
	$(LINKER) $(LDFLAGS) @$< -o $@ $(LDLIBS)

# Object list file
$(OUT).objlst: $(OBJ)
	$(file >$@,$^)

# Enable second expansion
.SECONDEXPANSION:

# C source files compilation and dependency files
$(BUILDDIR)/%.o: $$(call fname_to_path,%.c)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BUILDDIR)/%.d: $$(call fname_to_path,%.c)
	@echo Generating dependency for $<
	@$(CC) -MM -MT $(@:.d=.o) $(CPPFLAGS) $(CFLAGS) $< -MF $@

# C++ (.cpp) source files compilation and dependency files
$(BUILDDIR)/%.o: $$(call fname_to_path,%.cpp)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

$(BUILDDIR)/%.d: $$(call fname_to_path,%.cpp)
	@echo Generating dependency for $<
	@$(CXX) -MM -MT $(@:.d=.o) $(CPPFLAGS) $(CXXFLAGS) $< -MF $@

# Assembly files compilation (by invoking C compiler)
$(BUILDDIR)/%.o: $$(call fname_to_path,%.s)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
