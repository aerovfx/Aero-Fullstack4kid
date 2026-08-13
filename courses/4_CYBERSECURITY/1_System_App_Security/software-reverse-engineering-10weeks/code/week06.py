"""Tuần 6: Secure patch diff — ví dụ phòng thủ, chạy offline."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Finding:
    rule: str
    severity: str
    evidence: str

def analyze(records: list[str]) -> list[Finding]:
    """Phát hiện marker rủi ro trong dữ liệu lab, không kết nối mục tiêu thật."""
    markers = {"failed": "medium", "denied": "low", "tamper": "high"}
    findings: list[Finding] = []
    for record in records:
        normalized = record.casefold()
        for marker, severity in markers.items():
            if marker in normalized:
                findings.append(Finding(marker, severity, record[:120]))
    return findings

if __name__ == "__main__":
    sample = ["login failed for lab-user", "request allowed", "binary tamper detected"]
    result = analyze(sample)
    assert [item.severity for item in result] == ["medium", "high"]
    for item in result:
        print(f"[{item.severity}] {item.rule}: {item.evidence}")
