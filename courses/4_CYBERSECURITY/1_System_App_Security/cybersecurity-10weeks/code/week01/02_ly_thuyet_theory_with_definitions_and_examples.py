"""cybersecurity-10weeks · Tuần 01 · Bài 02.

Chủ đề: Lý Thuyết / Theory (with definitions and examples)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Lý Thuyết / Theory (with definitions and examples):', result)
