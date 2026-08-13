"""Tính toán khoa học SciPy tuần 10, tổng hợp từ ch07_SciPy."""

import numpy as np
from scipy import integrate, optimize, signal, stats
from scipy.integrate import odeint


def filter_noisy_signal() -> tuple[np.ndarray, np.ndarray]:
    sample_rate = 500
    time = np.linspace(0, 1, sample_rate, endpoint=False)
    rng = np.random.default_rng(42)
    noisy = np.sin(2 * np.pi * 5 * time) + rng.normal(0, 0.5, time.shape)
    b, a = signal.butter(5, 10 / (0.5 * sample_rate), btype="low")
    return time, signal.lfilter(b, a, noisy)


def constrained_optimization() -> optimize.OptimizeResult:
    objective = lambda x: np.sum(x**2)
    constraint = {"type": "eq", "fun": lambda x: np.sum(x) - 1}
    return optimize.minimize(objective, np.array([0.5, 0.5, 0.5]), constraints=constraint)


def calculus_examples() -> None:
    value, error = integrate.quad(np.sin, 0, np.pi)
    time = np.linspace(0, 10, 100)
    solution = odeint(lambda y, _: -y, 5, time).ravel()
    sample = np.array([2, 3, 3, 4, 7, 9])
    print("Tích phân sin(x) [0, π]:", value, "sai số:", error)
    print("Nghiệm ODE đầu/cuối:", solution[0], solution[-1])
    print("Độ lệch/skewness:", np.std(sample), stats.skew(sample))


if __name__ == "__main__":
    _, filtered = filter_noisy_signal()
    print("Số điểm tín hiệu đã lọc:", filtered.size)
    print("Nghiệm tối ưu:", constrained_optimization().x)
    calculus_examples()
