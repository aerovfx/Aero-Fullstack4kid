# CÁC KIỂU DỮ LIỆU

# Kiểu dữ liệu số : int, float, complex
#x = 5	
#x = 24.5	
#x = 3j	

# Kiểu dữ liệu chuỗi : str
#x = "Hello World"

# Các loại trình tự : danh sách, tuple
    # Danh sách: danh sách trong Python là nó có thể chứa đồng thời nhiều loại dữ liệu khác nhau
x = ["apple", "banana", "mango"]	
    # Tuple: Tuple là một kiểu dữ liệu khác, là một chuỗi dữ liệu tương tự như một danh sách. Nhưng nó là bất biến. Điều đó có nghĩa là dữ liệu trong một bộ dữ liệu được bảo vệ chống ghi. Dữ liệu trong một tuple được viết bằng dấu ngoặc đơn và dấu phẩy
#x = ("apple", "banana", "mango")	
#x = range(6)	
#x = {"apple", "banana", "mango"}	
#x = frozenset({"apple", "banana", "mango"})

# Loại dữ liệu ánh xạ : dict (từ điển)
# Dạng key:value. Nó rất hữu ích để truy xuất dữ liệu một cách tối ưu 
# giữa một lượng lớn dữ liệu.
#x = {"name" : "Chung", "age" : 56}	


# Các loại nhị phân : byte, bytearray, memoryview
#x = b"Hello"	
#x = bytearray(5)	
#x = memoryview(bytes(5))	

# Kiểu None
#x = None	

# Kiểu Boolean : bool
#x = True	

# CÚ PHÁP CHECK KIỂU DỮ LIỆU
#print(type(x))

# THAO TÁC VỚI DANH SÁCH
x.remove("apple")
x.append("lemon")
x.reverse()
x.insert(1,"Kiwi")
print(x)