import re
import sys

def audit_code_file(filename: str):
    print(f"=== SECURE CODE AUDITING: {filename} ===")
    
    with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
        
    vulnerabilities = []
    
    for idx, line in enumerate(lines, 1):
        # Rule 1: Check Hardcoded Secrets / API Keys
        if re.search(r'(api_key|password|secret)\s*=\s*["\'][A-Za-z0-9_\-]{8,}["\']', line, re.IGNORECASE):
            vulnerabilities.append((idx, "HIGH", "Hardcoded Secret / API Key detected! Use environment variables instead."))
            
        # Rule 2: Unsafe SQL Query Construction (String Concatenation)
        if re.search(r'SELECT\s+.*\s+FROM\s+.*\s+\+\s*|f["\']SELECT\s+', line, re.IGNORECASE):
            vulnerabilities.append((idx, "CRITICAL", "Potential SQL Injection via string concatenation! Use parameterized queries."))
            
        # Rule 3: Use of Unsafe Functions in C/C++ or Python
        if re.search(r'\b(strcpy|gets|eval|exec)\b', line):
            vulnerabilities.append((idx, "HIGH", "Use of unsafe function (strcpy/gets/eval/exec). Replace with secure alternatives."))
            
    if vulnerabilities:
        for line_no, severity, msg in vulnerabilities:
            print(f"[Line {line_no:3d}] [{severity}] {msg}")
    else:
        print("[✅ SECURE] No obvious basic vulnerabilities detected.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        audit_code_file(sys.argv[1])
    else:
        print("Usage: python3 ai_code_auditor.py <source_file>")
