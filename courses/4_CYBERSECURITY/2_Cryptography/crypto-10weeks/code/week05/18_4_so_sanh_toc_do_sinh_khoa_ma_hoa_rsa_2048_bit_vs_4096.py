"""crypto-10weeks · Tuần 05 · Bài 18.

Chủ đề: 4: So Sánh Tốc Độ Sinh Khóa & Mã Hóa RSA 2048-bit vs 4096-bit Trên Colab
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 4: So Sánh Tốc Độ Sinh Khóa & Mã Hóa RSA 2048-bit vs 4096-bit Trên Colab:', result)
