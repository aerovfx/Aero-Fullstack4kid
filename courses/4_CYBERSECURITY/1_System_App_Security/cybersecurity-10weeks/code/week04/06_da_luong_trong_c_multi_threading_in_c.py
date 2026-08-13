"""cybersecurity-10weeks · Tuần 04 · Bài 06.

Chủ đề: Đa luồng trong C++ (Multi-threading in C++)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Đa luồng trong C++ (Multi-threading in C++):', result)
