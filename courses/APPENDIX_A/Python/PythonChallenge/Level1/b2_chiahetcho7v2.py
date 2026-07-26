#Đây là một phiên bản chương trình tương tự, nhưng thay vì tìm các số trong đoạn từ 2000 đến 3200, 
#chương trình này sẽ yêu cầu người dùng nhập một chuỗi số và kiểm tra xem các số trong chuỗi có chia hết cho 7 
#và không phải là bội số của 5 hay không.
numbers = input("Nhập chuỗi số, cách nhau bằng dấu phẩy: ")
numbers = numbers.split(",")  # Tách các số thành một danh sách

results = []
for num in numbers:
    num = int(num)  # Chuyển số từ chuỗi sang kiểu integer
    if num % 7 == 0 and num % 5 != 0:
        results.append(str(num))

result_string = ", ".join(results)
print(result_string)
