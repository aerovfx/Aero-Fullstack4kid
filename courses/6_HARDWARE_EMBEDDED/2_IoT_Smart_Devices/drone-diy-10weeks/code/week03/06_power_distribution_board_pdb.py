"""drone-diy-10weeks · Tuần 03 · Bài 06.

Chủ đề: Power Distribution Board (PDB)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Power Distribution Board (PDB):', result)
