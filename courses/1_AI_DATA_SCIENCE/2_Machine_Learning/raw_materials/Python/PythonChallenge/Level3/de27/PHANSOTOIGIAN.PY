# Hàm tìm phân số tối giản
def simple_frac(frac):
    # tách tử số và mẫu số
    tu, mau = frac.split('/')
    tu = int(tu)
    mau = int(mau)

    # Tìm ước chung lớn nhất của tử số và mẫu số
    ucln = find_ucln(tu,mau)

    # Chia tử số và mẫu số cho ucln để cho phân số tối giản
    simple_tu = tu // ucln
    simple_mau = mau // ucln

    # trả về dạng tối giản của phân số
    simple_fraction = str(simple_tu) + '/' + str(simple_mau)
    return simple_fraction

def find_ucln(a,b):
    while b != 0:
        a, b = b, a % b
    return a

# Yêu cầu người dùng nhập phân số

frac_string = input("Nhập vào chuỗi phân số: ")

simple_fraction = simple_frac(frac_string)
print("Dạng tối giản của phân số", simple_fraction)