"""drone-diy-10weeks · Tuần 10 · Bài 10.

Chủ đề: Hướng Dẫn Gỡ Lỗi / Troubleshooting Guide
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Hướng Dẫn Gỡ Lỗi / Troubleshooting Guide:', result)
