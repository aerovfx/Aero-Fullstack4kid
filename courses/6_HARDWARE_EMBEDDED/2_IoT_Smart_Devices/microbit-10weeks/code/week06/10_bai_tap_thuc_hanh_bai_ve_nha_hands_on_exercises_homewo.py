"""microbit-10weeks · Tuần 06 · Bài 10.

Chủ đề: Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework:', result)
