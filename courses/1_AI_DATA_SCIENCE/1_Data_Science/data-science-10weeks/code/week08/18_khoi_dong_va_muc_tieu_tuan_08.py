"""data-science-10weeks · Tuần 08 · Bài 18.

Chủ đề: Khởi động và mục tiêu tuần 08
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Khởi động và mục tiêu tuần 08:', result)
