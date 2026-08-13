"""cybersecurity-10weeks · Tuần 07 · Bài 06.

Chủ đề: Phần Mềm / Software
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Phần Mềm / Software:', result)
