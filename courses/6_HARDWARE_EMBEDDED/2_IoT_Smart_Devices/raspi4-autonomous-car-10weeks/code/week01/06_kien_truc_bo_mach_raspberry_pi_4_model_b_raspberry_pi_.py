"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 06.

Chủ đề: Kiến Trúc Bo Mạch Raspberry Pi 4 Model B / Raspberry Pi 4 Hardware
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Kiến Trúc Bo Mạch Raspberry Pi 4 Model B / Raspberry Pi 4 Hardware:', result)
