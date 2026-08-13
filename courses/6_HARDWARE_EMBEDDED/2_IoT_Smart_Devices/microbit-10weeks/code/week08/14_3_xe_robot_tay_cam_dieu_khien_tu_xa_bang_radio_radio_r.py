"""microbit-10weeks · Tuần 08 · Bài 14.

Chủ đề: 3: Xe Robot Tay Cầm Điều Khiển Từ Xa Bằng Radio (Radio Remote Control Car)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Xe Robot Tay Cầm Điều Khiển Từ Xa Bằng Radio (Radio Remote Control Car):', result)
