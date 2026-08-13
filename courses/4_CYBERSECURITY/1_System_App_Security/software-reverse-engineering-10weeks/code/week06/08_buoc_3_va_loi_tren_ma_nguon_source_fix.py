"""software-reverse-engineering-10weeks · Tuần 06 · Bài 08.

Chủ đề: Bước 3 — Vá lỗi trên Mã nguồn (Source Fix)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Bước 3 — Vá lỗi trên Mã nguồn (Source Fix):', result)
