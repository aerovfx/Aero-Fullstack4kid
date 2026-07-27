import re
import json

def extract_iocs_basic(text: str) -> dict:
    """Extracts Indicators of Compromise (IPs, Hashes) using regex."""
    ip_pattern = r'\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b'
    sha256_pattern = r'\b[A-Fa-f0-9]{64}\b'
    
    ips = re.findall(ip_pattern, text)
    hashes = re.findall(sha256_pattern, text)
    
    return {
        "extracted_ips": list(set(ips)),
        "extracted_hashes": list(set(hashes))
    }

if __name__ == "__main__":
    sample_threat_report = """
    CRITICAL THREAT REPORT:
    Malware variant detected communicating with C2 server at 192.168.1.100 and external host 45.33.32.156.
    File SHA256 hash: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855.
    Do not visit malicious domain unknown-malware-site.test.
    """
    
    print("=== OSINT IOC EXTRACTION DEMO ===")
    iocs = extract_iocs_basic(sample_threat_report)
    print(json.dumps(iocs, indent=4))
