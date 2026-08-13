"""Pipeline Pandas tuần 5–8: đọc, kiểm tra, làm sạch và xuất dữ liệu."""

from pathlib import Path
import sqlite3

import pandas as pd


RAW = Path(__file__).parents[2] / "raw_materials" / "ch04_Pandas"
OUTPUT = Path(__file__).parent / "output"


def read_sources() -> dict[str, pd.DataFrame]:
    """Đọc các nguồn mẫu mà không thay đổi file gốc."""
    with sqlite3.connect(RAW / "sample-data.sql") as connection:
        table = pd.read_sql("SELECT * FROM sample_table", connection)
    return {
        "csv": pd.read_csv(RAW / "sample-data.csv"),
        "excel": pd.read_excel(RAW / "sample-data.xlsx"),
        "json": pd.read_json(RAW / "sample-data.json"),
        "sqlite": table,
    }


def clean_people(data: pd.DataFrame) -> pd.DataFrame:
    cleaned = data.copy()
    cleaned.columns = cleaned.columns.str.strip().str.lower()
    cleaned = cleaned.drop_duplicates()
    cleaned["age"] = pd.to_numeric(cleaned["age"], errors="coerce")
    cleaned["salary"] = pd.to_numeric(cleaned["salary"], errors="coerce")
    cleaned["age"] = cleaned["age"].fillna(cleaned["age"].median())
    cleaned["salary"] = cleaned["salary"].fillna(cleaned["salary"].median())
    cleaned["salary_band"] = pd.cut(
        cleaned["salary"], bins=[0, 60_000, 85_000, float("inf")],
        labels=["junior", "mid", "senior"],
    )
    return cleaned


def main() -> None:
    sources = read_sources()
    for name, frame in sources.items():
        print(f"{name:>6}: shape={frame.shape}, columns={frame.columns.tolist()}")

    cleaned = clean_people(sources["csv"])
    summary = cleaned.groupby("salary_band", observed=True).agg(
        people=("name", "count"), average_salary=("salary", "mean")
    )
    print("\nBáo cáo:\n", summary)

    OUTPUT.mkdir(exist_ok=True)
    cleaned.to_csv(OUTPUT / "people_clean.csv", index=False)
    cleaned.to_json(OUTPUT / "people_clean.json", orient="records", force_ascii=False)
    summary.to_excel(OUTPUT / "salary_summary.xlsx")


if __name__ == "__main__":
    main()
