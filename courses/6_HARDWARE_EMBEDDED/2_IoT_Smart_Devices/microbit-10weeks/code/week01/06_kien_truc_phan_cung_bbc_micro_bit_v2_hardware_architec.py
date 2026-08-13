"""microbit-10weeks · Tuần 01 · Bài 06.

Chủ đề: Kiến Trúc Phần Cứng BBC micro:bit v2 / Hardware Architecture
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Kiến Trúc Phần Cứng BBC micro:bit v2 / Hardware Architecture:', result)
