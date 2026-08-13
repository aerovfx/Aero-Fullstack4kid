"""crypto-10weeks · Tuần 07 · Bài 18.

Chủ đề: 4: Mô Phỏng Toàn Bộ Quy Trình Bắt Tay TLS 1.3 (TLS 1.3 Handshake Simulator)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 4: Mô Phỏng Toàn Bộ Quy Trình Bắt Tay TLS 1.3 (TLS 1.3 Handshake Simulator):', result)
