"""software-reverse-engineering-10weeks · Tuần 02 · Bài 14.

Chủ đề: Ví dụ 3: Quan sát luồng thực thi trong x64dbg
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Ví dụ 3: Quan sát luồng thực thi trong x64dbg:', result)
