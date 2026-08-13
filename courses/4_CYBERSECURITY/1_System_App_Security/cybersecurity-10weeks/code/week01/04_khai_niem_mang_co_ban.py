"""cybersecurity-10weeks · Tuần 01 · Bài 04.

Chủ đề: Khái niệm Mạng Cơ Bản
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Khái niệm Mạng Cơ Bản:', result)
