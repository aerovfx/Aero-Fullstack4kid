#Bài 23. Viết chương trình Python đếm số lượng các số hạng dương và tổng của các số hạng dương.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
dem=0
tongd=0
for i in range(0,n):
    if a[i]>0:
       dem+=1
       tongd+=a[i]
print('Số hạng dương:',dem)
print('Tổng số dương:',tongd)
