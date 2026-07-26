numbers = input('Nhap so phan tu cua day:')
numbers = numbers.split(',')
odd_numbers = []
tong=[]
for num in numbers:
    num = int(num)
    if num % 2 ==1 : tong += num 
print('Tong cac so le trong day la:', tong)