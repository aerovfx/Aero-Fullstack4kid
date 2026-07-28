"""Read PE metadata from an authorized lab file without executing it."""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import BinaryIO


MACHINES = {0x014C: "x86", 0x8664: "x86-64", 0xAA64: "ARM64"}
PE32_MAGIC = 0x10B
PE32_PLUS_MAGIC = 0x20B


@dataclass(frozen=True)
class Section:
    name: str
    virtual_size: int
    virtual_address: int
    raw_size: int
    characteristics: str


@dataclass(frozen=True)
class PeReport:
    path: str
    size: int
    sha256: str
    format: str
    architecture: str
    section_count: int
    coff_timestamp: int
    entry_point_rva: str
    image_base: str
    dynamic_base: bool
    nx_compatible: bool
    guard_cf: bool
    sections: list[Section]


def read_exact(stream: BinaryIO, size: int, label: str) -> bytes:
    data = stream.read(size)
    if len(data) != size:
        raise ValueError(f"Truncated {label}")
    return data


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def flag_string(value: int) -> str:
    flags = []
    if value & 0x20:
        flags.append("code")
    if value & 0x20000000:
        flags.append("execute")
    if value & 0x40000000:
        flags.append("read")
    if value & 0x80000000:
        flags.append("write")
    return ",".join(flags) or "none"


def inspect(path: Path) -> PeReport:
    size = path.stat().st_size
    if size < 64:
        raise ValueError("File is too small to contain a DOS/PE header")

    with path.open("rb") as stream:
        if read_exact(stream, 2, "DOS signature") != b"MZ":
            raise ValueError("Missing MZ signature")

        stream.seek(0x3C)
        pe_offset = struct.unpack("<I", read_exact(stream, 4, "PE offset"))[0]
        if pe_offset < 64 or pe_offset + 24 > size:
            raise ValueError("PE header offset is outside the file")

        stream.seek(pe_offset)
        if read_exact(stream, 4, "PE signature") != b"PE\0\0":
            raise ValueError("Missing PE signature")

        coff = read_exact(stream, 20, "COFF header")
        machine, section_count, timestamp, _, _, optional_size, _ = struct.unpack(
            "<HHIIIHH", coff
        )
        optional = read_exact(stream, optional_size, "optional header")
        if len(optional) < 72:
            raise ValueError("Optional header is too small")

        magic = struct.unpack_from("<H", optional, 0)[0]
        entry_point = struct.unpack_from("<I", optional, 16)[0]
        if magic == PE32_MAGIC:
            pe_format = "PE32"
            image_base = struct.unpack_from("<I", optional, 28)[0]
        elif magic == PE32_PLUS_MAGIC:
            pe_format = "PE32+"
            image_base = struct.unpack_from("<Q", optional, 24)[0]
        else:
            raise ValueError(f"Unsupported optional-header magic 0x{magic:04x}")

        dll_characteristics = struct.unpack_from("<H", optional, 70)[0]
        sections = []
        for index in range(section_count):
            raw = read_exact(stream, 40, f"section header {index}")
            name = raw[:8].split(b"\0", 1)[0].decode("ascii", errors="replace")
            virtual_size, virtual_address, raw_size = struct.unpack_from("<III", raw, 8)
            characteristics = struct.unpack_from("<I", raw, 36)[0]
            sections.append(
                Section(
                    name=name or f"<unnamed-{index}>",
                    virtual_size=virtual_size,
                    virtual_address=virtual_address,
                    raw_size=raw_size,
                    characteristics=flag_string(characteristics),
                )
            )

    return PeReport(
        path=str(path.resolve()),
        size=size,
        sha256=sha256(path),
        format=pe_format,
        architecture=MACHINES.get(machine, f"unknown-0x{machine:04x}"),
        section_count=section_count,
        coff_timestamp=timestamp,
        entry_point_rva=f"0x{entry_point:x}",
        image_base=f"0x{image_base:x}",
        dynamic_base=bool(dll_characteristics & 0x0040),
        nx_compatible=bool(dll_characteristics & 0x0100),
        guard_cf=bool(dll_characteristics & 0x4000),
        sections=sections,
    )


def print_text(report: PeReport) -> None:
    data = asdict(report)
    sections = data.pop("sections")
    for key, value in data.items():
        print(f"{key}: {value}")
    print("sections:")
    for section in sections:
        print(
            "  "
            f"{section['name']}: RVA=0x{section['virtual_address']:x}, "
            f"virtual={section['virtual_size']}, raw={section['raw_size']}, "
            f"flags={section['characteristics']}"
        )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", action="store_true", help="Emit machine-readable JSON")
    parser.add_argument("file", type=Path)
    args = parser.parse_args()
    try:
        report = inspect(args.file)
    except (OSError, ValueError) as error:
        parser.error(str(error))

    if args.json:
        print(json.dumps(asdict(report), indent=2))
    else:
        print_text(report)


if __name__ == "__main__":
    main()

