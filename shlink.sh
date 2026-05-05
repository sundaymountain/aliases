#!/bin/bash
# shlink — Shell Script Installer CLI
#
# Location: ~/.local/bin/shlink
#
# Usage:
#   shlink ./myscript.sh              # Copies to ~/.local/bin/myscript, makes executable
#   shlink ./myscript.sh mycommand    # Copies to ~/.local/bin/mycommand, makes executable
#
# What it does:
#   1. Validates input (file exists, is a .sh file)
#   2. mkdir -p ~/.local/bin
#   3. Detects shell config (~/.bashrc or ~/.zshrc), adds export PATH="$HOME/.local/bin:$PATH" if not already present
#   4. Copies the .sh file to ~/.local/bin/ (strips .sh extension by default, or uses custom name)
#   5. chmod +x on the copied file
#   6. Prints confirmation with the command to use
#
# Edge cases handled:
#   - PATH already in config → skips adding duplicate
#   - Custom name provided → uses it instead of stripping .sh
#   - Invalid file path → exits with error
set -e
BIN_DIR="$HOME/.local/bin"
if [[ -z "$1" ]]; then
    echo "Error: No input file provided."
    echo "Usage: shlink <script.sh> [custom-name]"
    exit 1
fi
if [[ ! -f "$1" ]]; then
    echo "Error: File '$1' not found."
    exit 1
fi
if [[ "$1" != *.sh ]]; then
    echo "Error: '$1' is not a .sh file."
    exit 1
fi
mkdir -p "$BIN_DIR"
if [[ -n "$2" ]]; then
    cmd_name="$2"
else
    cmd_name="$(basename "${1%.sh}")"
fi
dest="$BIN_DIR/$cmd_name"
cp "$1" "$dest"
chmod +x "$dest"
shell_config=""
if [[ -f ~/.zshrc ]]; then
    shell_config=~/.zshrc
elif [[ -f ~/.bashrc ]]; then
    shell_config=~/.bashrc
else
    echo "Warning: No shell config found (~/.bashrc or ~/.zshrc)."
    echo "Add $BIN_DIR to your PATH manually."
fi
if [[ -n "$shell_config" ]]; then
    if ! grep -q '\.local/bin' "$shell_config"; then
        echo '' >> "$shell_config"
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$shell_config"
        echo "Added $BIN_DIR to $shell_config"
    fi
fi
echo ""
echo "Installed! Run with: $cmd_name"
if [[ -n "$shell_config" ]]; then
    echo "Restart terminal or run: source $shell_config"
fi
