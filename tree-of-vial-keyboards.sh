#!/bin/bash
#
# Prints a tree of all directories in keyboards/ that have a subdirectory with
# "vial" in its name, without the trailing /keymap/vial part of the path.
#
# Requires the `tree` program.

find keyboards -type d -name vial |
	sed 's\keymaps/vial\\g' |
	tree --fromfile -n
