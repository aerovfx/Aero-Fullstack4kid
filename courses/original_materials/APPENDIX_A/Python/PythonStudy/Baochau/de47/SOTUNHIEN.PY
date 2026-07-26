# aerovfx.com 
def is_prime(N): # hàm kiểm tra một sô có phải là số nguyên tố hay không
    if N < 2: # nếu là 0 và 1 thì trả về false
        return False
    for i in range(2, int(N ** 0.5) + 1):
        if N % i == 0: # Nếu một số chia hết cho i thì trả về false.
            return False
    return True # ngược lại là số nguyên tố True


def tong_songto(N):
    # Danh sách lưu trữ các phương án phân tích
    tong_ngto = []

    # Liệt kê các phương án phân tích
    for i in range(2, N // 2 + 1):
        if is_prime(i) and is_prime(N - i):
            phuong_an = (i, N - i)
            # Nếu cặp phương án đã tồn tại, chỉ coi là một
            if phuong_an not in tong_ngto: # Nếu phương án chưa tồn tại thì ghi vào phương án phân tích.
                tong_ngto.append(phuong_an)

    return tong_ngto


N = int(input("Nhập số N (N <= 5000): "))


tong_ngto = tong_songto(N)
print(tong_ngto)
