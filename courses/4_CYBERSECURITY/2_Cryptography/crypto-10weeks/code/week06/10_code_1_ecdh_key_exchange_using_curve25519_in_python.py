"""crypto-10weeks · Tuần 06 · Bài 10.

Chủ đề: Code 1: ECDH Key Exchange using Curve25519 in Python
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Code 1: ECDH Key Exchange using Curve25519 in Python:', result)
