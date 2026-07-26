#Bài 31. Viết chương trình Python tính số lượng các phần tử liên tiếp 
#đan dấu nhiều nhất (dãy phần tử liên tiếp được gọi là đan dấu nếu tích hai phần tử liên tiếp âm).
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
d=len(a)
i=0
maxdd=0
for i in range(d-1):
    max1=0
    while a[i]*a[i+1]<0:
        max1+=1
        i+=1
        if i==d-1:break
    if max1>maxdd: maxdd=max1
if maxdd>0: maxdd+=1
print('Day so dan dau dai nhat =',maxdd)
