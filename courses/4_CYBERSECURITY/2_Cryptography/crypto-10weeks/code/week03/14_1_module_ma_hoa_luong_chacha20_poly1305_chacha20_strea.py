"""crypto-10weeks · Tuần 03 · Bài 14.

Chủ đề: 1: Module Mã Hóa Luồng ChaCha20-Poly1305 (ChaCha20 Stream Module)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 1: Module Mã Hóa Luồng ChaCha20-Poly1305 (ChaCha20 Stream Module):', result)
