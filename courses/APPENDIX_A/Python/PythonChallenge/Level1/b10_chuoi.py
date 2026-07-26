#Bài 10. Viết chương trình yêu cầu người dùng nhập vào một chuỗi và 
#in ra màn hình thông báo chuỗi đó có phải là chuỗi palindrome hay không. 
#(Chuỗi Palindrome là một chuỗi mà đọc xuôi và ngược đều như nhau, ví dụ ABCDCBA.)

#C1:
wrd=input("Please enter a word")
wrd=str(wrd)
rvs=wrd[::-1]
print(rvs)
if wrd == rvs:
    print("This word is a palindrome")
else:
    print("This word is not a palindrome")


#C2:
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