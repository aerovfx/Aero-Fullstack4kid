def tinh_nghich_the(P):
    n = len(P)
    T = [0] * n

    for i in range(1, n + 1):
        count = 0
        for j in range(i + 1, n + 1):
            if P.index(i) > P.index(j):
                count += 1
        T[i - 1] = count

    return T

if __name__ == "__main__":
    try:
        n = int(input("Nhập số n: "))
        P = list(map(int, input("Nhập hoán vị P với các phần tử các nhau với dấu cách: ").split()))

        if len(P) != n:
            print("Số lượng phần tử của hoán vị không đúng với n.")
        else:
            T = tinh_nghich_the(P)
            print("Kết quả nghịch thế của hoán vị P:")
            print(T)

    except ValueError:
        print("Đầu vào không hợp lệ. Vui lòng nhập số nguyên và dãy số nguyên cách nhau bởi dấu cách.")
