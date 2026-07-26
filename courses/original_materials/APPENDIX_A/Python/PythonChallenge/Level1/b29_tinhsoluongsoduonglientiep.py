#Bài 29. Viết chương trình Python tính số lượng các số dương liên tiếp nhiều nhất.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
d=len(a)
i=0
maxd=0
while i<d:
    while a[i]<=0:
        i+=1
        if i==d:break
    if i<d:
        max1=0
        j=i
        while a[j]>0:
            max1+=1
            j+=1
            if j==d: break
        if max1>maxd: 
            maxd=max1
        i=j
    i+=1
print('So duong lien tiep dai nhat =',maxd)