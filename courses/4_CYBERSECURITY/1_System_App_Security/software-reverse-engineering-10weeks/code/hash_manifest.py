"""Create or verify SHA-256 manifests for authorized lab artifacts."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def digest(path: Path) -> str:
    value = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            value.update(chunk)
    return value.hexdigest()


def create(manifest: Path, files: list[Path]) -> None:
    records = [{"path": str(path.resolve()), "sha256": digest(path)} for path in files]
    manifest.write_text(json.dumps(records, indent=2) + "\n", encoding="utf-8")


def verify(manifest: Path) -> bool:
    records = json.loads(manifest.read_text(encoding="utf-8"))
    passed = True
    for record in records:
        path = Path(record["path"])
        actual = digest(path) if path.is_file() else None
        ok = actual == record["sha256"]
        print(f"{'OK' if ok else 'FAIL'} {path}")
        passed &= ok
    return passed


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    create_parser = subparsers.add_parser("create")
    create_parser.add_argument("manifest", type=Path)
    create_parser.add_argument("files", nargs="+", type=Path)
    verify_parser = subparsers.add_parser("verify")
    verify_parser.add_argument("manifest", type=Path)
    args = parser.parse_args()

    if args.command == "create":
        create(args.manifest, args.files)
    elif not verify(args.manifest):
        raise SystemExit(1)


if __name__ == "__main__":
    main()

