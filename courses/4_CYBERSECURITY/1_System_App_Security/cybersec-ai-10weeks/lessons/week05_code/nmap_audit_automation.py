#!/usr/bin/env python3
"""
Python wrapper & Automation Script for Nmap Auditing (Week 5)
Strictly restricted to 127.0.0.1 (Localhost) for Safety Compliance.
"""

import subprocess
import json
import sys

TARGET = "127.0.0.1"

def run_nmap_scan():
    print(f"[+] Starting Safe Nmap Audit on {TARGET}...")
    
    # Nmap command options:
    # -sV: Version detection
    # -p 1-1000: Scan top 1000 ports
    # --open: Show only open ports
    cmd = ["nmap", "-sV", "--open", "-p", "1-1000", TARGET]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        print("\n=== NMAP SCAN RESULTS ===")
        print(result.stdout)
    except FileNotFoundError:
        print("[-] Error: 'nmap' command not found. Please install Nmap or run inside Kali Linux.")
    except subprocess.CalledProcessError as e:
        print(f"[-] Error executing Nmap: {e}")

if __name__ == "__main__":
    run_nmap_scan()
