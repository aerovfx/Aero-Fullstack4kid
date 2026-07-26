n = 5 # Nhập và gán một số nguyên vào biến n
d = {}  # Khởi tạo một từ điển rỗng

for i in range(1, n+1):  # Vòng lặp từ 1 đến n+1
    d[i] = i*i  # Gán giá trị i*i cho phần tử có khóa là i trong từ điển

print(d)  # In ra từ điển d chứa các cặp (i, i*i) tương ứng từ 1 đến n
