#!/usr/bin/env python3
"""
Local Service & Port Auditor Script for Kali Linux (Week 5)
Checks listening services on 127.0.0.1 and generates defensive recommendations.
"""

import subprocess
import re

def check_listening_services():
    print("=== LOCALHOST DEFENSIVE SERVICE AUDITOR ===")
    print("[+] Checking listening network ports on 127.0.0.1...")
    
    try:
        # Run netstat or ss command to list listening ports
        output = subprocess.check_output(["ss", "-tulpn"], text=True)
        lines = output.split('\n')
        
        listening_ports = []
        for line in lines:
            if "LISTEN" in line:
                listening_ports.append(line)
                
        print(f"\n[+] Found {len(listening_ports)} active listening socket(s):")
        for sock in listening_ports:
            print(f"  -> {sock}")
            
        print("\n=== DEFENSIVE RECOMMENDATIONS ===")
        print("1. Ensure SSH (Port 22) uses key-based authentication if enabled.")
        print("2. Stop unused services using: sudo systemctl stop <service_name>")
        print("3. Always restrict development databases to 127.0.0.1.")
        
    except Exception as e:
        print(f"[-] Error checking services: {e}")

if __name__ == "__main__":
    check_listening_services()
