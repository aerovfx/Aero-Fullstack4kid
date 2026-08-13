"""microbit-10weeks · Tuần 03 · Bài 14.

Chủ đề: 3: Hệ Thống Cảnh Báo Tưới Cây Tự Động (Smart Plant Moisture Alert)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Hệ Thống Cảnh Báo Tưới Cây Tự Động (Smart Plant Moisture Alert):', result)
