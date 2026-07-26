#Bài 28. Viết chương trình Python tìm phần tử lớn thứ nhì của danh sách và các vị trí của các phần tử đạt giá trị lớn nhì.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
B=a.copy()
m=max(B)
i=0
while i<len(B):
    if B[i]==m:
        B.remove(B[i])
        i-=1
    i+=1
if len(B)==0:
    print("Khong co so lon nhi")
else:
    m=max(B)
    print("So lon nhi la",m,"tai vi tri",end=" ")
    for i in range(len(a)):
        if a[i]==m:
            print(i+1,end=", ")