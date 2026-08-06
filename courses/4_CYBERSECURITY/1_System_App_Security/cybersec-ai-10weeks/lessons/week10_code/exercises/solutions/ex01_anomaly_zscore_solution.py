"""ĐÁP ÁN - Bài tập 1 (Tuần 10): Phát hiện bất thường bằng z-score."""

import statistics

DATA = [2, 1, 3, 2, 0, 1, 2, 3, 47, 2, 1, 3]
THRESHOLD = 2.5


def find_anomalies(data, threshold):
    mean = statistics.mean(data)
    stdev = statistics.pstdev(data)
    if stdev == 0:
        return []
    anomalies = []
    for index, value in enumerate(data):
        z = (value - mean) / stdev
        if abs(z) >= threshold:
            anomalies.append((index, value, z))
    return anomalies


if __name__ == "__main__":
    print("=== PHÁT HIỆN BẤT THƯỜNG BẰNG Z-SCORE ===\n")
    print(f"Dữ liệu (login thất bại/giờ): {DATA}")
    print(f"Trung bình: {statistics.mean(DATA):.2f} | Độ lệch chuẩn: {statistics.pstdev(DATA):.2f}\n")

    anomalies = find_anomalies(DATA, THRESHOLD)

    if not anomalies:
        print("Không có bất thường.")
    else:
        for index, value, z in anomalies:
            print(f"[!] Giờ thứ {index}: {value} lần thất bại (z={z:.2f}) -> NGHI VẤN BRUTE-FORCE")
        print("\nKHUYẾN NGHỊ:")
        print("- Tạm khoá tài khoản / IP nguồn.")
        print("- Bật CAPTCHA và xác thực 2 lớp (2FA).")
        print("- Đẩy cảnh báo lên SOC để điều tra thêm.")
