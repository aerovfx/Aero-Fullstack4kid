def to_camel_case(string):
    words = string.split()  # Tách các từ trong xâu thành danh sách các từ
    camel_case_words = [word.capitalize() for word in words]  # Chuyển đổi chữ cái đầu của mỗi từ thành chữ hoa
    camel_case_string = ''.join(camel_case_words)  # Kết hợp các từ lại thành một xâu mới
    return camel_case_string

# Nhập xâu từ người dùng
input_string = input("Nhập xâu gồm 2 từ cách nhau bởi dấu khoảng cách: ")

# Chuyển đổi xâu thành dạng Camel Case
camel_case = to_camel_case(input_string)

# In kết quả
print("Kết quả: ", camel_case)
