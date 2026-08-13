"""machine-learning-10weeks · Tuần 06 · Bài 14.

Chủ đề: Xử lý trường hợp biên tuần 06
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Xử lý trường hợp biên tuần 06:', result)
