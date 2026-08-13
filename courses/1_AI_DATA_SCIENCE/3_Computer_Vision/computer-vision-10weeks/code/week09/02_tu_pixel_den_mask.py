"""computer-vision-10weeks · Tuần 09 · Bài 02.

Chủ đề: Từ pixel đến mask
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Từ pixel đến mask:', result)
