"""drone-diy-10weeks · Tuần 03 · Bài 10.

Chủ đề: Pixhawk vs Betaflight F4 — comparison table
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Pixhawk vs Betaflight F4 — comparison table:', result)
