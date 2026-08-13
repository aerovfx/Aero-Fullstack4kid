"""computer-vision-10weeks · Tuần 03 · Bài 02.

Chủ đề: Từ nhiễu đến biên
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Từ nhiễu đến biên:', result)
