def tim_so_armstrong():
    for num in range(100, 1000):
        arm_num = 0
        temp = num

        while temp > 0:
            digit = temp % 10  # Lấy chữ số cuối cùng của số num
            arm_num += digit ** 3  # Tính lập phương của chữ số và cộng vào tổng lập phương
            temp //= 10  # Loại bỏ chữ số cuối cùng của số num

            if arm_num > num:
                break  # Dừng việc tính toán nếu tổng lập phương vượt quá số num

        if num == arm_num:
            print(num)  # In ra số num là số Armstrong


# Ví dụ sử dụng
tim_so_armstrong()
