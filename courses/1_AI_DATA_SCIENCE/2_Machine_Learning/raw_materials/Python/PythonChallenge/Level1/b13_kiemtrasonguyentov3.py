def nguyento(n):
    for i in range(2, n):
        if n % i == 0:
            print("Khong phai so nguyen toc",n)
            break
    else:
        print("so nguyen to la ",n)

input_file = "b13_NGUYENTO.INP"
output_file = "b13_NGUYENTO.OUT"


# Đọc dãy số từ file b13_NGUYENTO.INP và  kiem tra nguyen to
with open(input_file, "r") as file:
    numbers = file.read().strip().split()

result_string =""
for num in numbers:
    num = int(num)
    nguyento_num = nguyento(num)
    result_string +=  str(nguyento_num) + "\n"


# Ghi kết quả vào file b13_NGUYENTO.OUT
with open( output_file,"w") as file:
    file.write(result_string)


