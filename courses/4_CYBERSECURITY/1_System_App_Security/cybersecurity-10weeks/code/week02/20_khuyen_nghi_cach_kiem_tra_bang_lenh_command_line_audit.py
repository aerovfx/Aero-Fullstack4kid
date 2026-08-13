"""cybersecurity-10weeks · Tuần 02 · Bài 20.

Chủ đề: Khuyến nghị & Cách kiểm tra bằng lệnh (Command-line Auditing)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Khuyến nghị & Cách kiểm tra bằng lệnh (Command-line Auditing):', result)
