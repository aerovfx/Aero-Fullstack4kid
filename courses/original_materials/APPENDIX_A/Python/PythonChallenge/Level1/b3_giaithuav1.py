#Bài 3. Viết một chương trình có thể tính giai thừa của một số cho trước. 
#Kết quả được in thành chuỗi trên một dòng, phân tách bởi dấu phẩy. 
#Ví dụ, số cho trước là 8 thì kết quả đầu ra phải là 40320.
n = int(input("Nhập số cần tính giai thừa:")) 
def fact(n):
    if n==0:
        return 1
    else:
        return n*fact(n-1)
print(fact(n))
