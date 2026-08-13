"""software-reverse-engineering-10weeks · Tuần 02 · Bài 12.

Chủ đề: Ví dụ 1: Triage file hello.exe bằng DIE
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Ví dụ 1: Triage file hello.exe bằng DIE:', result)
