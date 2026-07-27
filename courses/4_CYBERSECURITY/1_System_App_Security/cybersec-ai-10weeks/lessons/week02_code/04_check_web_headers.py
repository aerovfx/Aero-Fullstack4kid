# 04_check_web_headers.py

import requests

url = "https://example.com"

response = requests.get(url)

print("Status:", response.status_code)

headers = [
    "Server",
    "X-Frame-Options",
    "Content-Security-Policy",
    "Strict-Transport-Security"
]

for h in headers:
    print(f"{h}: {response.headers.get(h)}")