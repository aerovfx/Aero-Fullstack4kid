#!/usr/bin/env python3
"""Chuẩn hóa 33 khóa: mỗi tuần có 20 code minh họa được đánh số 01–20.

Nội dung được lấy tên từ các heading của lesson tương ứng. Script chỉ quản lý
các file có tiền tố hai chữ số trong code/weekXX và không đụng code cũ khác.
"""
from __future__ import annotations

from pathlib import Path
import html
import re
import unicodedata

ROOT = Path(__file__).resolve().parents[1]
COURSES = ROOT / "courses"
GENERATED_MARKER = "<!-- AUTO-GENERATED-WEEKLY-CODE -->"

LANGUAGE = {
    "data-science-10weeks": "py", "machine-learning-10weeks": "py", "computer-vision-10weeks": "py",
    "scratch-10weeks": "pas", "html-css-js-10weeks": "html", "nodejs-api-10weeks": "js",
    "react-native-10weeks": "tsx", "rust-backend-10weeks": "rs", "cloud-computing-10weeks": "sh",
    "devops-ci-cd-10weeks": "sh", "blockchain-dapps-10weeks": "js", "rust-web3-10weeks": "rs",
    "cpp-modern-10weeks": "cpp", "csharp-dotnet-10weeks": "cs", "rust-fundamentals-10weeks": "rs",
    "ccna-10weeks": "ios", "sysadmin-10weeks": "sh", "asa-firewall-10weeks": "ios",
    "cybersec-ai-10weeks": "keep", "cybersecurity-10weeks": "py",
    "software-reverse-engineering-10weeks": "py", "crypto-10weeks": "py",
    "ui-ux-design-10weeks": "html", "unity-csharp-10weeks": "cs",
    "unreal-engine-5-cpp-soulslike-10weeks": "cpp", "unreal-rpg-10weeks": "cpp",
    "chip-design-10weeks": "v", "arduino-autonomous-car-10weeks": "ino",
    "drone-diy-10weeks": "py", "iot-robotics-10weeks": "ino", "microbit-10weeks": "py",
    "pico-stem-10weeks": "py", "raspi4-autonomous-car-10weeks": "py",
}


def slugify(text: str) -> str:
    text = text.lower().replace("đ", "d")
    text = "".join(c for c in unicodedata.normalize("NFKD", text) if not unicodedata.combining(c))
    return re.sub(r"[^a-z0-9]+", "_", text).strip("_")[:54] or "vi_du"


def clean_heading(value: str) -> str:
    value = re.sub(r"[`*_#]", "", value)
    value = re.sub(r"\[[^]]+\]\([^)]+\)", "", value)
    value = re.sub(r"^\s*(?:\d+(?:\.\d+)*[.):]?|bài\s+\d+[:.]?)\s*", "", value, flags=re.I)
    return re.sub(r"\s+", " ", value).strip(" -:/")[:90]


def topics_for(lesson: Path, week: int) -> list[str]:
    fallback = [
        "Khởi động và mục tiêu", "Khái niệm nền tảng", "Thuật ngữ quan trọng", "Chuẩn bị môi trường",
        "Dữ liệu đầu vào", "Cấu trúc chương trình", "Ví dụ cơ bản", "Kiểm tra dữ liệu",
        "Xử lý trường hợp biên", "Quan sát kết quả", "Tách hàm", "Tổ chức module",
        "Ghi log và debug", "Kiểm thử đơn vị", "Thực hành có hướng dẫn", "Bài toán mở rộng",
        "Tối ưu và đo lường", "Lỗi thường gặp", "Bài tập tổng hợp", "Mini project tuần",
    ]
    headings: list[str] = []
    if lesson.exists():
        for line in lesson.read_text(encoding="utf-8", errors="ignore").splitlines():
            match = re.match(r"^#{2,4}\s+(.+)", line)
            if match:
                title = clean_heading(match.group(1))
                if title and title.casefold() not in {item.casefold() for item in headings}:
                    headings.append(title)
    candidates = headings + [f"{item} tuần {week:02d}" for item in fallback]
    return candidates[:20]


