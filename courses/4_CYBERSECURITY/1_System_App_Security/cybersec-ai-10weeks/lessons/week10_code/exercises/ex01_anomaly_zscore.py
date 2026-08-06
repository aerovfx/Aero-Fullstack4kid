"""
BÀI TẬP 1 (Tuần 10): PHÁT HIỆN BẤT THƯỜNG BẰNG Z-SCORE (nền tảng của AI SOC)
Ôn lại: giám sát bảo mật tự động, phát hiện bất thường (anomaly detection).

BỐI CẢNH:
Bài giảng dùng Isolation Forest (scikit-learn). Trước khi hiểu mô hình phức tạp,
hãy nắm ý tưởng gốc bằng THỐNG KÊ thuần: một điểm dữ liệu càng lệch xa mức trung
bình (tính bằng z-score) thì càng bất thường. Bài này chỉ dùng thư viện chuẩn.

DỮ LIỆU: số lần đăng nhập thất bại mỗi giờ của một tài khoản (biến DATA).
Giờ nào có z-score vượt ngưỡng => nghi vấn tấn công dò mật khẩu (brute-force).

z-score = (giá_trị - trung_bình) / độ_lệch_chuẩn

NHIỆM VỤ:
1. Tính mean và standard deviation của DATA (dùng module statistics).
2. Với mỗi điểm, tính z-score.
3. Điểm nào |z| >= THRESHOLD (vd 2.5) thì gắn cờ bất thường.

CHẠY:  python3 ex01_anomaly_zscore.py
"""

import statistics

# Số lần đăng nhập thất bại theo từng giờ (0h -> 11h)
DATA = [2, 1, 3, 2, 0, 1, 2, 3, 47, 2, 1, 3]   # giờ thứ 8 tăng vọt = nghi vấn

THRESHOLD = 2.5


def find_anomalies(data, threshold):
    """Trả về list (index, value, zscore) của các điểm bất thường."""
    mean = statistics.mean(data)
    stdev = statistics.pstdev(data)   # độ lệch chuẩn quần thể
    anomalies = []
    # TODO 1: nếu stdev == 0 thì trả về [] (mọi điểm như nhau, không có bất thường).
    # TODO 2: duyệt enumerate(data), tính z = (value - mean) / stdev.
    # TODO 3: nếu abs(z) >= threshold thì thêm (index, value, z) vào anomalies.
    return anomalies


if __name__ == "__main__":
    print("=== PHÁT HIỆN BẤT THƯỜNG BẰNG Z-SCORE ===\n")
    print(f"Dữ liệu (login thất bại/giờ): {DATA}")
    print(f"Trung bình: {statistics.mean(DATA):.2f} | Độ lệch chuẩn: {statistics.pstdev(DATA):.2f}\n")

    anomalies = find_anomalies(DATA, THRESHOLD)

    # TODO 4: nếu rỗng -> "Không có bất thường."
    #         ngược lại -> in "Giờ thứ X: Y lần thất bại (z=Z.ZZ) -> NGHI VẤN BRUTE-FORCE".
    # TODO 5: in khuyến nghị: khoá tài khoản tạm thời, bật CAPTCHA/2FA, cảnh báo SOC.
