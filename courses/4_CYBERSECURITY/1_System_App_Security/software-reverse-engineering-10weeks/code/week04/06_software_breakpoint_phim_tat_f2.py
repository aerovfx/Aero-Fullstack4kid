"""software-reverse-engineering-10weeks · Tuần 04 · Bài 06.

Chủ đề: Software Breakpoint (Phím tắt F2)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Software Breakpoint (Phím tắt F2):', result)
