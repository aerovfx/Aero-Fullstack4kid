"""Tuần 8: scaled dot-product attention của Transformer."""

import numpy as np


def softmax(values: np.ndarray) -> np.ndarray:
    shifted = values - values.max(axis=-1, keepdims=True)
    exponent = np.exp(shifted)
    return exponent / exponent.sum(axis=-1, keepdims=True)


def attention(query: np.ndarray, key: np.ndarray, value: np.ndarray):
    scores = query @ key.T / np.sqrt(query.shape[-1])
    weights = softmax(scores)
    return weights @ value, weights


def main() -> None:
    rng = np.random.default_rng(42)
    tokens = rng.normal(size=(4, 8))
    output, weights = attention(tokens, tokens, tokens)
    print("Attention weights:\n", weights.round(3))
    print("Output shape:", output.shape)


if __name__ == "__main__":
    main()
