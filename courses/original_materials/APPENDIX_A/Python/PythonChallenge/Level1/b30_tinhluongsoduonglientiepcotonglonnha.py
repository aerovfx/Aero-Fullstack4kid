#Bài 30. Viết chương trình Python tính số lượng các số dương liên tiếp có tổng lớn nhất.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
d=len(a)
i=0
sumd=0
while i<d:
    while a[i]<=0:
        i+=1
        if i==d:break
    if i<d:
        sum1=0
        j=i
        while a[j]>0:
            sum1+=a[j]
            j+=1
            if j==d: break
        if sum1>sumd: 
            sumd=sum1
        i=j
    i+=1
print('Tong so duong lien tiep dai nhat =',sumd)
