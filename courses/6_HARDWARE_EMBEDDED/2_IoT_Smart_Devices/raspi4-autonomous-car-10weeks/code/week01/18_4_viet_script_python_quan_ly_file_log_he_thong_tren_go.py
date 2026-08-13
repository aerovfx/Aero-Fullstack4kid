"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 18.

Chủ đề: 4: Viết Script Python Quản Lý File Log Hệ Thống Trên Google Colab
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 4: Viết Script Python Quản Lý File Log Hệ Thống Trên Google Colab:', result)
