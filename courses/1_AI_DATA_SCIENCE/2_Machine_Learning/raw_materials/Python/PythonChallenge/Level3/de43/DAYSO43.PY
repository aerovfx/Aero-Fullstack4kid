def kiem_tra_day_doi_xung(n, day_so):
    for i in range(n // 2):
        if day_so[i] != day_so[n - 1 - i]:
            return 0
    return 1

# Đọc dữ liệu từ file input
with open("DAYSO43.INP", "r") as file_in:
    n = int(file_in.readline())
    day_so = list(map(int, file_in.readline().split()))

# Kiểm tra dãy số
ket_qua = kiem_tra_day_doi_xung(n, day_so)

# Ghi kết quả vào file output
with open("DAYSO43.OUT", "w") as file_out:
    file_out.write(str(ket_qua))
