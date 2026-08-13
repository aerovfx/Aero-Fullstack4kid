"""cybersecurity-10weeks · Tuần 02 · Bài 06.

Chủ đề: Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices:', result)
