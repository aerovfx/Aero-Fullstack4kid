
def nguyento(n):
    for i in range(2, n):
        if n % i == 0:
            print("Khong phai so nguyen toc",n)
            break
    else:
        print("so nguyen to la ",n)




n_list = 1 , 2 ,4 ,8, 5

result_string =""
for num in n_list:
    num = int(num)
    nguyento_num = nguyento(num)
    result_string +=  str(nguyento_num) + "\n"

print(result_string)
