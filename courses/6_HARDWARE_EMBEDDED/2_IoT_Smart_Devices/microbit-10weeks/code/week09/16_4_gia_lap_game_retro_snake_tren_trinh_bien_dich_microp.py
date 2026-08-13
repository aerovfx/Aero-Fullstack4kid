"""microbit-10weeks · Tuần 09 · Bài 16.

Chủ đề: 4: Giả Lập Game Retro Snake Trên Trình Biên Dịch MicroPython Web
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 4: Giả Lập Game Retro Snake Trên Trình Biên Dịch MicroPython Web:', result)
