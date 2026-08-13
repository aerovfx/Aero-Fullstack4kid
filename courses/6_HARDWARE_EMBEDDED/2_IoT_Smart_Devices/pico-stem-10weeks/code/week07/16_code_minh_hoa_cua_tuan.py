"""pico-stem-10weeks · Tuần 07 · Bài 16.

Chủ đề: code minh họa của tuần
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - code minh họa của tuần:', result)
