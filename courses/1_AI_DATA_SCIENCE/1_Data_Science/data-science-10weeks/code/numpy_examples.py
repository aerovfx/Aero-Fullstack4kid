"""Ví dụ NumPy dùng cho tuần 2–4, tổng hợp từ ch03_NumPy."""

import numpy as np


def array_basics() -> None:
    vector = np.array([1, 2, 3, 4, 5])
    matrix = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    print("Vector:", vector)
    print("Matrix:\n", matrix)
    print("shape/dtype/ndim:", matrix.shape, matrix.dtype, matrix.ndim)
    print("Broadcast × 2:\n", matrix * 2)
    print("Slice:\n", matrix[1:, :2])


def operators_and_masks() -> None:
    values = np.array([1, 2, 3, 4, 5])
    print("Bình phương:", values * values)
    print("Lớn hơn 2:", values > 2)
    print("Nằm trong (2, 5):", values[np.logical_and(values > 2, values < 5)])


def matrix_operations() -> None:
    left = np.array([[1, 2], [3, 4]])
    right = np.array([[5, 6], [7, 8]])
    print("Nhân theo phần tử:\n", left * right)
    print("Nhân ma trận:\n", left @ right)
    print("Sắp xếp theo hàng:\n", np.sort(left, axis=1))


if __name__ == "__main__":
    array_basics()
    operators_and_masks()
    matrix_operations()
