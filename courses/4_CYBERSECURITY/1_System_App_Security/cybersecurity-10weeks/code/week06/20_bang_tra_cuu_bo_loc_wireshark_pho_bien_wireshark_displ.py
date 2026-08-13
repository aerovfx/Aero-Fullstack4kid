"""cybersecurity-10weeks · Tuần 06 · Bài 20.

Chủ đề: Bảng Tra Cứu Bộ Lọc Wireshark Phổ Biến (Wireshark Display Filters)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Bảng Tra Cứu Bộ Lọc Wireshark Phổ Biến (Wireshark Display Filters):', result)
