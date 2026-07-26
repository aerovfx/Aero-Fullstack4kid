# Hàm kiểm tra xem chuỗi đối xứng hay không?
def is_palindrome(string):
    reversed_string = string[::-1] # Chuỗi đảo ngược
# [::-1] là cú pháp chỉ định các bước nhảy và hướng
# [::-1] là lấy toàn bộ chuỗi từ đầu đến cuối
# - 1 buóc nhảy là 1 nhưng theo hướng ngược lại
    if string == reversed_string:
        return True
    else:
        return False
    
# Nhập chuỗi từ người dùng
input_string = input("Nhập chuỗi ký tự: ")

# Kiểm tra đối xứng và in kết quả
if is_palindrome(input_string ):
    print("Chuỗi là đối xứng")
else:
    print("Chuỗi không đối xứng")
