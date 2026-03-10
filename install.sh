#!/bin/bash
# STL Claude Code Installer
# Run this after cloning the repo

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SHELL_RC="$HOME/.zshrc"

echo "Installing STL Claude Code..."
echo ""

# Add to PATH if not already there
if ! grep -q 'stl-cc' "$SHELL_RC" 2>/dev/null; then
    echo "" >> "$SHELL_RC"
    echo '# STL Claude Code' >> "$SHELL_RC"
    echo "export PATH=\"$SCRIPT_DIR:\$PATH\"" >> "$SHELL_RC"
    echo "Added to PATH"
else
    echo "Already in PATH"
fi

# Make available now
export PATH="$SCRIPT_DIR:$PATH"

# Run update
echo ""
"$SCRIPT_DIR/stl-cc" update
