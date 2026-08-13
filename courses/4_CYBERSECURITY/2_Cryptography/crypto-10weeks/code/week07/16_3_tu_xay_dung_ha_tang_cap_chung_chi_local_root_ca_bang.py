"""crypto-10weeks · Tuần 07 · Bài 16.

Chủ đề: 3: Tự Xây Dựng Hạ Tầng Cấp Chứng Chỉ Local Root CA Bằng OpenSSL CLI
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 3: Tự Xây Dựng Hạ Tầng Cấp Chứng Chỉ Local Root CA Bằng OpenSSL CLI:', result)
