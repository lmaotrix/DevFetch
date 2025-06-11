# DevFetch

**DevFetch** is a lightweight command-line tool for developers to quickly search programming-related queries (like "how to center a div" or "how to use git branch") directly from the terminal.

Instead of switching to a browser, opening a new tab, and searching for the answer, you can simply use:

```powershell
s your question here
```
and DevFetch will open a browser tab with a relevant and filtered search result.

---

## Installation (Currently only for Windows)
1. **Clone this repository:**
```powershell
git clone https://github.com/lmaotrix/DevFetch.git
cd DevFetch
```
2. **Run the installer:**
```powershell
.\install.bat
```
this will:
- Install DevFetch using `pip`
- Add the package's `Scripts` folder to your system `PATH`
- Add the `s` alias to your Powershell profile (so you can run `s` instead of `python -m devfetch` from everywhere)
3. **Restart Powershell**, then try it out:
```powershell
s how to center a div
```
---
## Usage
Use the `s` command followed by your search query:
```powershell
s C++ how to reverse linked list
s how to use docker
s css flexbox  align center
```
DevFetch will open your default browser with a relevant Google search.
---

## Uninstallation
To remove DevFetch from your system, run the uninstaller:
```powershell
.\uninstall.bat
```
this will:
- Uninstall the DevFetch package
- Remove the `s` alias from your Powershell profile
---
## Project Structure
```bash
DevFetch/
├── DevFetch/
│   └── script.py         # Main logic
├── install.bat           # Windows install script
├── uninstall.bat         # Windows uninstall script
├── setup.py              # Python package config
└── README.md             # You're here!
```
---
