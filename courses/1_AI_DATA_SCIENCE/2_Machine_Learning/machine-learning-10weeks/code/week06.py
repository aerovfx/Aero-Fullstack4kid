"""Tuần 6: minh họa convolution và max pooling bằng NumPy."""

import numpy as np


def convolve(image: np.ndarray, kernel: np.ndarray) -> np.ndarray:
    height, width = image.shape
    size = kernel.shape[0]
    output = np.empty((height - size + 1, width - size + 1))
    for row in range(output.shape[0]):
        for column in range(output.shape[1]):
            region = image[row : row + size, column : column + size]
            output[row, column] = np.sum(region * kernel)
    return output


def max_pool(feature_map: np.ndarray, size: int = 2) -> np.ndarray:
    height, width = feature_map.shape
    return np.array([
        [feature_map[row : row + size, column : column + size].max()
         for column in range(0, width - size + 1, size)]
        for row in range(0, height - size + 1, size)
    ])


def main() -> None:
    image = np.arange(36, dtype=float).reshape(6, 6)
    edge_kernel = np.array([[1, 0, -1], [1, 0, -1], [1, 0, -1]])
    feature_map = np.maximum(convolve(image, edge_kernel), 0)  # ReLU
    print("Feature map:\n", feature_map)
    print("Max pooling:\n", max_pool(feature_map))


if __name__ == "__main__":
    main()
