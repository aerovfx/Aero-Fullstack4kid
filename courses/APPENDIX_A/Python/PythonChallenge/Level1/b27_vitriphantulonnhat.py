#Bài 27. Viết chương trình Python tìm phần tử lớn nhất của danh sách và vị trí phần tử lớn nhất cuối cùng.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
max=a[0]
vt=0
for i in range(1,n-1):
    if a[i]>max:
        max=a[i]
        vt=i
print('Số lớn nhất là',max,'tại vị trí',vt+1)
