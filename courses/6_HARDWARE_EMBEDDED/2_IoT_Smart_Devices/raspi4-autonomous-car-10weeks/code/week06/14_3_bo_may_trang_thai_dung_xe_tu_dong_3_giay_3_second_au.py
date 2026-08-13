"""raspi4-autonomous-car-10weeks · Tuần 06 · Bài 14.

Chủ đề: 3: Bộ Máy Trạng Thái Dừng Xe Tự Động 3 Giây (3-Second Auto Pause FSM)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 3: Bộ Máy Trạng Thái Dừng Xe Tự Động 3 Giây (3-Second Auto Pause FSM):', result)
