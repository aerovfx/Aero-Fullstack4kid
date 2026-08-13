"""microbit-10weeks · Tuần 08 · Bài 16.

Chủ đề: 4: Giả Lập Thuật Toán Xe Né Vật Cản Trên MakeCode Simulator
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 4: Giả Lập Thuật Toán Xe Né Vật Cản Trên MakeCode Simulator:', result)
