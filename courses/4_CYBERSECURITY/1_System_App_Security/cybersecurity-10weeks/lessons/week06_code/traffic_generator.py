#!/usr/bin/env python3
"""
Safe Local Traffic Generator for Wireshark Practice (Week 6)
Sends test HTTP requests to 127.0.0.1 to allow students to practice Wireshark filtering.
"""

import urllib.request
import time

TARGET_URL = "http://127.0.0.1:8080" # Localhost test URL

def generate_local_traffic():
    print(f"=== GENERATING SAFE LOCAL TEST TRAFFIC ON {TARGET_URL} ===")
    print("[+] Open Wireshark and set filter to: tcp.port == 8080")
    
    for i in range(1, 6):
        print(f"[+] Sending request #{i}...")
        try:
            req = urllib.request.Request(TARGET_URL, headers={'User-Agent': 'Wireshark-Lab-Bot/1.0'})
            with urllib.request.urlopen(req, timeout=1) as response:
                pass
        except Exception:
            # Expected if local web server is not running, traffic packets still generated
            pass
        time.sleep(1)

    print("[+] Done generating traffic. Check Wireshark capture window!")

if __name__ == "__main__":
    generate_local_traffic()
