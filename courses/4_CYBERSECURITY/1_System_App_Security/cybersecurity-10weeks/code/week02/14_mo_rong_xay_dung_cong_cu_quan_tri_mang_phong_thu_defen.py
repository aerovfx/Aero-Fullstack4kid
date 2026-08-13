"""cybersecurity-10weeks · Tuần 02 · Bài 14.

Chủ đề: Mở Rộng: Xây Dựng Công Cụ Quản Trị Mạng & Phòng Thủ (Defensive Auditing)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Mở Rộng: Xây Dựng Công Cụ Quản Trị Mạng & Phòng Thủ (Defensive Auditing):', result)
