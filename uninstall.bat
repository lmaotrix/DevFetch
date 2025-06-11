@echo off
setlocal

REM Uninstall the CLI tool
echo Uninstalling DevFetch...
pip uninstall -y DevFetch

REM Dynamically get PowerShell profile path
for /f "delims=" %%I in ('powershell -NoProfile -Command "$PROFILE"') do set "profilePath=%%I"

REM Remove the alias from the PowerShell profile if it exists
if exist "%profilePath%" (
    powershell -NoProfile -Command "(Get-Content -Path '%profilePath%') | Where-Object { $_ -notmatch 'function s \{ python -m DevFetch\.script' } | Set-Content -Path '%profilePath%'"
    echo Removed 's' alias from PowerShell profile: %profilePath%
) else (
    echo PowerShell profile not found: %profilePath%
)

REM Optional notice about PATH cleanup
echo.
echo If you added DevFetch's Scripts directory to PATH manually, you may want to remove it.
echo You can also open System Properties > Environment Variables to do this manually.

echo.
echo  DevFetch uninstalled successfully.
pause
