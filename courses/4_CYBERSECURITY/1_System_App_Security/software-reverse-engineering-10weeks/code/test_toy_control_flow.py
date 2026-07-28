from __future__ import annotations

import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path


SOURCE = Path(__file__).with_name("toy_control_flow.c")


class ToyControlFlowTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.compiler = shutil.which("cc") or shutil.which("clang") or shutil.which("gcc")
        if cls.compiler is None:
            raise unittest.SkipTest("No C compiler is available")
        cls.temp_directory = tempfile.TemporaryDirectory()
        cls.binary = Path(cls.temp_directory.name) / "toy_control_flow"
        subprocess.run(
            [cls.compiler, "-std=c11", "-Wall", "-Wextra", "-Werror", str(SOURCE), "-o", str(cls.binary)],
            check=True,
        )

    @classmethod
    def tearDownClass(cls) -> None:
        if hasattr(cls, "temp_directory"):
            cls.temp_directory.cleanup()

    def run_score(self, value: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run([str(self.binary), value], text=True, capture_output=True, check=False)

    def test_score_boundaries(self) -> None:
        expected = {"-1": -1, "0": 0, "49": 0, "50": 1, "79": 1, "80": 2, "100": 2, "101": -1}
        for value, category in expected.items():
            with self.subTest(value=value):
                result = self.run_score(value)
                self.assertEqual(result.returncode, 0)
                self.assertEqual(result.stdout.strip(), f"class={category}")

    def test_rejects_non_integer(self) -> None:
        result = self.run_score("80x")
        self.assertEqual(result.returncode, 2)
        self.assertIn("invalid integer", result.stderr)


if __name__ == "__main__":
    unittest.main()
