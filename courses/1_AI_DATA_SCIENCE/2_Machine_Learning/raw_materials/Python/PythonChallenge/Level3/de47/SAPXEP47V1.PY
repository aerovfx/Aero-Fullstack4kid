# Hàm tính tổng các chữ số của một số
def sum_of_digits(number): #tính tổng các chữ số của số đó.
    sum_digits = 0
    while number > 0:
        sum_digits += number % 10 #Sử dụng vòng lặp while để lấy lần lượt từng chữ số cuối cùng của number và cộng vào biến sum_digits.
        number //= 10 # Sau mỗi lần lặp, ta chia number cho 10 để lược bỏ chữ số cuối cùng đã lấy.
    return sum_digits # trả về tổng các chữ số tính được

# Nhập số nguyên N từ người dùng
N = int(input("Nhập số nguyên N: "))

# Nhập dãy số từ người dùng. Chuỗi nhập vào sẽ được split thành các phần tử trong danh sách numbers.
numbers = input("Nhập dãy số, cách nhau bằng khoảng trắng: ").split()

# Chuyển các phần tử trong dãy từ chuỗi sang số nguyên
numbers = [int(num) for num in numbers]

# Tìm số có tổng các chữ số lớn nhất trong dãy. ử dụng hàm max với đối số key=sum_of_digits để tìm số có tổng các chữ số lớn nhất.
max_sum_digits = max(numbers, key=sum_of_digits)

# In ra số có tổng các chữ số lớn nhất
print("Số có tổng các chữ số lớn nhất:", max_sum_digits)

# In ra dãy số đảo ngược. Trong comprehension, mỗi số trong numbers được chuyển thành một chuỗi rồi đảo ngược các ký tự trong chuỗi đó.
reversed_numbers = [str(num)[::-1] for num in numbers]
print("Dãy số đảo ngược:", ' '.join(reversed_numbers))
