"""raspi4-autonomous-car-10weeks · Tuần 05 · Bài 14.

Chủ đề: 3: Bộ Điều Khiển Khâu Dẫn (PD Steering Controller)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Bộ Điều Khiển Khâu Dẫn (PD Steering Controller):', result)
