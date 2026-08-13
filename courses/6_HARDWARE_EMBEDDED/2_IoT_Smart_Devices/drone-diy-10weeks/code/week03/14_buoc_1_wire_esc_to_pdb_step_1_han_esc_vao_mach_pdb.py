"""drone-diy-10weeks · Tuần 03 · Bài 14.

Chủ đề: Bước 1: Wire ESC to PDB / Step 1: Hàn ESC vào mạch PDB
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Bước 1: Wire ESC to PDB / Step 1: Hàn ESC vào mạch PDB:', result)
