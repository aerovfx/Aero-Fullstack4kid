"""Các ví dụ Matplotlib tuần 9, tổng hợp từ ch06_Matplotlib."""

import matplotlib.pyplot as plt
import numpy as np


def chart_gallery() -> None:
    rng = np.random.default_rng(42)
    x = np.linspace(0, 10, 100)
    fig, axes = plt.subplots(2, 2, figsize=(11, 8))
    axes[0, 0].plot(x, np.sin(x), label="sin(x)")
    axes[0, 0].plot(x, np.cos(x), label="cos(x)")
    axes[0, 0].legend()
    axes[0, 1].bar(["A", "B", "C", "D"], [10, 24, 36, 40])
    axes[1, 0].scatter(rng.random(100), rng.random(100), alpha=0.65)
    axes[1, 1].hist(rng.normal(size=1_000), bins=30, color="seagreen")
    for axis in axes.flat:
        axis.grid(alpha=0.2)
    fig.suptitle("Thư viện biểu đồ Matplotlib")
    fig.tight_layout()
    plt.show()


def projectile_motion() -> None:
    gravity, initial_velocity, initial_height = 9.81, 20, 10
    flight_time = np.sqrt(2 * initial_height / gravity)
    time = np.linspace(0, flight_time, 500)
    distance = initial_velocity * time
    height = initial_height - 0.5 * gravity * time**2
    plt.plot(distance, height)
    plt.title("Quỹ đạo ném ngang")
    plt.xlabel("Khoảng cách ngang (m)")
    plt.ylabel("Độ cao (m)")
    plt.grid()
    plt.show()


if __name__ == "__main__":
    chart_gallery()
