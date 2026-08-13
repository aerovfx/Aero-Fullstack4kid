"""software-reverse-engineering-10weeks · Tuần 07 · Bài 14.

Chủ đề: Bài tập và rubric
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Bài tập và rubric:', result)
