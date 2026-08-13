"""software-reverse-engineering-10weeks · Tuần 09 · Bài 02.

Chủ đề: Chuyên đề: Phân Tích Chuyên Sâu PE GUI, Import Table, Resources & Kiểm Soát CI Hardening
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Chuyên đề: Phân Tích Chuyên Sâu PE GUI, Import Table, Resources & Kiểm Soát CI Hardening:', result)
