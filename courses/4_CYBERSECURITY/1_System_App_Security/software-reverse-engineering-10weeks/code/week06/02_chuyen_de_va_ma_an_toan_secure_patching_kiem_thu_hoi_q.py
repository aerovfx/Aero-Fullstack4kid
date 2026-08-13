"""software-reverse-engineering-10weeks · Tuần 06 · Bài 02.

Chủ đề: Chuyên đề: Vá Mã An Toàn (Secure Patching), Kiểm Thử Hồi Quy & Chiến Lược Rollback
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Chuyên đề: Vá Mã An Toàn (Secure Patching), Kiểm Thử Hồi Quy & Chiến Lược Rollback:', result)
