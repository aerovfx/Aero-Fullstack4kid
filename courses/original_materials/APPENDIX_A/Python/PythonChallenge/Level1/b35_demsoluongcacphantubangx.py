#Bài 35. Viết chương trình Python đếm số lượng các phần tử bằng giá trị x nhập từ bàn phím.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
x=float(input('Nhập 1 số từ bàn phím: '))
dem=0
for i in range(0,n):
    if a[i]==x:
        dem=dem+1
print('Số lượng phần tử bằng',x,':',dem)

