"""Tuần 10: SciPy và mô hình học máy đầu tiên."""

import numpy as np
from scipy import integrate, optimize
from sklearn.datasets import load_diabetes
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error
from sklearn.model_selection import train_test_split


def scientific_computing() -> None:
    integral, error = integrate.quad(np.sin, 0, np.pi)
    result = optimize.minimize(lambda x: np.sum(x**2), x0=np.array([2.0, -1.0]))
    print("Tích phân:", integral, "sai số:", error)
    print("Tối ưu thành công:", result.success, "nghiệm:", result.x)


def machine_learning() -> None:
    features, target = load_diabetes(return_X_y=True)
    x_train, x_test, y_train, y_test = train_test_split(
        features, target, test_size=0.2, random_state=42
    )
    model = LinearRegression().fit(x_train, y_train)
    prediction = model.predict(x_test)
    print("Mean absolute error:", mean_absolute_error(y_test, prediction))


if __name__ == "__main__":
    scientific_computing()
    machine_learning()
