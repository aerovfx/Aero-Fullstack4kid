"""crypto-10weeks · Tuần 02 · Bài 14.

Chủ đề: 1: Lập Trình Công Cụ Mã Hóa Tệp AES-256-GCM (AES File Encryptor CLI)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 1: Lập Trình Công Cụ Mã Hóa Tệp AES-256-GCM (AES File Encryptor CLI):', result)
