"""microbit-10weeks · Tuần 09 · Bài 14.

Chủ đề: 3: Game Bắn Máy Bay Retro Space Invaders
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Game Bắn Máy Bay Retro Space Invaders:', result)
