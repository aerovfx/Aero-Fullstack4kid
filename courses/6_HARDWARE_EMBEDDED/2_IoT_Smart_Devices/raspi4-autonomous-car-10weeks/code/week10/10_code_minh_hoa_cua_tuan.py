"""raspi4-autonomous-car-10weeks · Tuần 10 · Bài 10.

Chủ đề: code minh họa của tuần
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - code minh họa của tuần:', result)
