#!/bin/bash

# Function to add alias to shell profile
add_alias() {
    PROFILE_PATH="$HOME/.bashrc"
    if [["$SHELL" == "zsh"* ]]; then
        PROFILE_PATH="$HOME/.zshrc"
    fi

    echo "alias s='python -m DevFetch.script'" >> $PROFILE_PATH

    # Source the profile to apply changes
    source $PROFILE_PATH

    echo "Alias added successfully. You can now use 's' to execute the script."
}

# Function to install the package in user space
install_user_package() {
    pip install --user .
    if [ $? -ne 0 ]; then
        echo "Installation failed. Please make sure you have the necessary permissions and pip is installed."
        exit 1
    fi
    add_alias
    echo "DevFetch installed successfully. You can now use 's' to execute the script."
}

# Function to check for manjaro and provide instructions
check_manjaro() {
    if [ -f "/etc/manjaro-release" ]; then
        echo "Manjaro detected. Installing package in user space."
        install_user_package
        exit 0
    fi
}

if ! command -v pip &> /dev/null; then
    echo "pip not found, installing pip..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y python3-pip
    elif command -v yum &> /dev/null; then
        sudo yum install -y python3-pip
    elif command -v pacman &> /dev/null; then
        sudo pacman -Syu --noconfirm python-pip
    elif command -v zypper &> /dev/null; then
        sudo zypper install -y python3-pip
    else
        echo "Unsupported package manager. Please install pip manually."
        exit 1
    fi
fi

# Check if the environment is manjaro and handle
check_manjaro

# Install the package system-wide
pip install .

# Check if the installation is successful
if [ $? -ne 0 ]; then
    echo "Installation failed. Trying to install in user space..."
    install_user_package
 fi

 # Add alias to the shell profile
 add_alias

 echo "DevFetch successfully installed. You can now use 's' to execute the script."