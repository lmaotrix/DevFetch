# Install the CLI tool
pip install .

# Define an alias for CLI tool with the full path to devfetch script
$aliasScript = @"
function s {
    & devfetch
}
"@

# Specify the path to the PowerShell profile
$profilePath = [System.IO.Path]::Combine($env:USERPROFILE, 'OneDrive\Documents\WindowsPowershell\profile.ps1')

# Create the profile file if it doesn't exist
if (-not (Test-Path - Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

# Add the alias to the PowerShell profile
Add-Content -Path $profilePath -Value $aliasScript

# Source the profile to make the alias available in the current session
if (Test-Path -Path $profilePath) {
    . $profilePath
    Write-Host "Profile script executed successfully."
} else {
    Write-Host "Profile script not found at: $profilePath"
}


Write-Host "DevFetch installed successfully. You can now use 's' to execute the script."

# Grant execution permissions to the script
attrib +x install.ps1