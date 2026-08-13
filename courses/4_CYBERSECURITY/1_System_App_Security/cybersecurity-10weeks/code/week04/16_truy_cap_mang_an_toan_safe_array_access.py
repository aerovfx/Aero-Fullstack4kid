"""cybersecurity-10weeks · Tuần 04 · Bài 16.

Chủ đề: Truy cập mảng an toàn (Safe Array Access)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Truy cập mảng an toàn (Safe Array Access):', result)
