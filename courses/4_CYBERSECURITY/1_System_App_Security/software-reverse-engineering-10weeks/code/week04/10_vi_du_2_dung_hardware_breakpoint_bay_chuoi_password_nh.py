"""software-reverse-engineering-10weeks · Tuần 04 · Bài 10.

Chủ đề: Ví dụ 2: Dùng Hardware Breakpoint bẫy chuỗi Password nhập vào
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Ví dụ 2: Dùng Hardware Breakpoint bẫy chuỗi Password nhập vào:', result)
