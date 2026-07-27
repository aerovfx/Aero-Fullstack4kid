# aerovfx.com 
def kiem_tra_so_nguyen_to(num):
    if num < 2:
        return False
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            return False
    return True

def phan_tich_so_nguyen_to(N):
    # Danh sách lưu trữ các phương án phân tích
    phuong_an_phan_tich = []

    # Liệt kê các phương án phân tích
    for i in range(2, N // 2 + 1):
        if kiem_tra_so_nguyen_to(i) and kiem_tra_so_nguyen_to(N - i):
            phuong_an = (i, N - i)
            # Nếu cặp phương án đã tồn tại, chỉ coi là một
            if phuong_an not in phuong_an_phan_tich:
                phuong_an_phan_tich.append(phuong_an)

    return phuong_an_phan_tich

def main():
    N = int(input("Nhập số N (N <= 5000): "))
    if N <= 0 or N > 5000:
        print("Số N không hợp lệ.")
        return

    phuong_an_phan_tich = phan_tich_so_nguyen_to(N)

    if len(phuong_an_phan_tich) > 0:
        print(f"Có {len(phuong_an_phan_tich)} phương án phân tích:")
        for phuong_an in phuong_an_phan_tich:
            print(f"{phuong_an[0]} + {phuong_an[1]} = {N}")
    else:
        print("Không có phương án phân tích.")

if __name__ == "__main__":
    main()
