#Hàm kiểm tra xem chuỗi đó có đối xứng hay không:
def doixung(string):
    dao_nguoc_chuoi = string[::-1] # Chuỗi đảo ngược
    if string == dao_nguoc_chuoi:
        return True
    else:
        return False
#Nhập chuỗi:
input = input('Nhập vào 1 chuỗi:')
#Kiểm tra xem chuỗi đó có đối xứng ko và in ra kết quả:
if doixung(input):
    print('Đây là chuỗi đối xứng')
else:
    print('Đây không là chuỗi đối xứng')
    

