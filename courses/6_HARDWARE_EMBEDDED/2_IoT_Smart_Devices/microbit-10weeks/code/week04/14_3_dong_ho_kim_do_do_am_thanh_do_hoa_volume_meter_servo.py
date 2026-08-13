"""microbit-10weeks · Tuần 04 · Bài 14.

Chủ đề: 3: Đồng Hồ Kim Đo Độ Âm Thanh Đồ Họa (Volume Meter & Servo Gauge)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Đồng Hồ Kim Đo Độ Âm Thanh Đồ Họa (Volume Meter & Servo Gauge):', result)
