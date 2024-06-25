@echo off

REM Install the CLI tool
pip install .

REM Get the directory where the scripts are installed
for /f "tokens=2 delims=: " %%I in ('pip show DevFetch ^| findstr /c:"Location"') do set "installDir=%%I"
set "scriptsDir=%installDir%\Scripts"

REM Add the scripts directory to the PATH if not already present
echo %PATH% | findstr /C:"%scriptsDir%" >nul || (
    setx PATH "%PATH%;%scriptsDir%"
    echo PATH updated. Please restart your command prompt.
)

REM Define the path to the PowerShell profile
set "profilePath=%USERPROFILE%\OneDrive\Documents\WindowsPowerShell\profile.ps1"

REM Create the profile file if it doesn't exist
if not exist "%profilePath%" (
    type nul > "%profilePath%"
)

REM Add the alias to the PowerShell profile
echo function s { python -m DevFetch.script $args } >> "%profilePath%"

echo DevFetch installed successfully. You can now use 's' to execute the script.