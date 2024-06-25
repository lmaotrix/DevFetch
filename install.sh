#!/bin/bash

#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install the CLI tool
pip install .

# Determine the shell profile
if [ -n "$ZSH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
else
    SHELL_PROFILE="$HOME/.profile"
fi

# Add alias to the shell profile
echo 'alias s="python3 -m DevFetch.script"' >> $SHELL_PROFILE
source $SHELL_PROFILE

echo "DevFetch installed successfully. You can now use 's' to execute the script."