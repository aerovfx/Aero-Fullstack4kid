#Bài 22. Viết chương trình Python tính tổng các phần tử của một danh sách.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
for i in range(0,n): print(a[i],' ',end='')
print()
tong=0
for i in range(0,n):
    tong+=a[i]
print('Tổng =',tong)