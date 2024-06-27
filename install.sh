#!/bin/bash

# Function to add alias to the shell profile
add_alias() {
    PROFILE_PATH="$HOME/.bashrc"
    if [[ "$SHELL" == *"zsh"* ]]; then
        PROFILE_PATH="$HOME/.zshrc"
    fi

    echo "alias s='python -m DevFetch.script'" >> $PROFILE_PATH

    # Source the profile to apply changes
    source $PROFILE_PATH

    echo "Alias added successfully. You can now use 's' to execute the script."
}

# Function to install the package using pipx
install_with_pipx() {
    if ! command -v pipx &> /dev/null; then
        echo "pipx not found, installing pipx..."
        if command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm python-pipx
        elif command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y pipx
        elif command -v yum &> /dev/null; then
            sudo yum install -y pipx
        elif command -v zypper &> /dev/null; then
            sudo zypper install -y pipx
        else
            echo "Unsupported package manager. Please install pipx manually."
            exit 1
        fi
    fi

    pipx ensurepath
    source ~/.bashrc
    pipx install DevFetch
    if [ $? -ne 0 ]; then
        echo "pipx installation failed. Please make sure you have the necessary permissions and pipx is installed."
        exit 1
    fi
    echo "DevFetch installed successfully using pipx. You can now use 's' to execute the script."
}

# Function to check for Manjaro and provide instructions
check_manjaro() {
    if [ -f "/etc/manjaro-release" ]; then
        echo "Manjaro detected. Installing package with pipx."
        install_with_pipx
        exit 0
    fi
}

# Check if pip is installed, install it if not
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

# Check if the environment is Manjaro or Arch and handle accordingly
if [ -f "/etc/manjaro-release" ] || [ -f "/etc/arch-release" ]; then
    install_with_pipx
    exit 0
fi

# Install the package system-wide
pip install .

# Check if the installation was successful
if [ $? -ne 0 ]; then
    echo "Installation failed. Trying to install with pipx..."
    install_with_pipx
fi

# Add alias to the shell profile
add_alias

echo "DevFetch installed successfully. You can now use 's' to execute the script."