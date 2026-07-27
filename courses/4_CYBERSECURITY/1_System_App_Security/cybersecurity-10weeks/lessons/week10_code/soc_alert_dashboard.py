import csv
import os

ALERTS_DATA = [
    {"timestamp": "2026-07-27 10:15:00", "source_ip": "127.0.0.1", "event_type": "PORT_SCAN_SYN", "severity": "HIGH"},
    {"timestamp": "2026-07-27 10:20:00", "source_ip": "127.0.0.1", "event_type": "SQL_INJECTION", "severity": "CRITICAL"},
    {"timestamp": "2026-07-27 10:25:00", "source_ip": "127.0.0.1", "event_type": "FAILED_LOGIN_LOCKOUT", "severity": "MEDIUM"},
]

def export_soc_dashboard_csv(output_file="soc_alerts_report.csv"):
    print("=== SOC ALERT DASHBOARD REPORT GENERATOR ===")
    
    with open(output_file, mode='w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=["timestamp", "source_ip", "event_type", "severity"])
        writer.writeheader()
        writer.writerows(ALERTS_DATA)
        
    print(f"[+] Successfully exported {len(ALERTS_DATA)} security alerts to: {output_file}")

if __name__ == "__main__":
    export_soc_dashboard_csv()
