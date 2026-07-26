def reverse(word):
   x = ''
   for i in range(len(word)):
      x += word[len(word)-1-i]
   return x
word = input('Nhap vao 1 chuoi:\n')
x = reverse(word)
if x == word:
   print('Day la chuoi Palindrome')
else:
   print('Day khong phai la chuoi Palindrome')