"""Tuần 1: kiểm tra môi trường phân tích dữ liệu."""

import platform

import matplotlib
import numpy
import pandas
import scipy
import seaborn
import sklearn


def main() -> None:
    packages = {
        "Python": platform.python_version(),
        "NumPy": numpy.__version__,
        "Pandas": pandas.__version__,
        "Matplotlib": matplotlib.__version__,
        "Seaborn": seaborn.__version__,
        "SciPy": scipy.__version__,
        "Scikit-learn": sklearn.__version__,
    }
    for name, version in packages.items():
        print(f"{name:>12}: {version}")


if __name__ == "__main__":
    main()
