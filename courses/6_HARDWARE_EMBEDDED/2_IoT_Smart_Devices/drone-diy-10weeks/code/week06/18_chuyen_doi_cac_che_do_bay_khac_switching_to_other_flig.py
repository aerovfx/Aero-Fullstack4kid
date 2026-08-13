"""drone-diy-10weeks · Tuần 06 · Bài 18.

Chủ đề: Chuyển Đổi Các Chế Độ Bay Khác / Switching to Other Flight Modes
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Chuyển Đổi Các Chế Độ Bay Khác / Switching to Other Flight Modes:', result)
