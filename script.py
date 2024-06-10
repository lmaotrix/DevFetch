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

chrome_path = '/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'

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
    subprocess.run(['cmd.exe', '/c', 'start', chrome_path.replace('/', '\\'), url])

if __name__ == "__main__":
    create_url()