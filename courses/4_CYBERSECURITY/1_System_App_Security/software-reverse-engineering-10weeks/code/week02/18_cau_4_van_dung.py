"""software-reverse-engineering-10weeks · Tuần 02 · Bài 18.

Chủ đề: Câu 4 (Vận dụng)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Câu 4 (Vận dụng):', result)
