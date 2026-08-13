"""Tuần 8: ghép bảng và xây pipeline biến đổi."""

import pandas as pd


def main() -> None:
    customers = pd.DataFrame(
        {"customer_id": [1, 2, 3], "name": ["An", "Bình", "Chi"]}
    )
    orders = pd.DataFrame(
        {"order_id": [101, 102, 103, 104], "customer_id": [1, 1, 2, 4],
         "amount": [120, 80, 250, 50]}
    )

    merged = orders.merge(customers, on="customer_id", how="left", validate="many_to_one")
    merged["customer_type"] = pd.cut(
        merged["amount"], bins=[0, 100, float("inf")], labels=["standard", "high_value"]
    )
    print(merged)
    print("Đơn hàng chưa khớp khách:", int(merged["name"].isna().sum()))


if __name__ == "__main__":
    main()
