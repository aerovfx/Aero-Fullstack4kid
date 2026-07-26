#Hàm tìm ước:
def uoc(n):
    a = 2
    for i in range(2,n):
        if n % i == 0:
            a +=1
    return a
#Hàm uoc(n) được sử dụng để đếm số ước số của một số nguyên dương n.Biến d được khởi tạo ban đầu là 2 vì mỗi số nguyên dương đều có ít nhất hai ước số là 1 và chính nó. Hàm này duyệt qua các số từ 2 đến n-1 và kiểm tra nếu n chia hết cho số đó thì tăng biến d lên 1. Cuối cùng, hàm trả về giá trị của biến d, tức là số ước số của n.
#Hàm tìm số phản ngto:
def phan(n):
    max_val = uoc(1)
    num = 1
    for i in range(2, n + 1):
        if max_val < uoc(i):
            max_val = uoc(i)
            num = i
    return num
#Hàm sopnt(n) được sử dụng để tìm số phản nguyên tố trong đoạn từ 1 đến n.Ban đầu, biến max_val và num được gán giá trị của số ước số và số tương ứng của 1 (vì 1 có 2 ước số là 1 và chính nó).Hàm duyệt qua các số từ 2 đến n và so sánh số ước số của số đó với max_val.Nếu số ước số lớn hơn max_val, thì cập nhật max_val và num bằng giá trị mới. Cuối cùng, hàm trả về num,tức là số
#Đọc dữ liệu vào file INP:
with open('So_phan_ngto.INP','r') as f:
    lines = f.readlines()
    k_values = [int(line.strip()) for line in lines[1:] ]
#Gọi hàm số phản ngto:
results = [phan(k) for k in k_values]
#In kết quả ra file OUT:
with open('So_phan_ngto.OUT','w') as f:
    for num in results:
        f.write(str(num) + '\n')