"""cybersecurity-10weeks · Tuần 10 · Bài 16.

Chủ đề: Phần 3: Xây dựng Mô hình AI và Hệ thống Cảnh báo cơ bản / Part 3: Building the AI Model an
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Phần 3: Xây dựng Mô hình AI và Hệ thống Cảnh báo cơ bản / Part 3: Building the AI Model an:', result)
