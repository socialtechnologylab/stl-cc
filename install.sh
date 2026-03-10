#!/bin/bash
# STL Claude Code Installer
# curl -fsSL https://raw.githubusercontent.com/socialtechnologylab/stl-cc/main/install.sh | bash

set -e

REPO="https://github.com/socialtechnologylab/stl-cc.git"
INSTALL_DIR="$HOME/code/stl-cc"
SHELL_RC="$HOME/.zshrc"

echo "Installing STL Claude Code..."
echo ""

# Clone or update repo
if [ -d "$INSTALL_DIR/.git" ]; then
    echo "Updating repo..."
    git -C "$INSTALL_DIR" pull --ff-only
else
    echo "Cloning repo..."
    mkdir -p "$HOME/code"
    rm -rf "$INSTALL_DIR"
    git clone "$REPO" "$INSTALL_DIR"
fi

# Add to PATH if not already there
if ! grep -q 'stl-cc' "$SHELL_RC" 2>/dev/null; then
    echo "" >> "$SHELL_RC"
    echo '# STL Claude Code' >> "$SHELL_RC"
    echo 'export PATH="$HOME/code/stl-cc:$PATH"' >> "$SHELL_RC"
    echo "Added to PATH"
fi

# Make available now
export PATH="$INSTALL_DIR:$PATH"

# Run update
echo ""
"$INSTALL_DIR/stl-cc" update
