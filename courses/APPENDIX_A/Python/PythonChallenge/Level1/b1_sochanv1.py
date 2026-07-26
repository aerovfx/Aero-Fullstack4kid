#Bài 1. In toàn bộ các số chẵn từ 1000 đến 2000
even_numbers=[]
for i in range(1000, 2001):
    if (i%2==0):
        even_numbers.append(str(i))
print (','.join(even_numbers))