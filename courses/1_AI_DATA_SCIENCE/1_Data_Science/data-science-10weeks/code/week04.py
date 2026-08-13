"""Tuần 4: slicing, boolean indexing và phép toán ma trận."""

import numpy as np


def main() -> None:
    matrix = np.arange(1, 21).reshape(4, 5)
    selected = matrix[1:3, 2:5].copy()
    filtered = matrix[(matrix % 2 == 0) & (matrix > matrix.mean())]
    order = np.argsort(matrix[:, 0])[::-1]

    print("Vùng cắt:\n", selected)
    print("Số chẵn lớn hơn trung bình:", filtered)
    print("Sắp xếp giảm theo cột đầu:\n", matrix[order])
    print("Tích Gram M @ M.T:\n", matrix @ matrix.T)


if __name__ == "__main__":
    main()
