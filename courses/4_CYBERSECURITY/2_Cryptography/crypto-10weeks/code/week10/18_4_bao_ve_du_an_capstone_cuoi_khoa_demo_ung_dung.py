"""crypto-10weeks · Tuần 10 · Bài 18.

Chủ đề: 4: Bảo Vệ Dự Án Capstone Cuối Khóa & Demo Ứng Dụng
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 4: Bảo Vệ Dự Án Capstone Cuối Khóa & Demo Ứng Dụng:', result)
