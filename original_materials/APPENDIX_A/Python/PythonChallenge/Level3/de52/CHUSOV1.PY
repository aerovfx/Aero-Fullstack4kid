file = open("CHUSO.INP", "r")
output_file = open("CHUSO.OUT", "w")

for test in range(10):
    data = file.readline()
    data = data.split()
    m = int(data[0])
    n = int(data[1])
    k = int(data[2])
    print(m,n,k)
    kq = m
    for j in range(n - 1):
        kq *= m
        tempo = str(kq)
        if len(tempo) > k:
            kq = int(tempo[-k:])  # Chú ý: Sử dụng [-k:] để trích xuất K chữ số cuối cùng
    
    output_file.write(str(kq) + "\n")

file.close()
output_file.close()
"""
Chúng ta đã mở tập tin CHUSO.INP để đọc dữ liệu và tập tin CHUSO.OUT để ghi kết quả.
Trong vòng lặp for, chúng ta đọc mỗi dòng dữ liệu từ tập tin và chuyển đổi các giá trị M, N và K thành các biến tương ứng.
Vòng lặp for j in range(n - 1): được sử dụng để tính giá trị kq theo công thức kq = m ^ n (nếu chúng ta chỉ cần tính m ^ n chứ không cần biết cụ thể giá trị).
Sau khi tính toán kq, chúng ta chuyển đổi kq thành chuỗi tempo để kiểm tra độ dài của nó.
Nếu độ dài của tempo lớn hơn K, chúng ta sẽ trích xuất K chữ số cuối cùng bằng cách sử dụng tempo[-k:].
Cuối cùng, chúng ta ghi kết quả kq vào tập tin CHUSO.OUT.
Lưu ý rằng cách này chỉ giải quyết được trong trường hợp các số không quá lớn, và việc tính toán bằng cách lũy thừa có thể gây ra sự mất mát chính xác nếu các số trở nên quá lớn.
"""