#!/bin/bash

# Install the package
pip install -i https://test.pypi.org/simple/ DevFetch==1.0.0

# Get the directory where the script is installed
installDir=$(dirname "$(command -v s)")

# Add the directory to the system's PATH based on the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "export PATH=\"$installDir:\$PATH\"" >> ~/.bashrc
    source ~/.bashrc
    echo "Package installed and added to PATH successfully."
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "export PATH=\"$installDir:\$PATH\"" >> ~/.bash_profile
    source ~/.bash_profile
    echo "Package installed and added to PATH successfully."
else
    echo "Unsupported operating system."
fi