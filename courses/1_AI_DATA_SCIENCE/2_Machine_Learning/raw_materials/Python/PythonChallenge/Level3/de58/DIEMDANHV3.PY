# def main():
#     # Đọc dữ liệu từ file đầu vào
#     with open("DIEMDANH.INP", "r") as file_input:
#         N = int(file_input.readline().strip())
#         danh_sach = [file_input.readline().strip() for _ in range(2 * N - 1)]

#     # Sử dụng từ điển để theo dõi trạng thái ghi danh của học sinh
#     diem_danh = {}

#     # Duyệt danh sách tên của N - 1 học sinh đã ghi danh
#     for i in range(N, 2 * N - 1):
#         ten = danh_sach[i]
#         # Nếu tên đã xuất hiện trong từ điển, đánh dấu là đã ghi danh
#         if ten in danh_sach[i]:
#             diem_danh[danh_sach.index(ten)] = 1 # 1 là đã ghi danh
#     print(diem_danh)


#     # Tìm học sinh chưa ghi danh
#     chua_ghi_danh = []
#     for ten, ghi_danh in diem_danh.items():
#         if ghi_danh == 0:
#             chua_ghi_danh.append(ten)

#     # Sắp xếp tên theo thứ tự alphabetic
#     chua_ghi_danh.sort()
#     print(chua_ghi_danh)
#     # Ghi kết quả vào file DIEMDANH.OUT
#     with open("DIEMDANH.OUT", "w") as file_output:
#         for ten in chua_ghi_danh:
#             file_output.write(ten + "\n")

# if __name__ == "__main__":
#     main()

# """
# chi tiết hơn cho câu lệnh chua_ghi_danh = [ten for ten, ghi_danh in diem_danh.items() if ghi_danh == 0]:

# diem_danh.items(): Chúng ta sử dụng .items() để biến đổi từ điển diem_danh thành một danh sách các cặp key-value. Ví dụ, nếu diem_danh là {'AN': 1, 'VIET': 0, 'TUNG': 1}, thì diem_danh.items() sẽ trở thành [('AN', 1), ('VIET', 0), ('TUNG', 1)].
# for ten, ghi_danh in diem_danh.items(): Vòng lặp này duyệt qua từng cặp key-value trong danh sách được tạo ra từ .items(). Trong mỗi lần lặp, ten sẽ là key (tên học sinh) và ghi_danh sẽ là value (trạng thái ghi danh của học sinh).
# if ghi_danh == 0: Trong mỗi lần lặp, chúng ta kiểm tra xem giá trị ghi_danh có bằng 0 không. Nếu có, điều này có nghĩa là học sinh có trạng thái ghi danh bằng 0, tức là học sinh chưa ghi danh.
# [ten for ten, ghi_danh in diem_danh.items() if ghi_danh == 0]: Chúng ta sử dụng danh comprehension để tạo một danh sách mới. Trong danh sách này, mỗi phần tử sẽ là tên của một học sinh (được biểu diễn bởi ten) nếu trạng thái ghi danh của học sinh đó là 0.
# """
