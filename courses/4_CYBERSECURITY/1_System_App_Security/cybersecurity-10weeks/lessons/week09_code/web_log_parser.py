import re

# Sample Nginx Access Log lines containing normal and attack traffic
SAMPLE_LOGS = [
    '127.0.0.1 - - [27/Jul/2026:10:00:00 +0000] "GET /index.html HTTP/1.1" 200 1024',
    '127.0.0.1 - - [27/Jul/2026:10:01:00 +0000] "GET /login?user=admin\'%20OR%201=1-- HTTP/1.1" 200 512',
    '127.0.0.1 - - [27/Jul/2026:10:02:00 +0000] "GET /search?q=<script>alert(1)</script> HTTP/1.1" 200 300',
    '127.0.0.1 - - [27/Jul/2026:10:03:00 +0000] "GET /../../etc/passwd HTTP/1.1" 404 150',
]

def parse_security_logs(logs):
    print("=== WEB SERVER LOG THREAT PARSER ===")
    
    sqli_regex = re.compile(r"(?i)(\'|\%27|OR%201=1|UNION|SELECT|DELETE)")
    xss_regex = re.compile(r"(?i)(<script>|javascript:|onload=)")
    traversal_regex = re.compile(r"(\.\.\/|\.\.\\)")
    
    for idx, log in enumerate(logs, 1):
        if sqli_regex.search(log):
            print(f"[Line {idx}] [⚠️ CRITICAL - SQL INJECTION DETECTED]: {log}")
        elif xss_regex.search(log):
            print(f"[Line {idx}] [⚠️ HIGH - XSS ATTACK DETECTED]: {log}")
        elif traversal_regex.search(log):
            print(f"[Line {idx}] [⚠️ MEDIUM - PATH TRAVERSAL DETECTED]: {log}")
        else:
            print(f"[Line {idx}] [✅ BENIGN]: {log[:60]}...")

if __name__ == "__main__":
    parse_security_logs(SAMPLE_LOGS)
