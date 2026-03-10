#!/bin/bash
# STL Claude Code Installer
# Run this after cloning the repo

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing STL Claude Code..."
echo ""

# Shell RC files to check
SHELL_RCS=("$HOME/.zshrc" "$HOME/.bashrc" "$HOME/.bash_profile")
UPDATED_FILES=()

# Add to PATH in all existing shell RC files
for SHELL_RC in "${SHELL_RCS[@]}"; do
    if [[ -f "$SHELL_RC" ]]; then
        if ! grep -q 'stl-cc' "$SHELL_RC" 2>/dev/null; then
            echo "" >> "$SHELL_RC"
            echo '# STL Claude Code' >> "$SHELL_RC"
            echo "export PATH=\"$SCRIPT_DIR:\$PATH\"" >> "$SHELL_RC"
            UPDATED_FILES+=("$SHELL_RC")
            echo "Added to PATH in $SHELL_RC"
        else
            echo "Already in PATH in $SHELL_RC"
        fi
    fi
done

# Make available now
export PATH="$SCRIPT_DIR:$PATH"

# Run update
echo ""
"$SCRIPT_DIR/stl-cc" update

echo ""
echo "Restart your terminal for changes to take effect."
