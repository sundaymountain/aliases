#!/bin/bash
# shunlink — Shell Script Uninstaller CLI
#
# Usage:
#   shunlink mycommand      # Removes ~/.local/bin/mycommand
#   shunlink myscript.sh    # Also works — strips .sh automatically
#
# What it does:
#   1. Validates input
#   2. Checks if command exists in ~/.local/bin/
#   3. Removes the file
#   4. Prints confirmation
#
# Edge cases handled:
#   - PATH line left alone (always)
#   - Strips .sh extension if provided
#   - Nonexistent target → exits with error
set -e
BIN_DIR="$HOME/.local/bin"
if [[ -z "$1" ]]; then
    echo "Error: No command name provided."
    echo "Usage: shunlink <command>"
    exit 1
fi
cmd_name="$(basename "${1%.sh}")"
target="$BIN_DIR/$cmd_name"
if [[ ! -f "$target" ]]; then
    echo "Error: '$cmd_name' not found in $BIN_DIR."
    exit 1
fi
rm "$target"
echo "Removed '$cmd_name' from $BIN_DIR."
