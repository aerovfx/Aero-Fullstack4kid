"""Tuần 9: collaborative filtering bằng phân rã ma trận SVD."""

import numpy as np


RATINGS = np.array([
    [5, 4, 0, 1, 0],
    [4, 0, 0, 1, 2],
    [1, 1, 0, 5, 4],
    [0, 0, 5, 4, 4],
], dtype=float)


def recommend(user_index: int, count: int = 2) -> list[int]:
    user_means = np.divide(
        RATINGS.sum(axis=1), (RATINGS > 0).sum(axis=1),
        out=np.zeros(RATINGS.shape[0]), where=(RATINGS > 0).sum(axis=1) != 0,
    )
    centered = np.where(RATINGS > 0, RATINGS - user_means[:, None], 0)
    left, singular, right = np.linalg.svd(centered, full_matrices=False)
    predicted = (left[:, :2] * singular[:2]) @ right[:2] + user_means[:, None]
    predicted[user_index, RATINGS[user_index] > 0] = -np.inf
    return np.argsort(predicted[user_index])[::-1][:count].tolist()


if __name__ == "__main__":
    print("Gợi ý item cho user 0:", recommend(0))
