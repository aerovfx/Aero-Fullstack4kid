"""Biểu đồ thống kê Seaborn tuần 9, tổng hợp từ ch08_Seaborn."""

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
from sklearn.datasets import load_iris


def distribution_and_correlation() -> None:
    rng = np.random.default_rng(42)
    frame = pd.DataFrame(rng.normal(size=(200, 4)), columns=list("ABCD"))
    fig, axes = plt.subplots(1, 2, figsize=(12, 5))
    sns.histplot(frame["A"], kde=True, ax=axes[0])
    sns.heatmap(frame.corr(), annot=True, cmap="coolwarm", ax=axes[1])
    fig.tight_layout()
    plt.show()


def iris_relationships() -> None:
    iris = load_iris(as_frame=True)
    frame = iris.frame.rename(columns={"target": "species"})
    sns.pairplot(frame, hue="species")
    sns.jointplot(data=frame, x="sepal length (cm)", y="sepal width (cm)")
    plt.show()


if __name__ == "__main__":
    distribution_and_correlation()
