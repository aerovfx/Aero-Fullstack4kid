#Bài 15. Viết một chương trình nhận chuỗi từ do người dùng nhập vào, 
# phân tách nhau bởi dấu phẩy và in những từ đó thành chuỗi theo thứ tự bảng chữ cái, 
# phân tách nhau bằng dấu phẩy.

#Giả sử đầu vào được nhập là: without,hello,bag,world thì đầu ra sẽ là bag,hello,without,world.
input_file = "b15_INCHUOI.INP"
output_file = "b15_INCHUOI.OUT"

with open(input_file, "r") as file:
    items = file.read().strip().split(',')
# Sắp xếp các từ theo thứ tự bảng chữ cái
items.sort()

# In ra chuỗi đã sắp xếp
result_string = ','.join(items)

# Ghi kết quả vào file OUTPUT
with open("b15_INCHUOI.OUT", "w") as file:
    file.write(result_string)
