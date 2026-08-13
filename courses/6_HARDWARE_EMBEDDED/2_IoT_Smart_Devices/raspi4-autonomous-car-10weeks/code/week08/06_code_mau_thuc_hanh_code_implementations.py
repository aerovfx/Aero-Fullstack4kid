"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 06.

Chủ đề: Code Mẫu Thực Hành / Code Implementations
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Code Mẫu Thực Hành / Code Implementations:', result)
