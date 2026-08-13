"""cybersecurity-10weeks · Tuần 04 · Bài 12.

Chủ đề: Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices:', result)
