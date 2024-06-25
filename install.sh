#!/bin/bash

# Install the package
pip install .

# Add alias to the bash profile
echo 'alias s="python3 -m devfetch"' >> ~/.bashrc

# For zsh users
echo 'alias s="python3 -m devfetch"' >> ~/.zshrc

# Reload the bash profile
source ~/.bashrc

echo "DevFetch installed successfully. You can now use 's' to execute the script."