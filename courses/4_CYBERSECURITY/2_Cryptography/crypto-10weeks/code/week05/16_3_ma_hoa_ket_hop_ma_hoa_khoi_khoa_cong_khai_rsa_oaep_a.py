"""crypto-10weeks · Tuần 05 · Bài 16.

Chủ đề: 3: Mã Hóa Kết Hợp Mã Hóa Khối & Khóa Công Khai (RSA-OAEP + AES-GCM Hybrid Encryption)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 3: Mã Hóa Kết Hợp Mã Hóa Khối & Khóa Công Khai (RSA-OAEP + AES-GCM Hybrid Encryption):', result)
