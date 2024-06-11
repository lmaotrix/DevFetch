#!/bin/bash

# Install the CLI tool
pip install .

# Create Alias for the CLI tool
echo "alias s='devfetch'" >> ~/.bashrc
source ~/.bashrc

echo "DevFetch installed successfully. You can now use 's' to execute the script."

# Grant execution permissions to the script
chmod +x install.sh