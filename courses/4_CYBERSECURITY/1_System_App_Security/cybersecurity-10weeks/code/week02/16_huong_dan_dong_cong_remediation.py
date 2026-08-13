"""cybersecurity-10weeks · Tuần 02 · Bài 16.

Chủ đề: Hướng Dẫn Đóng Cổng (Remediation)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Hướng Dẫn Đóng Cổng (Remediation):', result)
