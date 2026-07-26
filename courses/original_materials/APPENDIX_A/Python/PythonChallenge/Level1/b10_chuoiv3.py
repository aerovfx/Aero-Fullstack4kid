def reverse(word):
   x = ''
   for i in range(len(word)):
      x += word[len(word)-1-i]
   return x

# Đọc dữ liệu từ file INPUT
with open("b10_CHUOI.INP", "r") as file:
    word = file.read().strip().split(",")

word = ''.join(word)  # Chuyển đổi danh sách các từ thành một chuỗi duy nhất

# Xuất kết quả vào file OUTPUT
with open("b10_CHUOI.OUT", "w") as file:  # Mở file "b10_CHUOI.OUT" trong chế độ ghi
    x = reverse(word)
    if x == word:
        file.write(f"{'Day la chuoi Palindrome'}\n") 
    else:        
        file.write(f"{'Day khong phai la chuoi Palindrome'}\n") 
