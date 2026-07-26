#Bài 25. Viết chương trình Python tìm vị trí của phần tử âm đầu tiên trong danh sách.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
i=0
while a[i]>=0:
    i+=1
    if i==n:
       break
if i==n:
    print('Không có phần tử âm')
else:
    print('Vị trí phần tử âm đầu tiên:',i+1)
    