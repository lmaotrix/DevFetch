# Install the CLI tool
pip install .

# Create an alias for CLI tool
Add-Content -Path $PROFILE.AllUsersAllHosts -Value "`nfunction s { & devfetch }"

Write-Host "DevFetch installed successfully. You can now use 's' to execute the script."

# Grant execution permissions to the script
attrib +x install.ps1