"""cybersecurity-10weeks · Tuần 06 · Bài 09.

Chủ đề: Sử dụng Python (Scapy) cho phân tích PCAP / Using Python (Scapy) for PCAP Analysis
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Sử dụng Python (Scapy) cho phân tích PCAP / Using Python (Scapy) for PCAP Analysis:', result)
