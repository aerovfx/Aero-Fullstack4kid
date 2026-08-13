"""drone-diy-10weeks · Tuần 01 · Bài 14.

Chủ đề: Bước 2: Vẽ sơ đồ lực / Step 2: Draw force diagram
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Bước 2: Vẽ sơ đồ lực / Step 2: Draw force diagram:', result)
