"""pico-stem-10weeks · Tuần 04 · Bài 20.

Chủ đề: Chuẩn bị môi trường tuần 04
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Chuẩn bị môi trường tuần 04:', result)
