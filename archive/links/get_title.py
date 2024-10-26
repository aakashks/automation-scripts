import requests
from bs4 import BeautifulSoup
import argparse


def scrape_title(html):
    """
    scrape title from an html(bs4) page
    """
    title = None
    if html.find("meta", property="og:title"):
        title = html.find("meta", property="og:title").get("content")
    elif html.title.string:
        title = html.title.string
    elif html.find("meta", property="twitter:title"):
        title = html.find("meta", property="twitter:title").get("content")
    elif html.find("h1"):
        title = html.find("h1").string
    return title


def get_title_from_url(url):
    """
    Extracts the title from any URL
    
    Args:
        url: The URL of the webpage.

    Returns:
        The title of the webpage, or None if the title cannot be found.
    """
    try:
        # Make a request to the URL
        response = requests.get(url)
        if response.status_code == 200:
            # Parse the HTML content using BeautifulSoup
            html = BeautifulSoup(response.content, "html.parser")
            title = scrape_title(html)
            # If the tag is found, return its content. Otherwise, return None.
            return title
        else:
            print(f"Error fetching URL: {url}")
            return None
    except Exception as e:
        print(f"Error extracting title from URL: {url}")
        print(e)
        return None


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--url", help="enter link")

    args = parser.parse_args()

    title = get_title_from_url(args.url)

    if title:
        print(f"Title of the webpage: {title}")
    else:
        print("Title not found")
