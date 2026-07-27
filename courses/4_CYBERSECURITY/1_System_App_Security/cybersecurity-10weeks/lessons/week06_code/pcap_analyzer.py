#!/usr/bin/env python3
"""
Scapy PCAP Analyzer & Anomaly Detector (Week 6)
Analyzes PCAP packet capture files to detect potential port scans or flood anomalies.
"""

from scapy.all import rdpcap, TCP, IP
from collections import Counter
import sys
import os

def analyze_pcap(pcap_filename):
    if not os.path.exists(pcap_filename):
        print(f"[-] File {pcap_filename} not found.")
        return

    print(f"[+] Reading PCAP file: {pcap_filename}...")
    try:
        packets = rdpcap(pcap_filename)
        print(f"[+] Total packets captured: {len(packets)}")

        syn_counts = Counter()
        ip_counts = Counter()

        for pkt in packets:
            if pkt.haslayer(IP):
                ip_counts[pkt[IP].src] += 1
                if pkt.haslayer(TCP) and pkt[TCP].flags == 'S': # SYN packet
                    syn_counts[pkt[IP].src] += 1

        print("\n=== TOP TRAFFIC SOURCES ===")
        for ip, count in ip_counts.most_common(5):
            print(f"IP: {ip:<15} Packets: {count}")

        print("\n=== SYN SCAN DETECTOR ===")
        for ip, count in syn_counts.items():
            if count > 20:
                print(f"[⚠️ ANOMALY DETECTED] High volume of SYN packets from {ip} (Total SYN: {count})")
            else:
                print(f"[+] IP {ip}: Normal SYN activity ({count} packets)")

    except Exception as e:
        print(f"[-] Error parsing PCAP file: {e}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        analyze_pcap(sys.argv[1])
    else:
        print("Usage: python3 pcap_analyzer.py <path_to_pcap_file>")
        print("Example: python3 pcap_analyzer.py sample_traffic.pcap")
