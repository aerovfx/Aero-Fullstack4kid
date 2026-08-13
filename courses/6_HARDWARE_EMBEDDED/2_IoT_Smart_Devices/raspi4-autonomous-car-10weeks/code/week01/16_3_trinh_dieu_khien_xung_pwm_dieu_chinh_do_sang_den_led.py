"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 16.

Chủ đề: 3: Trình Điều Khiển Xung PWM Điều Chỉnh Độ Sáng Đèn (LED Dimmer via Hardware PWM)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 3: Trình Điều Khiển Xung PWM Điều Chỉnh Độ Sáng Đèn (LED Dimmer via Hardware PWM):', result)
