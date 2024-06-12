# Install the package
pip install -i https://test.pypi.org/simple/ DevFetch==1.0.0

# Get the directory where the script is installed
$installDir = Get-Command -Name s | Select-Object -ExpandProperty Source | Split-Path -Parent

# Add the directory to the system's PATH
$env:Path += ";$installDir"

Write-Host "Package installed and added to PATH successfully."