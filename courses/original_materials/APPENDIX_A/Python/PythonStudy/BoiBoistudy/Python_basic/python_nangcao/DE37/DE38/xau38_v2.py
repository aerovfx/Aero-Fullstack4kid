
xoa_khoang_trang = lambda s: ' '.join(s.split())

text = " Chào bạn.     Bạn khoẻ   không?"
results = xoa_khoang_trang(text) 
print('Dòng chữ sau khi xóa khoảng cách là:', results)
