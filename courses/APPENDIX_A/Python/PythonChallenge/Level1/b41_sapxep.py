#Bài 41. Viết chương trình Python sắp xếp danh sách theo thứ tự tăng dần, giảm dần.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
x=float(input('Nhập 1 số từ bàn phím: '))
dem=0
for i in range(0,n):
    if a[i]==x:
        dem=dem+1
print('Số lượng phần tử bằng',x,':',dem)
#--------------------------------------------------------
# Bài 41. Sắp xếp danh sách tăng dần, giảm dần
#Sắp xếp danh sách tăng
for i in range(0,n-1):
   for j in range(i+1,n):
      if a[i]>a[j]:
         t=a[i]
         a[i]=a[j]
         a[j]=t
print('Danh sách đã sắp xếp tăng:')
print(a)
#Sắp xếp danh sách giảm
for i in range(0,n-1):
   for j in range(i+1,n):
      if a[i]<a[j]:
         t=a[i]
         a[i]=a[j]
         a[j]=t
print('Danh sách đã sắp xếp giảm:')
print(a)