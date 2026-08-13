"""software-reverse-engineering-10weeks · Tuần 04 · Bài 18.

Chủ đề: A.1 Các cửa sổ chính trong x64dbg
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - A.1 Các cửa sổ chính trong x64dbg:', result)
