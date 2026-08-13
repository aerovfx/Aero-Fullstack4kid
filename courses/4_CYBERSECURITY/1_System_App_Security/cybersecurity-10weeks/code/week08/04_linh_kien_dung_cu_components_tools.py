"""cybersecurity-10weeks · Tuần 08 · Bài 04.

Chủ đề: Linh Kiện & Dụng Cụ / Components & Tools
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Linh Kiện & Dụng Cụ / Components & Tools:', result)
