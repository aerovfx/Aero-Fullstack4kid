#Bài 5. Viết chương trình chấp nhận một chuỗi số, phân tách bằng dấu phẩy từ giao diện điều khiển, 
#tạo ra một List  và một tuple chứa mọi số.

#Ví dụ: Đầu vào được cung cấp là 34,67,55,33,12,98 thì đầu ra là:


#['34', '67', '55', '33', '12', '98']
#('34', '67', '55', '33', '12', '98')
#Chương trình này chỉ đơn giản là sử dụng hàm split() và chuyển một List sang một tuple.
values=input("Nhập vào các giá trị:") 
l=values.split(",") 
t=tuple(l) 

print (t)

