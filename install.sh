#!/bin/bash
# STL Claude Code Installer
# curl -fsSL https://raw.githubusercontent.com/socialtechnologylab/stl-cc/main/install.sh | bash

set -e

REPO="https://github.com/socialtechnologylab/stl-cc.git"
INSTALL_DIR="$HOME/.stl-cc"
SHELL_RC="$HOME/.zshrc"

echo "Installing STL Claude Code..."
echo ""

# Clone or update repo
if [ -d "$INSTALL_DIR" ]; then
    echo "Updating repo..."
    git -C "$INSTALL_DIR" pull --ff-only
else
    echo "Cloning repo..."
    git clone "$REPO" "$INSTALL_DIR"
fi

# Add to PATH if not already there
if ! grep -q 'stl-cc' "$SHELL_RC" 2>/dev/null; then
    echo "" >> "$SHELL_RC"
    echo '# STL Claude Code' >> "$SHELL_RC"
    echo 'export PATH="$HOME/.stl-cc:$PATH"' >> "$SHELL_RC"
    echo "Added stl-cc to PATH"
fi

# Source to make available now
export PATH="$HOME/.stl-cc:$PATH"

# Run update
echo ""
stl-cc update
