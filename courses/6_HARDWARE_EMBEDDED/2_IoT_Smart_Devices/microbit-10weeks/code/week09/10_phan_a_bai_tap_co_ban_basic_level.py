"""microbit-10weeks · Tuần 09 · Bài 10.

Chủ đề: 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - 🟢 Phần A: Bài Tập Cơ Bản (Basic Level):', result)
