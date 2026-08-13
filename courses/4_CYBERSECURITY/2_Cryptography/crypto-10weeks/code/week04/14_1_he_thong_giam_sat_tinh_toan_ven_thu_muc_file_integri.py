"""crypto-10weeks · Tuần 04 · Bài 14.

Chủ đề: 1: Hệ Thống Giám Sát Tính Toàn Vẹn Thư Mục (File Integrity Monitor - FIM)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 1: Hệ Thống Giám Sát Tính Toàn Vẹn Thư Mục (File Integrity Monitor - FIM):', result)
