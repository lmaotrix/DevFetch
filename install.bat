@echo off

:: install the cli tool
pip install .

:: Add an alias to the powershell profile
set profilePath=%USERPROFILE%\OneDrive\Documents\WindowsPowerShell\profile.ps1
echo function s { python -m devfetch } >> %profilePath%