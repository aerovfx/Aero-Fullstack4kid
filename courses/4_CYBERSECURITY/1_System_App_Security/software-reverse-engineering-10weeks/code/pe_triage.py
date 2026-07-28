"""Static PE triage for authorized lab files. The target is never executed."""

from __future__ import annotations

import argparse
import hashlib
import struct
from pathlib import Path


MACHINES = {0x14C: "x86", 0x8664: "x86-64", 0xAA64: "ARM64"}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def inspect(path: Path) -> dict[str, object]:
    size = path.stat().st_size
    if size < 64:
        raise ValueError("File is too small to contain a DOS/PE header")

    with path.open("rb") as stream:
        if stream.read(2) != b"MZ":
            raise ValueError("Missing MZ signature")
        stream.seek(0x3C)
        pe_offset = struct.unpack("<I", stream.read(4))[0]
        if pe_offset + 24 > size:
            raise ValueError("PE header offset is outside the file")
        stream.seek(pe_offset)
        if stream.read(4) != b"PE\0\0":
            raise ValueError("Missing PE signature")
        machine, sections, timestamp = struct.unpack("<HHI", stream.read(8))

    return {
        "path": str(path.resolve()),
        "size": size,
        "sha256": sha256(path),
        "architecture": MACHINES.get(machine, f"unknown-0x{machine:04x}"),
        "sections": sections,
        "coff_timestamp": timestamp,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("file", type=Path)
    args = parser.parse_args()
    try:
        for key, value in inspect(args.file).items():
            print(f"{key}: {value}")
    except (OSError, ValueError) as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()

