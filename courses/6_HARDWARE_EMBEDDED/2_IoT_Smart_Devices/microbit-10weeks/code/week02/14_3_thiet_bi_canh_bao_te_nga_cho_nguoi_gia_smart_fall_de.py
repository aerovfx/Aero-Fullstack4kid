"""microbit-10weeks · Tuần 02 · Bài 14.

Chủ đề: 3: Thiết Bị Cảnh Báo Té Ngã Cho Người Già (Smart Fall Detector)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Thiết Bị Cảnh Báo Té Ngã Cho Người Già (Smart Fall Detector):', result)
