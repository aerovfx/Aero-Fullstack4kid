"""crypto-10weeks · Tuần 10 · Bài 10.

Chủ đề: Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix:', result)
