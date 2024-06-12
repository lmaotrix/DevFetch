#!/bin/bash

# Install the CLI tool
pip install .

# Define an alias for CLI tool
aliasScript="alias s='devfetch'"

# Add the alias to the appropriate profile script
if [ -f "$HOME/.bashrc" ]; then
    echo "$aliasScript" >> "$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    echo "$aliasScript" >> "$HOME/.zshrc"
elif [ -f "$HOME/.profile" ]; then
    echo "$aliasScript" >> "$HOME/.profile"
else
    echo "No suitable profile file found to add the alias."
    echo "$aliasScript" >> "$HOME/.bashrc"
fi

# Source the profile script to make the alias available in the current session
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
elif [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
else
    echo "No suitable profile file found to source."
fi

echo "DevFetch installed successfully. You can now use 's' to execute the script."

# Grant execution permissions to the script
chmod +x install.sh




