N = int(input('nhập số n: '))
danh_sach = []
#Tạo chương trình chuyên nghiệp:
def find_pairs(N):
    for a in range(1, N):
        b = N-a
        if (a%b == 0) or (b%a == 0) and a+b == N:
            danh_sach.append([a,b])
    return danh_sach
result = find_pairs(N)
print(result)