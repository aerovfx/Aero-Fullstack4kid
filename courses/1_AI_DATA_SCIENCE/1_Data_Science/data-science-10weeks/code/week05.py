"""Tuần 5: đọc, kiểm tra và ghi dữ liệu bằng Pandas."""

from pathlib import Path
import sqlite3

import pandas as pd


DATA_DIR = Path(__file__).parent / "data"


def read_sources() -> dict[str, pd.DataFrame]:
    with sqlite3.connect(DATA_DIR / "sample-data.sql") as connection:
        sql_frame = pd.read_sql("SELECT * FROM sample_table", connection)
    return {
        "csv": pd.read_csv(DATA_DIR / "sample-data.csv"),
        "excel": pd.read_excel(DATA_DIR / "sample-data.xlsx"),
        "json": pd.read_json(DATA_DIR / "sample-data.json"),
        "sqlite": sql_frame,
    }


def main() -> None:
    for name, frame in read_sources().items():
        print(f"{name:>6}: shape={frame.shape}, columns={frame.columns.tolist()}")
        print(frame.head(2))


if __name__ == "__main__":
    main()
