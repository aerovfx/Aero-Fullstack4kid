"""cybersecurity-10weeks · Tuần 04 · Bài 08.

Chủ đề: Lỗi Tràn Bộ Đệm (Buffer Overflow)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Lỗi Tràn Bộ Đệm (Buffer Overflow):', result)
