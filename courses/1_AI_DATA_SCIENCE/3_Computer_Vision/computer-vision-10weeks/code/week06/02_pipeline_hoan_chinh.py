"""computer-vision-10weeks · Tuần 06 · Bài 02.

Chủ đề: Pipeline hoàn chỉnh
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Pipeline hoàn chỉnh:', result)
