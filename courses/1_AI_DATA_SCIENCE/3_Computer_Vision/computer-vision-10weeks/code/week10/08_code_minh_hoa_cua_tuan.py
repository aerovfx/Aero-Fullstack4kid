"""computer-vision-10weeks · Tuần 10 · Bài 08.

Chủ đề: code minh họa của tuần
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - code minh họa của tuần:', result)
