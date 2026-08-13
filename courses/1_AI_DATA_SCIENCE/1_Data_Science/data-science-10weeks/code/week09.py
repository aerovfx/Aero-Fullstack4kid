"""Tuần 9: trực quan hóa bằng Matplotlib và Seaborn."""

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns


def main() -> None:
    rng = np.random.default_rng(42)
    frame = pd.DataFrame(rng.normal(size=(200, 4)), columns=list("ABCD"))

    fig, axes = plt.subplots(1, 2, figsize=(11, 4))
    sns.histplot(frame["A"], kde=True, ax=axes[0])
    axes[0].set(title="Phân phối A", xlabel="Giá trị", ylabel="Tần suất")
    sns.heatmap(frame.corr(), annot=True, cmap="coolwarm", ax=axes[1])
    axes[1].set_title("Ma trận tương quan")
    fig.tight_layout()
    plt.show()


if __name__ == "__main__":
    main()
