"""cybersecurity-10weeks · Tuần 02 · Bài 12.

Chủ đề: Đề bài: Thám tử Banner (Banner Grabbing)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Đề bài: Thám tử Banner (Banner Grabbing):', result)
