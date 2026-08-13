"""cybersecurity-10weeks · Tuần 01 · Bài 08.

Chủ đề: Cấp độ 1: Giao tiếp Cơ bản (Basic Echo Server)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Cấp độ 1: Giao tiếp Cơ bản (Basic Echo Server):', result)
