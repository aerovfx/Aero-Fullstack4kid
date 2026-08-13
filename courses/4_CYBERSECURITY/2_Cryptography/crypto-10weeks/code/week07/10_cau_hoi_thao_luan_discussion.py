"""crypto-10weeks · Tuần 07 · Bài 10.

Chủ đề: Câu Hỏi Thảo Luận / Discussion
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Câu Hỏi Thảo Luận / Discussion:', result)
