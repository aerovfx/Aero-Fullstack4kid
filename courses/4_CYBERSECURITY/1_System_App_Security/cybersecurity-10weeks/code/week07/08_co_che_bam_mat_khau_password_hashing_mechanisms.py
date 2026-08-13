"""cybersecurity-10weeks · Tuần 07 · Bài 08.

Chủ đề: Cơ Chế Băm Mật Khẩu (Password Hashing Mechanisms)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Cơ Chế Băm Mật Khẩu (Password Hashing Mechanisms):', result)
