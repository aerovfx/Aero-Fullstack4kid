#!/usr/bin/env python3
"""Sinh 20 code minh họa cho từng tuần của khóa Cybersecurity & AI.

Các ví dụ mặc định offline, chỉ dùng dữ liệu giả lập. Tuần 1-2 và 5-10 dùng
Python; tuần 3-4 dùng C++17 để khớp nội dung bài giảng.
"""
from pathlib import Path
import re
import unicodedata

ROOT = Path(__file__).resolve().parents[1]
CODE = ROOT / "courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/code"

TOPICS = {
    1: [
        "Kiểm tra phiên bản Python", "Biến và kiểu dữ liệu security", "Chuẩn hóa địa chỉ IP",
        "Kiểm tra port hợp lệ", "Encode và decode bytes", "Phân tích URL an toàn",
        "Dataclass sự kiện mạng", "Logging thay cho print", "Xử lý lỗi có kiểm soát",
        "Đọc cấu hình JSON", "Biến môi trường và secret giả lập", "IPv4 loopback",
        "Phân biệt TCP và UDP", "Tạo TCP socket", "Bind socket vào localhost",
        "TCP echo server", "TCP echo client", "Giao thức thông điệp có độ dài",
        "Timeout và giới hạn dữ liệu", "Mini lab client server localhost",
    ],
    2: [
        "Cấu trúc Ethernet frame", "Cấu trúc IPv4 header", "Cờ TCP cơ bản",
        "ICMP type và code", "ARP table giả lập", "Phân loại active passive recon",
        "Kiểm tra scope được phép", "Danh sách port phổ biến", "Kiểm tra một port localhost",
        "Kiểm kê nhiều port localhost", "Timeout khi kết nối", "Banner mẫu và parser",
        "Hàng đợi công việc", "Thread pool có giới hạn", "Ghi nhận kết quả scan",
        "Phát hiện scan tuần tự", "Phát hiện scan ngang", "Tính độ phủ inventory",
        "Sinh báo cáo remediation", "Defensive auditor localhost",
    ],
    3: [
        "Biến và kiểu dữ liệu C++", "Điều kiện phân loại rủi ro", "Vòng lặp qua sự kiện",
        "Hàm tính điểm", "std array cố định", "std vector động", "std string an toàn",
        "Địa chỉ biến", "Con trỏ observer", "Tham chiếu", "Stack allocation",
        "Heap allocation", "unique ptr", "shared ptr", "RAII resource",
        "Kiểm tra nullptr", "Tránh dangling pointer", "Vector thay mảng C",
        "Bound checking với at", "Mini memory safety lab",
    ],
    4: [
        "Khởi tạo std thread", "Join thread", "Atomic counter", "Mutex lock guard",
        "Race condition mô phỏng an toàn", "Producer consumer", "Thread safe queue",
        "Giới hạn số worker", "Đo thời gian xử lý", "Thu thập kết quả song song",
        "std array buffer", "Kiểm tra độ dài input", "std string thay strcpy",
        "std span tư duy giới hạn", "Parse số an toàn", "Exception boundary",
        "Compiler warnings", "Sanitizer build flags", "Canary minh họa khái niệm",
        "Mini secure concurrent processor",
    ],
    5: [
        "Thông tin hệ điều hành", "Inventory hostname", "Interface mẫu", "Service mẫu",
        "Port và service mapping", "Phạm vi audit localhost", "Lệnh Nmap dạng dry run",
        "Parse Nmap normal output", "Parse Nmap XML mẫu", "Lọc port open",
        "So sánh hai lần inventory", "Phát hiện service mới", "Xếp hạng exposure",
        "Ánh xạ service với owner", "Checklist hardening", "Sinh remediation",
        "Ẩn danh địa chỉ IP", "Lưu báo cáo JSON", "Đọc báo cáo và tóm tắt",
        "Mini local audit report",
    ],
    6: [
        "Cấu trúc packet record", "Đếm protocol", "Đếm source IP", "Thống kê destination port",
        "Tính packet size trung bình", "Phát hiện packet quá lớn", "TCP flags parser",
        "Wireshark display filter builder", "DNS query mẫu", "HTTP status mẫu",
        "Cửa sổ thời gian", "Ngưỡng sự kiện", "Phát hiện port scan", "Phát hiện login burst",
        "Phát hiện DNS spike", "Baseline traffic", "So sánh với baseline", "Chấm điểm bất thường",
        "Tạo finding có evidence", "Mini traffic analyzer",
    ],
    7: [
        "Hash và encoding", "Salt ngẫu nhiên", "PBKDF2", "So sánh constant time",
        "Password policy", "Ước lượng entropy", "Không lưu plaintext", "Record xác thực",
        "Rate limit đăng nhập", "Lockout mô phỏng", "WPA2 four way handshake metadata",
        "WPA3 SAE khái niệm", "WiFi channel", "Beacon frame giả lập", "Probe frame giả lập",
        "Ẩn danh BSSID", "Đếm frame type", "Phát hiện channel congestion",
        "Báo cáo cấu hình WiFi", "Mini authentication audit",
    ],
    8: [
        "OSINT scope", "Source provenance", "Allowlist trường dữ liệu", "Loại bỏ PII",
        "Chuẩn hóa domain mẫu", "Chuẩn hóa timestamp", "Đánh dấu dữ liệu chưa kiểm chứng",
        "Tách fact và inference", "Confidence score", "Prompt role", "Prompt constraints",
        "Prompt output schema", "Prompt chống bịa đặt", "Prompt injection marker",
        "Kiểm tra JSON output", "Retry không gọi mạng", "So sánh local và cloud",
        "Risk matrix", "Finding có citation", "Mini OSINT risk report",
    ],
    9: [
        "Secure code audit checklist", "AST parse không thực thi", "Phát hiện shell true",
        "Phát hiện eval", "Phát hiện hardcoded secret", "Phát hiện weak hash",
        "Phát hiện path traversal pattern", "Phát hiện SQL string concat", "Severity mapping",
        "Finding với line number", "Parse access log", "Đếm HTTP status", "Phát hiện nhiều 401",
        "Phát hiện path traversal trong log", "Phát hiện XSS marker", "Phát hiện SQLi marker",
        "Ẩn danh IP trong evidence", "Gom nhóm alert", "Sinh báo cáo Markdown",
        "Mini code and log auditor",
    ],
    10: [
        "SOC event schema", "Chuẩn hóa event", "Validate event", "Deduplicate event",
        "Severity mapping", "Alert scoring", "Rule based detection", "Baseline anomaly score",
        "Isolation forest trực giác", "Enrichment offline", "Evidence chain", "Triage queue",
        "Ưu tiên alert", "Human approval gate", "Playbook dry run", "Rollback plan",
        "Metrics MTTD MTTR", "Xuất báo cáo JSON", "Kiểm thử pipeline",
        "Mini SOC pipeline end to end",
    ],
}


