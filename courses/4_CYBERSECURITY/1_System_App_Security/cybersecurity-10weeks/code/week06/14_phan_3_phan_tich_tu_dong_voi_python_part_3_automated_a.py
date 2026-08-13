"""cybersecurity-10weeks · Tuần 06 · Bài 14.

Chủ đề: Phần 3: Phân tích tự động với Python / Part 3: Automated Analysis with Python
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Phần 3: Phân tích tự động với Python / Part 3: Automated Analysis with Python:', result)
