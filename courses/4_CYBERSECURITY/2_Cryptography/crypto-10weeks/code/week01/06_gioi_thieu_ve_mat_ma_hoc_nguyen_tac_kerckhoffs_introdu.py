"""crypto-10weeks · Tuần 01 · Bài 06.

Chủ đề: Giới thiệu về Mật Mã Học & Nguyên tắc Kerckhoffs / Introduction & Kerckhoffs's Principle
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print("06 - Giới thiệu về Mật Mã Học & Nguyên tắc Kerckhoffs / Introduction & Kerckhoffs's Principle:", result)
