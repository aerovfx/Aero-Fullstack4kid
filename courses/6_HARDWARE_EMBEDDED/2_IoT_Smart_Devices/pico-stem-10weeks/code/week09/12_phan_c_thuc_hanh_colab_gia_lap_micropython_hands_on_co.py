"""pico-stem-10weeks · Tuần 09 · Bài 12.

Chủ đề: 🔴 Phần C: Thực Hành Colab / Giả Lập MicroPython (Hands-on Colab Lab)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 🔴 Phần C: Thực Hành Colab / Giả Lập MicroPython (Hands-on Colab Lab):', result)
