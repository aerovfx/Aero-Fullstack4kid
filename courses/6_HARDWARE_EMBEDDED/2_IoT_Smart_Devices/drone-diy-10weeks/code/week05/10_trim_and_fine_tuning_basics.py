"""drone-diy-10weeks · Tuần 05 · Bài 10.

Chủ đề: Trim and fine-tuning basics
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Trim and fine-tuning basics:', result)
