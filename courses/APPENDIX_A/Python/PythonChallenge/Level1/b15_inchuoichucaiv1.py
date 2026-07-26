#Bài 15. Viết một chương trình nhận chuỗi từ do người dùng nhập vào, 
# phân tách nhau bởi dấu phẩy và in những từ đó thành chuỗi theo thứ tự bảng chữ cái, 
# phân tách nhau bằng dấu phẩy.

#Giả sử đầu vào được nhập là: without,hello,bag,world thì đầu ra sẽ là bag,hello,without,world.
items=["a", "re", "tr"]
items.sort()
print (','.join(items))
