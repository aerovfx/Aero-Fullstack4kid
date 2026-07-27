#Bài 18. Viết chương trình sinh các xâu nhị phân có độ dài n
n = 3
s = n*[0]
def fill_char(s,i):
   for j in range(i,n):
      s[j] = 0
def fine_print(x):
   tmp = ''
   for i in x:
      tmp += str(i)
   return tmp
while True:
   print(fine_print(s))
   i = n - 1
   while (i > -1) and s[i] == 1:
      i = i - 1
   s[i] = 1
   fill_char(s,i+1)
   if i == -1:
      break	

