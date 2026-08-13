"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 02.

Chủ đề: Tiếng Việt (Vietnamese)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Tiếng Việt (Vietnamese):', result)