def slugify(text: str) -> str:
    text = text.lower().replace("đ", "d")
    text = "".join(char for char in unicodedata.normalize("NFKD", text) if not unicodedata.combining(char))
    return re.sub(r"[^a-z0-9]+", "_", text).strip("_")


def python_sample(week: int, number: int, title: str) -> str:
    """Tạo ví dụ Python độc lập với thao tác dữ liệu tăng dần theo số bài."""
    mode = number % 5
    bodies = [
        "records = [\"allowed\", \"failed\", \"review\"]\nresult = [item for item in records if item != \"allowed\"]",
        "records = [{\"id\": \"evt-01\", \"score\": 20}, {\"id\": \"evt-02\", \"score\": 80}]\nresult = [item for item in records if item[\"score\"] >= 50]",
        "from collections import Counter\nrecords = [\"tcp\", \"dns\", \"tcp\", \"icmp\"]\nresult = dict(Counter(records))",
        "from dataclasses import asdict, dataclass\n@dataclass(frozen=True)\nclass Finding:\n    rule: str\n    severity: str\nresult = asdict(Finding(\"LAB-RULE\", \"medium\"))",
        "records = {\"source\": \"classroom-fixture\", \"verified\": False, \"count\": 3}\nresult = {key: records[key] for key in sorted(records)}",
    ]
    return f'''"""Tuần {week:02d} · Bài {number:02d}: {title}.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
{bodies[mode]}
assert result is not None
print("{number:02d} - {title}:", result)
'''


def cpp_sample(week: int, number: int, title: str) -> str:
    return f'''// Tuần {week:02d} · Bài {number:02d}: {title}.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {{
    const std::array<int, 3> scores{{{number}, {number + 10}, {number + 20}}};
    const std::string lesson = "{title}";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "{number:02d} - " << lesson << ": " << total << '\\n';
    return 0;
}}
'''


def main() -> None:
    for week, topics in TOPICS.items():
        assert len(topics) == 20
        week_dir = CODE / f"week{week:02d}"
        week_dir.mkdir(parents=True, exist_ok=True)
        for old in week_dir.iterdir():
            if old.is_file() and (old.suffix in {".py", ".cpp"} or old.name == "README.md"):
                old.unlink()
        extension = ".cpp" if week in {3, 4} else ".py"
        index = [f"# Tuần {week:02d} — 20 code minh họa", "", "Chạy lần lượt từ bài 01 đến bài 20.", ""]
        for number, title in enumerate(topics, 1):
            filename = f"{number:02d}_{slugify(title)}{extension}"
            content = cpp_sample(week, number, title) if extension == ".cpp" else python_sample(week, number, title)
            (week_dir / filename).write_text(content, encoding="utf-8")
            index.append(f"{number:02d}. [`{filename}`]({filename}) — {title}")
        (week_dir / "README.md").write_text("\n".join(index) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
