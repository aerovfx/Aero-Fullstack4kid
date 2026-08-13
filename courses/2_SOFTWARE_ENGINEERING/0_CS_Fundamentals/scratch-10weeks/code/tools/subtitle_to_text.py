"""Chuyển SRT/VTT thành text; chuẩn hóa từ raw_materials/sub2text.py."""
from pathlib import Path
import argparse
import re
TIMESTAMP = re.compile(r"^\d{2}:\d{2}:\d{2}[,.]\d{3}\s+-->")
def extract(path: Path) -> str:
    lines = path.read_text(encoding="utf-8").splitlines()
    kept = [line.strip() for line in lines if line.strip() and line.strip() != "WEBVTT" and not line.strip().isdigit() and not TIMESTAMP.match(line.strip())]
    return " ".join(kept)
def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    if args.input.suffix.lower() not in {".srt", ".vtt"}:
        parser.error("input phải là .srt hoặc .vtt")
    args.output.write_text(extract(args.input), encoding="utf-8")
if __name__ == "__main__":
    main()
