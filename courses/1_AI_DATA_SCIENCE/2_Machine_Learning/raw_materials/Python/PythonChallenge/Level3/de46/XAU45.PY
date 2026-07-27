def contains_all_chars(str1, str2):
    # Kiểm tra xem xâu str1 có chứa toàn bộ các ký tự trong xâu str2 hay không

    # Tạo tập hợp chứa các ký tự trong xâu str2
    set_str2 = set(str2)

    # Duyệt qua từng ký tự trong xâu str1
    for char in str1:
        # Nếu ký tự không có trong tập hợp set_str2, trả về False
        if char not in set_str2:
            return False

    # Nếu tất cả các ký tự trong xâu str1 đều có trong tập hợp set_str2, trả về True
    return True


# Nhập xâu thứ nhất từ người dùng
str1 = input("Nhập xâu thứ nhất: ")

# Nhập xâu thứ hai từ người dùng
str2 = input("Nhập xâu thứ hai: ")

# Kiểm tra xem xâu thứ nhất có chứa toàn bộ các ký tự trong xâu thứ hai hay không
result = contains_all_chars(str1, str2)

# In kết quả
if result:
    print("Xâu thứ nhất chứa toàn bộ các ký tự trong xâu thứ hai")
else:
    print("Xâu thứ nhất không chứa toàn bộ các ký tự trong xâu thứ hai")
