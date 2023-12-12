# Returns the directory of the current file.
THIS_PATH = \
	$(patsubst %/,%,$(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))

# Takes a list of variables and returns a list of those variables expanded.
expand_vars = $(foreach var,$(1),$($(var)))
