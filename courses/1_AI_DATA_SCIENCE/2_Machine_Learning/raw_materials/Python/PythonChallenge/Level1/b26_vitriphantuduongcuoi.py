#Bài 26. Viết chương trình Python tìm vị trí của phần tử dương cuối cùng trong danh sách.
n=10
a=[2, -4, 1, 9, -3, 6, 3, -2, 6, 8]
i=n-1
while a[i]<=0:
   i-=1
   if i==-1:
      break
if i==-1:
    print('Không có phần tử dương')
else:
    print('Vị trí phần tử dương cuối cùng:',i+1)
    