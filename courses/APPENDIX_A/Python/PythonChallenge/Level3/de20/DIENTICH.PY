import math 

# Hàm tính diện tích hình vuông
def calculate_square_area():
    side = float(input("Nhập vào độ dài cạnh hình vuông: "))
    area = side**2
    print("Diẹn tích hình vuông là: ", area)

# Hàm tính diện tích hình tròn
def calculate_circle_area():
    radius = float(input("Nhập vào bán kính hình tròn: "))
    area = math.pi*radius**2
    print("Diện tích hình tròn là: ", area)

# Hàm tính diện tích hình tam giác
def calculate_triangle_area():
    base = float(input("Nhập độ dài cạnh dáy của tam giác: "))
    height = float(input("Nhập chiều cao của tam giác: "))
    area = 0.5 * base * height
    print("Diện tích hình tam giác là: ", area)

# Hàm tính diện tích hình chữ nhật
def calculate_rectangle_area():
    lenght = float(input("Nhập chiều dài của hình chữ nhật: "))
    width = float(input("Nhập chiều rộng hình chữ nhật: "))
    area = lenght * width 
    print("Diện tích hình chữ nhật là: ", area)

# Chương trình chính
def main():
    while True:
        print("\n Bảng chọn lệnh: ")
        print("1. Không làm gì hết và trở về màn hình soạn thảo.")
        print("2. Tính diện tích hình vuông.")
        print("3. Tính diện tích hình tròn.")
        print("4. Tính diện tích hình tam giác.")
        print("5. Tính diện tích hình chữ nhật.")

        choice = input("Chọn một lệnh từ (1-5)")

        if choice =="1":
            break
        elif choice =="2":
            calculate_square_area()
        elif choice =="3":
            calculate_circle_area()
        elif choice =="4":
            calculate_triangle_area()
        elif choice =="5":
            calculate_rectangle_area()
        else:
            print("Lệnh không hợp lệ.Vui lòng chọn lại.")
main() 
