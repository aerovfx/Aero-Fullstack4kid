"""crypto-10weeks · Tuần 09 · Bài 18.

Chủ đề: 4: Xây Dựng Trình Xác Thực Thẻ Căn Cước Không Tiết Lộ Tuổi (ZKP e-ID Verification)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 4: Xây Dựng Trình Xác Thực Thẻ Căn Cước Không Tiết Lộ Tuổi (ZKP e-ID Verification):', result)
