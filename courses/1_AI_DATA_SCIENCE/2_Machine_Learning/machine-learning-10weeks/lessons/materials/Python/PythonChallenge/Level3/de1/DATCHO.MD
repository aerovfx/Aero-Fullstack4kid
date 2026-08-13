Đề bài: Sắp xếp chỗ ngồi trên xe bus

Yêu cầu:
Viết một chương trình Python nhận vào thông tin về số lượng tầng và số lượng ghế trên mỗi tầng của một xe bus. Sau đó, nhập thông tin về sự đặt chỗ của hành khách trên từng ghế ngồi. Chương trình cần sắp xếp các chỗ ngồi trên xe bus sao cho các ghế ngồi cạnh nhau có chỗ trống ít nhất. Cuối cùng, in ra danh sách chỗ ngồi đã được sắp xếp.

Yêu cầu bổ sung:

Mỗi ghế ngồi được đánh số theo thứ tự từ trái sang phải, từ trên xuống dưới.
Thông tin về sự đặt chỗ của hành khách được biểu diễn bằng một ma trận kích thước số tầng x số ghế, trong đó giá trị "0" tượng trưng cho ghế trống và giá trị "1" tượng trưng cho ghế đã có người ngồi.
Các ghế cạnh nhau được xem là ghế có chỉ số hàng giống nhau và chỉ số cột liền kề.
Dữ liệu vào từ file DATCHO.INP bao gồm 
dòng 1 số nguyên thứ 1 là số tầng, số nguyên thứ 2 là số ghé mỗi tầng
các dòng còn lại là vị trí ghế ngồi trong từng tầng
DATCHO.INP
3 5
1 0 1 0 1
1 1 0 1 1
0 1 0 1 1
DATCHO.OUT
1 1 1 0 0 
1 1 1 1 0 
1 1 1 0 0 
