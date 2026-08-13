"""software-reverse-engineering-10weeks · Tuần 05 · Bài 04.

Chủ đề: Kỹ Thuật Intermodular Calls Trong x64dbg
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Kỹ Thuật Intermodular Calls Trong x64dbg:', result)
