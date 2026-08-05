# 10_check_ftp_anonymous.py

from ftplib import FTP

HOST = "localhost"

try:
    ftp = FTP(HOST)

    ftp.login("anonymous", "anonymous@test.com")

    print("[+] FTP cho phép Anonymous Login!")

    ftp.quit()

except Exception:
    print("[-] FTP không cho phép Anonymous.")
    
 