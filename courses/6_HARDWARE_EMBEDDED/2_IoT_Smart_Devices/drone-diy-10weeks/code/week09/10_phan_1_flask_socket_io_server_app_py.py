"""drone-diy-10weeks · Tuần 09 · Bài 10.

Chủ đề: Phần 1: Flask + Socket.IO Server (app.py)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Phần 1: Flask + Socket.IO Server (app.py):', result)
