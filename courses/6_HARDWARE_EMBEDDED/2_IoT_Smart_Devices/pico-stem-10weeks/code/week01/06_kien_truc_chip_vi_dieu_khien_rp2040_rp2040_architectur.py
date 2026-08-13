"""pico-stem-10weeks · Tuần 01 · Bài 06.

Chủ đề: Kiến Trúc Chip Vi Điều Khiển RP2040 / RP2040 Architecture
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Kiến Trúc Chip Vi Điều Khiển RP2040 / RP2040 Architecture:', result)