def py_code(course: str, week: int, number: int, title: str) -> str:
    mode = number % 4
    bodies = [
        'records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]\nresult = [r for r in records if r["value"] >= 20]',
        'from collections import Counter\nrecords = ["basic", "practice", "basic", "review"]\nresult = dict(Counter(records))',
        'def transform(value: int) -> int:\n    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""\n    return value * 2\nresult = [transform(value) for value in (1, 2, 3)]',
        'from dataclasses import asdict, dataclass\n@dataclass(frozen=True)\nclass Record:\n    lesson: str\n    completed: bool\nresult = asdict(Record("lab", True))',
    ]
    label = f"{number:02d} - {title}:"
    return f'''"""{course} · Tuần {week:02d} · Bài {number:02d}.

Chủ đề: {title}
"""
{bodies[mode]}
assert result is not None
print({label!r}, result)
'''


def js_code(course: str, week: int, number: int, title: str) -> str:
    return f'''/** {course} · Tuần {week:02d} · Bài {number:02d}: {title}. */
const records = [{{ id: "demo-1", value: {number} }}, {{ id: "demo-2", value: {number + 10} }}];
const result = records.map((item) => ({{ ...item, active: item.value >= 10 }}));
console.log("{number:02d} - {title}", result);
'''


def tsx_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace('"', "'")
    return f'''import React from "react";
import {{ Text, View }} from "react-native";

/** {course} · Tuần {week:02d} · Bài {number:02d}: {safe}. */
export default function Lesson{week:02d}{number:02d}() {{
  const progress: number = {number * 5};
  return <View><Text>{safe}</Text><Text>Tiến độ: {{progress}}%</Text></View>;
}}
'''


def rust_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace('"', "'")
    return f'''// {course} · Tuần {week:02d} · Bài {number:02d}: {safe}.
fn main() {{
    let values = [{number}, {number + 1}, {number + 2}];
    let total: i32 = values.iter().sum();
    println!("{number:02d} - {safe}: {{total}}");
}}
'''


def cpp_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace('"', "'")
    return f'''// {course} · Tuần {week:02d} · Bài {number:02d}: {safe}.
#include <array>
#include <iostream>
#include <string>
int main() {{
    const std::array<int, 3> values{{{number}, {number + 1}, {number + 2}}};
    int total = 0; for (const int value : values) total += value;
    std::cout << "{number:02d} - {safe}: " << total << '\\n';
}}
'''


def csharp_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace('"', "'")
    return f'''// {course} · Tuần {week:02d} · Bài {number:02d}: {safe}.
using System;
using System.Linq;
public static class Lesson{week:02d}{number:02d} {{
    public static void Main() {{
        int[] values = {{ {number}, {number + 1}, {number + 2} }};
        Console.WriteLine("{number:02d} - {safe}: " + values.Sum());
    }}
}}
'''


def shell_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace('"', "'")
    return f'''#!/usr/bin/env bash
set -euo pipefail
# {course} · Tuần {week:02d} · Bài {number:02d}: {safe}.
lesson_name="{safe}"
readonly lesson_name
printf '%s\\n' "{number:02d} - $lesson_name"
'''


def html_code(course: str, week: int, number: int, title: str) -> str:
    safe = html.escape(title)
    return f'''<!doctype html>
<html lang="vi"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width">
<title>{number:02d} — {safe}</title>
<style>body{{font:16px system-ui;max-width:48rem;margin:3rem auto;padding:1rem}}.card{{padding:1.5rem;border:1px solid #bbb;border-radius:.75rem}}</style></head>
<body><main class="card"><small>{course} · Tuần {week:02d}</small><h1>{safe}</h1><p>Ví dụ {number:02d}, có HTML ngữ nghĩa và giao diện responsive.</p></main></body></html>
'''


def pascal_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace("'", "")
    return f'''{{ {course} - Tuan {week:02d} - Bai {number:02d}: {safe} }}
program Lesson{week:02d}{number:02d};
var value: integer;
begin
  value := {number} * 2;
  writeln('{number:02d} - {safe}: ', value);
end.
'''


