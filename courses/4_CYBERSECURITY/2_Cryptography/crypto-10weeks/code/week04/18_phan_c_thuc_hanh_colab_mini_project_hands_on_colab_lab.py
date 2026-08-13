"""crypto-10weeks · Tuần 04 · Bài 18.

Chủ đề: 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab):', result)
