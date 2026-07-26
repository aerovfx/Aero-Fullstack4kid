def remove_elements(numbers, condition):
    # Loại bỏ các phần tử trong danh sách `numbers` thỏa mãn điều kiện `condition`

    # Tạo một danh sách rỗng để lưu trữ các phần tử không thỏa mãn điều kiện
    result = []

    # Duyệt qua từng phần tử trong danh sách `numbers`
    for num in numbers:
        # Kiểm tra điều kiện cho từng phần tử với eval(str(num) + condition) 
        if not eval(str(num) + condition): 
            # Nếu phần tử không thỏa mãn điều kiện, thêm vào danh sách kết quả
            result.append(num)

    # Trả về danh sách kết quả sau khi đã loại bỏ các phần tử thỏa mãn điều kiện
    return result


# Nhập danh sách từ người dùng
numbers = input("Nhập danh sách các số, cách nhau bằng dấu phẩy: ").split(",")

# Chuyển các phần tử trong danh sách từ chuỗi sang số nguyên
numbers = [int(num) for num in numbers]

# Nhập điều kiện từ người dùng
condition = input("Nhập điều kiện (ví dụ: >10, <5): ")

# Loại bỏ các phần tử thỏa mãn điều kiện
result = remove_elements(numbers, condition)

# In danh sách kết quả sau khi đã loại bỏ các phần tử
print("Danh sách sau khi loại bỏ các phần tử:", result)
