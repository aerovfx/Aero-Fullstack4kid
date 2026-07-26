#Hàm
def xoa_khoang_trang(s):
    a = ' '.join(s.split())
    return a
text = " Chào bạn.     Bạn khoẻ   không?"
results = xoa_khoang_trang(text) 
print('Dòng chữ sau khi xóa khoảng cách là:', results)
    