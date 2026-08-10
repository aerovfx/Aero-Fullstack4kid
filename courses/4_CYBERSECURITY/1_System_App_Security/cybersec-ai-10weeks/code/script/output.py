"""
Phase 4 - Output
Định dạng kết quả quét thành bảng terminal dễ đọc, hoặc export JSON/CSV
để tích hợp với công cụ khác (dùng thuần stdlib, không cần `rich`).
"""

import csv
import json
import sys
from dataclasses import asdict, dataclass


@dataclass
class ScanRecord:
    host: str
    port: int
    state: str
    service: str
    banner: str


def print_table(records: list[ScanRecord]) -> None:
    if not records:
        print("[!] Khong co ket qua nao de hien thi.")
        return

    col_port = max(len("PORT"), max(len(f"{r.port}/tcp") for r in records))
    col_state = max(len("STATE"), max(len(r.state) for r in records))
    col_service = max(len("SERVICE"), max(len(r.service) for r in records))

    header = f"{'PORT'.ljust(col_port)}  {'STATE'.ljust(col_state)}  {'SERVICE'.ljust(col_service)}  BANNER"
    print(header)
    print("-" * len(header))

    current_host = None
    for r in records:
        if r.host != current_host:
            current_host = r.host
            print(f"\nHost: {current_host}")
        line = (
            f"{f'{r.port}/tcp'.ljust(col_port)}  "
            f"{r.state.ljust(col_state)}  "
            f"{r.service.ljust(col_service)}  "
            f"{r.banner}"
        )
        print(line)


def export_json(records: list[ScanRecord], path: str) -> None:
    with open(path, "w", encoding="utf-8") as f:
        json.dump([asdict(r) for r in records], f, ensure_ascii=False, indent=2)


def export_csv(records: list[ScanRecord], path: str) -> None:
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=["host", "port", "state", "service", "banner"])
        writer.writeheader()
        for r in records:
            writer.writerow(asdict(r))


if __name__ == "__main__":
    # Demo nhanh với dữ liệu giả
    sample = [
        ScanRecord("127.0.0.1", 22, "open", "ssh", "OpenSSH_9.6"),
        ScanRecord("127.0.0.1", 80, "open", "http", "HTTP/1.1 200 OK"),
        ScanRecord("127.0.0.1", 443, "closed", "https", ""),
    ]
    print_table(sample)
    export_json(sample, "/tmp/demo_scan.json")
    export_csv(sample, "/tmp/demo_scan.csv")
    print("\n[+] Da xuat /tmp/demo_scan.json va /tmp/demo_scan.csv")
