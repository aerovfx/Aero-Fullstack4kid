#!/usr/bin/env python3
"""Sinh dữ liệu Jekyll cho GitHub Pages (site/_data/courses.yml + site/courses/*.md)
từ toàn bộ thư mục courses/<NHOM>/<Nganh>/<khoa-10weeks>/INDEX.md.

Chạy: python3 tools/generate_site_pages.py
"""
import os
import re
import yaml
from collections import OrderedDict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
COURSES = os.path.join(ROOT, "courses")
SITE = os.path.join(ROOT, "site")
DATA_DIR = os.path.join(SITE, "_data")
PAGES_DIR = os.path.join(SITE, "courses")

GROUP_LABEL = {
    "1_AI_DATA_SCIENCE": "1. AI & Data Science",
    "2_SOFTWARE_ENGINEERING": "2. Software Engineering",
    "3_INFRA_NETWORKING": "3. Infrastructure & Networking",
    "4_CYBERSECURITY": "4. Cybersecurity",
    "5_GRAPHICS_HCI": "5. Graphics & HCI",
    "6_HARDWARE_EMBEDDED": "6. Hardware & Embedded",
}

GROUP_DESC = {
    "1_AI_DATA_SCIENCE": "Data Science, Machine Learning & Computer Vision",
    "2_SOFTWARE_ENGINEERING": "Lập trình nền tảng, Web, Mobile, Cloud, DevOps, Web3",
    "3_INFRA_NETWORKING": "Mạng máy tính (CCNA), System Administration",
    "4_CYBERSECURITY": "Ethical Hacking (CEH v13), OSINT & AI SOC, Crypto, Reverse Engineering",
    "5_GRAPHICS_HCI": "UI/UX Design, Unity & Unreal Engine GameDev",
    "6_HARDWARE_EMBEDDED": "Chip Design, IoT, Robotics, Microbit/Raspi/Arduino",
}

os.makedirs(DATA_DIR, exist_ok=True)
os.makedirs(PAGES_DIR, exist_ok=True)


def slugify(name):
    name = re.sub(r"[^0-9A-Za-z_-]+", "-", name).strip("-").lower()
    return name


def weeks_of(path):
    # 1) khóa "20 tuần": INDEX.md nói rõ hoặc có thư mục ceh*/lessons/weekNN
    idx = os.path.join(path, "INDEX.md")
    if os.path.isfile(idx):
        txt = open(idx, encoding="utf-8", errors="ignore").read()
        if "20 tuần" in txt or "20 Module" in txt or "Tuần 20" in txt:
            return "20 tuần"
    sub = os.path.join(path, "ceh20weeks", "lessons")
    if os.path.isdir(sub):
        if any(re.match(r"^week2[0]$", f) for f in os.listdir(sub)):
            return "20 tuần"
    # 2) đếm từ schedule.md
    sch = os.path.join(path, "schedule.md")
    if os.path.isfile(sch):
        txt = open(sch, encoding="utf-8", errors="ignore").read()
        wk = re.findall(r"(?i)(?:\b[Ww]eek|\b[Tt]uần)[\s\-]*(\d{1,2})", txt)
        if wk:
            return f"{max(int(w) for w in wk if int(w) <= 40)} tuần"
        if "20 tuần" in txt or "Tuần 20" in txt:
            return "20 tuần"
    return "10 tuần"


def index_title(path):
    idx = os.path.join(path, "INDEX.md")
    if not os.path.isfile(idx):
        return path.split("/")[-1].replace("-", " ").title()
    for line in open(idx, encoding="utf-8", errors="ignore"):
        m = re.match(r"^#\s+(.+)", line.strip())
        if m:
            return m.group(1).strip()[:90]
    return path.split("/")[-1].replace("-", " ").title()


def run():
    groups = OrderedDict()
    for gid in sorted(os.listdir(COURSES)):
        gpath = os.path.join(COURSES, gid)
        if not os.path.isdir(gpath) or gid.startswith("."):
            continue
        gkey = GROUP_LABEL.get(gid, gid)
        groups.setdefault(gkey, {"id": gid, "courses": []})

        for domain in sorted(os.listdir(gpath)):
            dpath = os.path.join(gpath, domain)
            if not os.path.isdir(dpath) or domain.startswith("."):
                continue
            for course_dir in sorted(os.listdir(dpath)):
                cpath = os.path.join(dpath, course_dir)
                if not os.path.isdir(cpath) or not os.path.isfile(os.path.join(cpath, "INDEX.md")):
                    continue
                rel = os.path.relpath(cpath, ROOT).replace(os.sep, "/")
                title = index_title(cpath)
                groups[gkey]["courses"].append({
                    "title": title,
                    "path": rel,
                    "slug": slugify(course_dir),
                    "weeks": weeks_of(cpath),
                    "url": f"/courses/{slugify(course_dir)}",
                })

    # Ghi _data/courses.yml
    out = []
    for name, g in groups.items():
        gid = g["id"]
        out.append({
            "id": gid,
            "num": name.split(".")[0],
            "name": name,
            "description": GROUP_DESC.get(gid, f"Nhóm {name}"),
            "courses": g["courses"],
        })
    data_path = os.path.join(DATA_DIR, "courses.yml")
    with open(data_path, "w", encoding="utf-8") as f:
        yaml.safe_dump(out, f, allow_unicode=True, sort_keys=False)

    # Sinh trang chi tiết cho mỗi khóa (không ghi đè trang đã tùy chỉnh thủ công)
    for name, g in groups.items():
        for c in g["courses"]:
            page = os.path.join(PAGES_DIR, c["slug"] + ".md")
            if os.path.isfile(page) and "## Chương trình" in open(page, encoding="utf-8").read():
                continue
            body = f"---\nlayout: course\ntitle: \"{c['title']}\"\ncourse_group: \"{name}\"\ncourse_path: \"{c['path']}\"\n---\n\n## Thông tin khoá học\n\n- **Lộ trình:** {c['weeks']}\n- **Thư mục:** `{c['path']}`\n\nMở đầy đủ tài liệu khóa học (INDEX, schedule, lessons, code, projects) bằng các nút phía trên.\n"
            with open(page, "w", encoding="utf-8") as f:
                f.write(body)

    total = sum(len(g["courses"]) for g in groups.values())
    print(f"OK: {total} khóa học → {data_path} + {total} trang {PAGES_DIR}")


if __name__ == "__main__":
    run()