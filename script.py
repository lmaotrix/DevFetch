import subprocess
import webbrowser
import sys
import os

valid_websites = [
    'reddit.com',
    'stackoverflow.com',
    'stackexchange.com',
    'medium.com',
    'github.com'
]


url = "https://www.google.com/search?q="

chrome_paths = {
    'Windows': r'C:\Program Files\Google\Chrome\Application\chrome.exe',
    'Darwin': '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    'Linux': '/usr/bin/google-chrome',
    'WSL': r'/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'
}


def get_chrome_path():
    if os.name == 'nt':
        return chrome_paths['Windows']
    elif os.name == 'posix':
        if 'Microsoft' in os.uname().release:
            return chrome_paths['WSL']
        elif sys.platform == 'darwin':
            return chrome_paths['Darwin']
        else:
            return chrome_paths['Linux']
    else:
        return None


def create_filter():
    filter = '('
    for index, website in enumerate(valid_websites):
        filter += 'site: ' + website
        if index == len(valid_websites) - 1:
            filter += ')'
        else:
            filter += ' OR '
    return filter


def create_query():
    query = sys.argv[1:]
    return ' '.join(query)


def create_url():
    if len(sys.argv[1:]) == 0:
        print("Error: Please enter a valid query")
    else:
        final_url = url + create_query() + ' ' + create_filter()
        open_with_chrome(final_url)


def open_with_chrome(url):
    chrome_path = get_chrome_path()
    if chrome_path and os.path.isfile(chrome_path):
        try:
            if os.name == 'nt' or ('Microsoft' in os.uname().release and sys.platform != 'darwin'):
                subprocess.run(['cmd.exe', '/c', 'start', chrome_path.replace('/', '\\'), url], stderr=subprocess.DEVNULL)
            else:
                subprocess.run([chrome_path, url], stderr=subprocess.DEVNULL)
        except Exception as e:
            print(f"Error opening Chrome: {e}")
            webbrowser.open(url)
    else:
        webbrowser.open(url)
    

if __name__ == "__main__":
    create_url()