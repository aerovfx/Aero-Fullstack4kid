"""cybersecurity-10weeks · Tuần 03 · Bài 16.

Chủ đề: Yêu cầu (Requirements)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Yêu cầu (Requirements):', result)
