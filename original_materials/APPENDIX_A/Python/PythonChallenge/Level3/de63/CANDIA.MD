Cho một cân hai đĩa và n quả cân có khối lượng đôi một khác nhau w_1, w_2,..Tiến hành đặt lần lượt từng quả cân lên một trong hai đĩa của cân và đảm bảo tổng khối lượng bên trái luôn nhỏ hơn hoặc bằng tổng khối lượng bên phải.
Yêu cầu: Cho n quả cân có khối lượng w_1 và w_2,...w_n, hãy đếm số cách xếp n cân thoả mãn. Hai cách được gọi là khác nhau nếu thứ tự xếp các quả cân khác nhau hoặc tồn tại một quả cân nằm ở đĩa cân khác nhâu
Dữ liệu
Dòng 1: Chứa số nguyên n
Dòng 2: Chứa số nguyên dương w_i
Kết quả: Một dòng chứa một số nguyên là số cách xếp n quả cân lên đĩa
Dữ liệu vào
2
1 2

Kết quả ra
3
Giải thích: Ở bên trái có 8 cách sắp xếp các quả cân lên hai bàn cân như sau:
Cách 1: đặt quả cân 1 bên trái rồi quả cân 2 bên trái
Cách 2: đặt quả cân 1 bên trái rồi quả cân 2 bên phải
Cách 3: đặt quả cân 1 bên phải rồi đặt quả cân 2 bên trái
Cách 4: đặt quả cân 1 bên phải rồi đặt quả cân 2 bên phải
Cách 5: đặt quả cân 2 bên trái rồi đặt quả cân 1 bên trái
Cách 6: đặt quả cân 2 bên trái rồi đặt quả cân 1 bên phải
Cách 7: đặt quả cân 2 bên phải rồi đặt quả cân 1 bên trái
Cách 8: đặt quả cân 2 bên phải rồi đặt quả cân 1 bên phải
Chỉ có 3 cách thỏa mãn điều kiện khối lượng đĩa cân bên trái luôn nhỏ hơn hoặc bằng đĩa cân bên phải là cách 4, cách 7 và cách 8
Ràng buộc:
+Có 40% số test ứng với 40% số điểm của bài có n <= 7 và w_i <= 1000 ( 1 <= i <= n)
+Có 40% số test ứng với 40% số điểm của bài có n <= 14 và w_i <= 1000 ( 1 <= i <= n)
+Có 40% số test ứng với 40% số điểm của bài có n <= 28 và w_i <= 2^(i -1) ( 1 <= i <= n)