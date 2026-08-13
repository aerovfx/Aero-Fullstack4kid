"""cybersecurity-10weeks · Tuần 05 · Bài 14.

Chủ đề: Bước 3: Quét cơ bản (Basic Scan)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Bước 3: Quét cơ bản (Basic Scan):', result)
