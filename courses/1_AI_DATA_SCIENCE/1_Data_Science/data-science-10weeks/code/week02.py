"""Tuần 2: tạo mảng NumPy và đọc thuộc tính."""

import numpy as np


def main() -> None:
    vector = np.array([1, 2, 3, 4, 5])
    matrix = np.arange(1, 10).reshape(3, 3)
    random_scores = np.random.default_rng(42).integers(0, 11, size=(5, 4))

    print("Vector:", vector)
    print("Ma trận:\n", matrix)
    print("shape/dtype/ndim:", matrix.shape, matrix.dtype, matrix.ndim)
    print("Điểm trung bình từng học viên:", random_scores.mean(axis=1))


if __name__ == "__main__":
    main()
