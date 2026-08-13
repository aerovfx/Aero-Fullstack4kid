"""pico-stem-10weeks · Tuần 10 · Bài 14.

Chủ đề: Chuẩn bị môi trường tuần 10
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Chuẩn bị môi trường tuần 10:', result)
