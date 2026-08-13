"""cybersecurity-10weeks · Tuần 08 · Bài 12.

Chủ đề: Kiến trúc Hệ thống Phân tích OSINT Cơ bản / Basic Architecture of an OSINT Analysis System
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Kiến trúc Hệ thống Phân tích OSINT Cơ bản / Basic Architecture of an OSINT Analysis System:', result)
