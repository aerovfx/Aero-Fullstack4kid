"""pico-stem-10weeks · Tuần 06 · Bài 10.

Chủ đề: 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level):', result)
