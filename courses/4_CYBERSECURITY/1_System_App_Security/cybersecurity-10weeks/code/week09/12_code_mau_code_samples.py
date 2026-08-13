"""cybersecurity-10weeks · Tuần 09 · Bài 12.

Chủ đề: Code Mẫu / Code Samples
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Code Mẫu / Code Samples:', result)
