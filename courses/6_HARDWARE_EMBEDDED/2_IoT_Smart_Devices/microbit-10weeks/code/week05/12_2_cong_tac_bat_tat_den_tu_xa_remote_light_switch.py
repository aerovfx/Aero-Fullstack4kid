"""microbit-10weeks · Tuần 05 · Bài 12.

Chủ đề: 2: Công Tắc Bật Tắt Đèn Từ Xa (Remote Light Switch)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 2: Công Tắc Bật Tắt Đèn Từ Xa (Remote Light Switch):', result)
