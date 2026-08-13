"""Tuần 3: vector hóa, broadcasting và đại số tuyến tính."""

import numpy as np


def min_max_scale(values: np.ndarray) -> np.ndarray:
    span = values.max() - values.min()
    if span == 0:
        return np.zeros_like(values, dtype=float)
    return (values - values.min()) / span


def main() -> None:
    values = np.array([10, 20, 30, 40], dtype=float)
    matrix = np.arange(1, 7).reshape(2, 3)
    weights = np.array([0.2, 0.3, 0.5])

    print("Chuẩn hóa:", min_max_scale(values))
    print("Broadcast + [10, 20, 30]:\n", matrix + np.array([10, 20, 30]))
    print("Tích ma trận-vector:", matrix @ weights)


if __name__ == "__main__":
    main()
