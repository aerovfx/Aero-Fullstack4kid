"""Tuần 6: chọn, lọc và tổng hợp dữ liệu."""

from pathlib import Path

import pandas as pd


DATA_FILE = Path(__file__).parent / "data" / "sample-data.csv"


def main() -> None:
    frame = pd.read_csv(DATA_FILE)
    frame.columns = frame.columns.str.lower()

    high_salary = frame.loc[frame["salary"] >= 80_000, ["name", "occupation", "salary"]]
    summary = frame.groupby("occupation", as_index=False).agg(
        people=("name", "count"), average_salary=("salary", "mean")
    )
    print("Nhân sự lương từ 80.000:\n", high_salary)
    print("Tổng hợp theo nghề:\n", summary)


if __name__ == "__main__":
    main()
