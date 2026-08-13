"""microbit-10weeks · Tuần 01 · Bài 18.

Chủ đề: 3: Máy Chơi Nhạc Mini Piano 3 Phím (3-Key Mini Synthesizer)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 3: Máy Chơi Nhạc Mini Piano 3 Phím (3-Key Mini Synthesizer):', result)
