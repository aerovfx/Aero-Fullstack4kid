"""cybersecurity-10weeks · Tuần 03 · Bài 12.

Chủ đề: Rủi ro Bảo mật: Buffer Overflow & Dangling Pointers / Security Risks: Buffer Overflow & Da
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Rủi ro Bảo mật: Buffer Overflow & Dangling Pointers / Security Risks: Buffer Overflow & Da:', result)
