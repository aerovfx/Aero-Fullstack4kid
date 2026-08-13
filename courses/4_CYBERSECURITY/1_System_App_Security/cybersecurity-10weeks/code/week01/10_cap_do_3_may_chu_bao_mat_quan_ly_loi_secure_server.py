"""cybersecurity-10weeks · Tuần 01 · Bài 10.

Chủ đề: Cấp độ 3: Máy chủ Bảo mật & Quản lý Lỗi (Secure Server)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Cấp độ 3: Máy chủ Bảo mật & Quản lý Lỗi (Secure Server):', result)
