"""computer-vision-10weeks · Tuần 02 · Bài 02.

Chủ đề: Tọa độ ảnh và ROI
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Tọa độ ảnh và ROI:', result)
