# Matplotlib

Matplotlib là một thư viện toàn diện để tạo ra các hình ảnh tĩnh, động và tương tác trong Python. Nó được sử dụng rộng rãi để vẽ đồ thị và biểu đồ, làm cho nó trở thành một công cụ thiết yếu cho phân tích dữ liệu và nghiên cứu khoa học. Matplotlib cung cấp một API hướng đối tượng để nhúng các biểu đồ vào các ứng dụng sử dụng các bộ công cụ GUI đa năng như Tkinter, wxPython, Qt hoặc GTK.

## Các Tính Năng Chính
- **Vẽ Đồ Thị Đa Dạng**: Hỗ trợ nhiều loại đồ thị bao gồm đường, cột, phân tán, histogram và đồ thị 3D.
- **Tùy Biến**: Nhiều tùy chọn để tùy biến đồ thị, bao gồm màu sắc, nhãn và kiểu dáng.
- **Tích Hợp**: Hoạt động mượt mà với NumPy, Pandas và các thư viện khoa học khác.
- **Đồ Thị Tương Tác**: Có khả năng tạo ra các đồ thị tương tác có thể được nhúng vào các ứng dụng web.

## Cài Đặt
Bạn có thể cài đặt Matplotlib bằng pip:
```bash
pip install matplotlib
```

## Ví Dụ
Dưới đây là một ví dụ đơn giản về cách tạo một đồ thị đường sử dụng Matplotlib:
```python
import matplotlib.pyplot as plt

x = [1, 2, 3, 4]
y = [10, 20, 25, 30]

plt.plot(x, y)
plt.xlabel('Trục X')
plt.ylabel('Trục Y')
plt.title('Đồ Thị Đường Đơn Giản')
plt.show()
```

Để biết thêm thông tin, hãy truy cập [tài liệu chính thức của Matplotlib](https://matplotlib.org/stable/contents.html).