def main():
    input_string = input("Nhập danh sách các phần tử, cách nhau bởi dấu phẩy: ")
    elements = [int(x.strip()) for x in input_string.split(",")]

    # Sắp xếp danh sách theo thứ tự tăng dần và giảm dần
    sorted_elements_ascending = sorted(elements)
    sorted_elements_descending = sorted(elements, reverse=True)

    # Tìm phần tử lớn nhất và nhỏ nhất
    max_element = max(elements)
    min_element = min(elements)

    # Tính giá trị trung bình
    average = sum(elements) / len(elements)

    # In kết quả
    print("Danh sách phần tử ban đầu:", elements)
    print("Sắp xếp tăng dần:", sorted_elements_ascending)
    print("Sắp xếp giảm dần:", sorted_elements_descending)
    print("Phần tử lớn nhất:", max_element)
    print("Phần tử nhỏ nhất:", min_element)
    print("Giá trị trung bình:", average)

if __name__ == "__main__":
    main()
