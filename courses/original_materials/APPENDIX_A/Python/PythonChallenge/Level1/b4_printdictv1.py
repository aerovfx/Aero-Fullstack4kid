#Bài 4. Với số nguyên n nhất định, hãy viết chương trình để tạo ra một dictionary chứa (i, i*i) 
#như là số nguyên từ 1 đến n (bao gồm cả 1 và n) sau đó in ra dictionary này. 
#Ví dụ: Giả sử số n là 8 thì đầu ra sẽ là: {1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64}.
n = int(input('Nhập một số nguyên: '))  # Nhập và gán một số nguyên vào biến n
d = {}  # Khởi tạo một từ điển rỗng

for i in range(1, n+1):  # Vòng lặp từ 1 đến n+1
    d[i] = i*i  # Gán giá trị i*i cho phần tử có khóa là i trong từ điển

print(d)  # In ra từ điển d chứa các cặp (i, i*i) tương ứng từ 1 đến n
