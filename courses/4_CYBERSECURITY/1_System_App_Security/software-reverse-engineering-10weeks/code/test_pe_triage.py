import struct
import tempfile
import unittest
from pathlib import Path

from pe_triage import inspect


def build_minimal_pe(path: Path, *, pe32_plus: bool = True) -> None:
    pe_offset = 0x80
    optional_size = 0xF0 if pe32_plus else 0xE0
    image = bytearray(pe_offset + 4 + 20 + optional_size + 40)
    image[0:2] = b"MZ"
    struct.pack_into("<I", image, 0x3C, pe_offset)
    image[pe_offset : pe_offset + 4] = b"PE\0\0"

    machine = 0x8664 if pe32_plus else 0x014C
    struct.pack_into(
        "<HHIIIHH", image, pe_offset + 4,
        machine, 1, 1_700_000_000, 0, 0, optional_size, 0x0022,
    )

    optional_offset = pe_offset + 24
    struct.pack_into("<H", image, optional_offset, 0x20B if pe32_plus else 0x10B)
    struct.pack_into("<I", image, optional_offset + 16, 0x1000)
    if pe32_plus:
        struct.pack_into("<Q", image, optional_offset + 24, 0x140000000)
    else:
        struct.pack_into("<I", image, optional_offset + 28, 0x00400000)
    struct.pack_into("<H", image, optional_offset + 70, 0x4140)

    section_offset = optional_offset + optional_size
    image[section_offset : section_offset + 8] = b".text\0\0\0"
    struct.pack_into("<III", image, section_offset + 8, 0x200, 0x1000, 0x200)
    struct.pack_into("<I", image, section_offset + 36, 0x60000020)
    path.write_bytes(image)


class InspectTests(unittest.TestCase):
    def test_reads_pe32_plus_metadata(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "sample.exe"
            build_minimal_pe(path)
            report = inspect(path)
            self.assertEqual(report.format, "PE32+")
            self.assertEqual(report.architecture, "x86-64")
            self.assertEqual(report.entry_point_rva, "0x1000")
            self.assertTrue(report.dynamic_base)
            self.assertTrue(report.nx_compatible)
            self.assertTrue(report.guard_cf)
            self.assertEqual(report.sections[0].name, ".text")

    def test_rejects_non_pe_file(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "not-pe.bin"
            path.write_bytes(b"not a PE file")
            with self.assertRaisesRegex(ValueError, "too small"):
                inspect(path)


if __name__ == "__main__":
    unittest.main()