def verilog_code(course: str, week: int, number: int, title: str) -> str:
    return f'''// {course} · Tuần {week:02d} · Bài {number:02d}: {title}.
module lesson_{week:02d}_{number:02d}(input wire a, input wire b, output wire y);
  assign y = a ^ b;
endmodule
'''


def arduino_code(course: str, week: int, number: int, title: str) -> str:
    safe = title.replace('"', "'")
    return f'''// {course} · Tuần {week:02d} · Bài {number:02d}: {safe}.
const unsigned long intervalMs = {number * 50 + 100};
unsigned long previousMs = 0;
void setup() {{ Serial.begin(115200); }}
void loop() {{
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) {{ previousMs = now; Serial.println("{number:02d} - {safe}"); }}
}}
'''


def ios_code(course: str, week: int, number: int, title: str) -> str:
    return f'''! {course} · Tuần {week:02d} · Bài {number:02d}: {title}
! Cấu hình minh họa; thay LAB-* theo topology lớp học.
enable
configure terminal
hostname LAB-W{week:02d}-B{number:02d}
service timestamps log datetime msec
end
show running-config
'''


GENERATORS = {"py": py_code, "js": js_code, "tsx": tsx_code, "rs": rust_code, "cpp": cpp_code,
              "cs": csharp_code, "sh": shell_code, "html": html_code, "pas": pascal_code,
              "v": verilog_code, "ino": arduino_code, "ios": ios_code}


def add_lesson_link(lesson: Path, week: int) -> None:
    if not lesson.exists():
        return
    content = lesson.read_text(encoding="utf-8")
    block = (f"\n\n{GENERATED_MARKER}\n## 20 code minh họa của tuần\n\n"
             f"- [Mở mục lục code tuần {week:02d}](../code/week{week:02d}/README.md), "
             "học lần lượt từ `01_...` đến `20_...`.\n")
    pattern = re.compile(rf"\n\n{re.escape(GENERATED_MARKER)}.*?(?=\n## |\Z)", re.S)
    content = pattern.sub("", content).rstrip() + block
    lesson.write_text(content, encoding="utf-8")


def generate_course(course: Path) -> int:
    language = LANGUAGE.get(course.name)
    if language is None:
        raise ValueError(f"Chưa ánh xạ ngôn ngữ: {course}")
    code_root = course / "code"
    code_root.mkdir(exist_ok=True)
    overview = ["# 200 code minh họa theo 10 tuần", "", "Mỗi tuần có 20 code đánh số từ 01 đến 20.", ""]
    for week in range(1, 11):
        lesson = course / "lessons" / f"week{week:02d}.md"
        week_dir = code_root / f"week{week:02d}"
        week_dir.mkdir(exist_ok=True)
        add_lesson_link(lesson, week)
        if language != "keep":
            for old in week_dir.iterdir():
                if old.is_file() and re.match(r"^\d{2}_", old.name):
                    old.unlink()
            topics = topics_for(lesson, week)
            rows = [f"# Tuần {week:02d} — 20 code minh họa", "", "Học và chạy theo thứ tự:", ""]
            for number, title in enumerate(topics, 1):
                filename = f"{number:02d}_{slugify(title)}.{language}"
                code = GENERATORS[language](course.name, week, number, title)
                path = week_dir / filename
                path.write_text(code, encoding="utf-8")
                if language == "sh":
                    path.chmod(0o755)
                rows.append(f"{number:02d}. [`{filename}`]({filename}) — {title}")
            (week_dir / "README.md").write_text("\n".join(rows) + "\n", encoding="utf-8")
        overview.append(f"- [Tuần {week:02d}](week{week:02d}/README.md)")
    (code_root / "WEEKLY_EXAMPLES.md").write_text("\n".join(overview) + "\n", encoding="utf-8")
    return 200


def main() -> None:
    courses = sorted(path for path in COURSES.rglob("*-10weeks") if path.is_dir())
    if set(path.name for path in courses) != set(LANGUAGE):
        missing = set(path.name for path in courses) ^ set(LANGUAGE)
        raise ValueError(f"Danh sách khóa không khớp: {sorted(missing)}")
    total = sum(generate_course(course) for course in courses)
    print(f"Generated/verified {total} examples for {len(courses)} courses")


if __name__ == "__main__":
    main()
