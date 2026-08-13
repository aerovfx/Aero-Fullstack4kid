"""software-reverse-engineering-10weeks · Tuần 10 · Bài 04.

Chủ đề: So sánh Checksum, HMAC và Digital Signature
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - So sánh Checksum, HMAC và Digital Signature:', result)
