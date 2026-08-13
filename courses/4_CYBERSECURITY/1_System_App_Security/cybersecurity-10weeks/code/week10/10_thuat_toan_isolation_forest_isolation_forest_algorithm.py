"""cybersecurity-10weeks · Tuần 10 · Bài 10.

Chủ đề: Thuật toán Isolation Forest / Isolation Forest Algorithm
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Thuật toán Isolation Forest / Isolation Forest Algorithm:', result)
