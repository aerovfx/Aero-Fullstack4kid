def kiem_tra_ngay_thang(N):
    ngay = N // 100000
    thang = (N // 1000) % 100
    nam = N % 100

    if 1000 <= N <= 999999:
        if 2001 <= nam + 2000 <= 3000:
            if 1 <= thang <= 12:
                if 1 <= ngay <= 31:
                    return f"{ngay}-{thang}-{nam + 2000}"
    return "KHONG"

# Nhập số N từ bàn phím
N = int(input("Nhập số N: "))

# Kiểm tra và hiển thị kết quả
ket_qua = kiem_tra_ngay_thang(N)
print(ket_qua)
