# Đọc dữ liệu từ file INPUT
with open("b8_TRICHCHUOI.INP", "r") as file:
    a_list = file.read().strip().split()


# Xóa ký tự xuống dòng (newline characters) từ các phần tử trong danh sách
a_list = [x.strip() for x in a_list]



def list_ends(a_list):
    return [a_list[0], a_list[len(a_list)-1]]





# Xuất kết quả vào file OUTPUT
with open("b8_TRICHCHUOI.OUT", "w") as file:  # Mở file "b4_DICT.OUT" trong chế độ ghi
    result = list_ends(a_list)   
    file.write(f"{result}\n")  # Ghi dòng kết quả vào file với định dạng "n thì đầu ra result"


    