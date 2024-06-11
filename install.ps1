# Install the CLI tool
pip install .

# Define an alias for CLI tool
$aliasScript = @"
function s {
    & devfetch
}
"@

# Specify the path to the PowerShell profile
$profileDir = "$env:USERPROFILE\OneDrive\Documents\WindowsPowerShell"
$profilePath = Join-Path -Path $profileDir -ChildPath "profile.ps1"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $profileDir)) {
    New-Item -Path $profileDir -ItemType Directory -Force
}

# Create the profile file if it doesn't exist
if (-not (Test-Path -Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

# Add the alias to the PowerShell profile
Add-Content -Path $profilePath -Value $aliasScript

Write-Host "DevFetch installed successfully. You can now use 's' to execute the script."

# Grant execution permissions to the script
attrib +x install.ps1