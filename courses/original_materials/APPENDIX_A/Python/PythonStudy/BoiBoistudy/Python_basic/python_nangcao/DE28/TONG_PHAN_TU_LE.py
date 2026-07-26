#Nhập số phần tử trong dãy
n = int(input('Nhập số phần tử trong dãy:'))
tong = 0
for i in range(n):
    num = int(input('Nhập số thứ {} :'.format(i+1)))
    if num % 2 != 0:
        tong +=num
#In ra kết quả 
print('Tổng các số lẻ là:', tong)