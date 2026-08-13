"""cybersecurity-10weeks · Tuần 10 · Bài 06.

Chủ đề: Tổng quan về Trung tâm Điều hành Bảo mật (SOC) / Overview of Security Operations Center (S
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Tổng quan về Trung tâm Điều hành Bảo mật (SOC) / Overview of Security Operations Center (S:', result)
