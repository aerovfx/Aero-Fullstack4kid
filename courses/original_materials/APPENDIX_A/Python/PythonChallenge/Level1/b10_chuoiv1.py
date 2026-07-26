def reverse(word):
   x = ''
   for i in range(len(word)):
      x += word[len(word)-1-i]
   return x

word = "4234233242323432"
x = reverse(word)
if x == word:
   print('Day la chuoi Palindrome')
else:
   print('Day khong phai la chuoi Palindrome')

