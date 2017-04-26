part ?= patch

# Bump the version number
#
# "part" can be used to change the bump part, defaulting to "patch"
bump:
	@pip install --upgrade bumpversion
	@bumpversion $(part)
.PHONY: bump