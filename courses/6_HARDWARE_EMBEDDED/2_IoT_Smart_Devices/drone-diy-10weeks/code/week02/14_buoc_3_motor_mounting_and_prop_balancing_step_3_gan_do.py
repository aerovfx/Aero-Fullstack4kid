"""drone-diy-10weeks · Tuần 02 · Bài 14.

Chủ đề: Bước 3: Motor mounting and prop balancing / Step 3: Gắn động cơ và cân bằng cánh
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Bước 3: Motor mounting and prop balancing / Step 3: Gắn động cơ và cân bằng cánh:', result)
