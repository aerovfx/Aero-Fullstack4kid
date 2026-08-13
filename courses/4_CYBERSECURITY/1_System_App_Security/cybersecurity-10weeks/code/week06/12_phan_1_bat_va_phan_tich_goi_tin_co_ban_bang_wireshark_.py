"""cybersecurity-10weeks · Tuần 06 · Bài 12.

Chủ đề: Phần 1: Bắt và Phân tích gói tin cơ bản bằng Wireshark / Part 1: Basic Packet Capture and 
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Phần 1: Bắt và Phân tích gói tin cơ bản bằng Wireshark / Part 1: Basic Packet Capture and :', result)
