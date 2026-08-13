"""Tuần 7: làm sạch dữ liệu thiếu, trùng và sai kiểu."""

from pathlib import Path

import pandas as pd


DATA_FILE = Path(__file__).parent / "data" / "sample-data.csv"


def clean(frame: pd.DataFrame) -> pd.DataFrame:
    result = frame.copy()
    result.columns = result.columns.str.strip().str.lower()
    result = result.drop_duplicates()
    for column in ["age", "salary"]:
        result[column] = pd.to_numeric(result[column], errors="coerce")
        result[column] = result[column].fillna(result[column].median())
    return result


def main() -> None:
    dirty = pd.read_csv(DATA_FILE)
    dirty.loc[1, "Age"] = None
    dirty = pd.concat([dirty, dirty.iloc[[0]]], ignore_index=True)
    cleaned = clean(dirty)
    print("Trước:", dirty.shape, "thiếu:", int(dirty.isna().sum().sum()))
    print("Sau:", cleaned.shape, "thiếu:", int(cleaned.isna().sum().sum()))


if __name__ == "__main__":
    main()
