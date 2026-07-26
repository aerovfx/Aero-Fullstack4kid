#Bài 24. Viết chương trình Python tính trung bình cộng của cả danh sách, trung bình cộng các phần tử dương trong danh sách.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
for i in range(0,n):tong+=a[i]
print('Trung bình cộng của danh sách:',tong)
dem=0
tongd=0
for i in range(0,n):
    if a[i]>0:
       dem+=1
       tongd+=a[i]
print('Trung bình cộng các số dương:',tongd/dem)
