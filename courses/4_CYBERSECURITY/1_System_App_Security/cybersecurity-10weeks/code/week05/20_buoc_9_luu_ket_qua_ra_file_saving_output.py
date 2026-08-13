"""cybersecurity-10weeks · Tuần 05 · Bài 20.

Chủ đề: Bước 9: Lưu kết quả ra file (Saving Output)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Bước 9: Lưu kết quả ra file (Saving Output):', result)
