def nen_dayso():
    n = int(input('nhập vào n:')) # nhập n
    A = list(range(1, n+1)) # tạo ra danh_sach từ 1 đến n
    while len(A) > 1: # lặp nếu A > 1 thì thực hiện 
        b = [] 
        for i in range(0, len(A)-1): # lặp từ 0 đến chiều dài A
            b.append(A[i] + (A[i+1]))
        A = b
        result = A[0] % 10**9
    return result
print(nen_dayso())