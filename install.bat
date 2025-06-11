@echo off

REM Install the CLI tool
pip install .

REM Get Scripts directory from Python
for /f "delims=" %%I in ('python -c "import site; print(site.USER_BASE + r'\Scripts')"') do set "scriptsDir=%%I"

REM Add Scripts directory to PATH if not already present
echo %PATH% | findstr /C:"%scriptsDir%" >nul || (
    setx PATH "%PATH%;%scriptsDir%"
    echo PATH updated. Please restart your command prompt.
)

REM Get PowerShell profile path using PowerShell
for /f "delims=" %%P in ('powershell -NoProfile -Command "$PROFILE"') do set "profilePath=%%P"

REM Create profile directory if it doesn't exist
powershell -Command "New-Item -Path (Split-Path -Parent '%profilePath%') -ItemType Directory -Force"

REM Add the alias to PowerShell profile
echo function s { python -m DevFetch.script @args } >> "%profilePath%"

echo.
echo DevFetch installed successfully.
echo Restart PowerShell to use the 's' command.
