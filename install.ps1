# Install the CLI tool
pip install .

# Define an alias for CLI tool
$aliasScript = @"
function s {
    & devfetch
}
"@

# Add the alias to current user Powershell profile
$profilePath = $PROFILE.CurrentUserAllHosts
Add-Content -Path $profilePath -Value $aliasScript

Write-Host "DevFetch installed successfully. You can now use 's' to execute the script."

# Grant execution permissions to the script
attrib +x install.ps1