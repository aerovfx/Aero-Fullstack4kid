"""cybersecurity-10weeks · Tuần 09 · Bài 08.

Chủ đề: Nhật Ký Bảo Mật & Phân Tích (Security Logs & Analysis)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Nhật Ký Bảo Mật & Phân Tích (Security Logs & Analysis):', result)
