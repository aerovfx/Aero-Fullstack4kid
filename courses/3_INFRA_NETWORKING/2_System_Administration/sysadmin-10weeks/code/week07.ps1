#  Tuần 7: Kế hoạch Active Directory
param([string]$Domain = "corp.example.test")
$ErrorActionPreference = "Stop"
if ($Domain -notmatch '^[a-zA-Z0-9.-]+$') { throw "Domain không hợp lệ" }
Write-Host "[PLAN] Tạo forest lab: $Domain"
Write-Host "[PLAN] Tạo OU Users, Servers, Workstations"
Write-Host "[PLAN] GPO khóa màn hình và cập nhật bảo mật"
Write-Host "Script chỉ lập kế hoạch; không thay đổi Active Directory."
