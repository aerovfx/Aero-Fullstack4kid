#Bài 11. Viết chương trình hỏi người dùng một số tự nhiên n và in ra tất cả ước số của con số đó.
# Định nghĩa hàm in ước số
def uoc(n):
    uoc_list = []
    for i in range(1, n + 1):
        if n % i == 0:
            uoc_list.append(i)
    return uoc_list

n_list = 5 , 2 , 4, 6

result_string =""
for num in n_list:
    num = int(num)
    uoc_num = uoc(num)
    result_string += str(uoc_num) + "\n"

print(result_string)
