def nen_day_so(N):
    # Khởi tạo danh sách dãy số từ 1 đến N
    A = list(range(1, N + 1))
    print(A)
    while len(A) > 1:
        B = []
        # Thực hiện phép nén dãy số bằng cách tạo ra một danh sách B lấy kết quả tổng của các phần tử lặp với độ dài của danh sách cho đến khi len(A) = 1
        for i in range(len(A) - 1):
            B.append(A[i] + A[i + 1])
            print(i,B)
        A = B
    
    # Lấy số dư sau khi chia cho 10^9
    result = A[0] % (10**9)
    
    return result

# Đọc giá trị N từ file hoặc nhập từ bàn phím
N = int(input("Nhập giá trị N: "))
# Gọi hàm nén dãy số và in kết quả
print("Kết quả nén dãy số là:", nen_day_so(N))
