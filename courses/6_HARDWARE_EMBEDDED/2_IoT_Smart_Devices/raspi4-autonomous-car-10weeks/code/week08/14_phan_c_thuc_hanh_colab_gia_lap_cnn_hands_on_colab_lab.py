"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 14.

Chủ đề: 🔴 Phần C: Thực Hành Colab / Giả Lập CNN (Hands-on Colab Lab)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 🔴 Phần C: Thực Hành Colab / Giả Lập CNN (Hands-on Colab Lab):', result)
