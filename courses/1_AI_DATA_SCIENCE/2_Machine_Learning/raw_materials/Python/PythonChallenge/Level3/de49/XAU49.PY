def tach_tu_hoa_thuong(xau):
    tu_hoa = []
    tu_thuong = []
    for tu in xau.split():
        if tu.isupper():
            tu_hoa.append(tu)
        else:
            tu_thuong.append(tu)
    return tu_hoa, tu_thuong

# Xâu đầu vào
xau = "Hello World OpenAI"

# Tách các từ hoa và thường thành danh sách hoặc mảng
danh_sach_tu_hoa, danh_sach_tu_thuong = tach_tu_hoa_thuong(xau)
mang_tu_hoa, mang_tu_thuong = tach_tu_hoa_thuong(xau.split())

# In kết quả
print("Danh sách các từ hoa:", danh_sach_tu_hoa)
print("Danh sách các từ thường:", danh_sach_tu_thuong)
print("Mảng các từ hoa:", mang_tu_hoa)
print("Mảng các từ thường:", mang_tu_thuong)
