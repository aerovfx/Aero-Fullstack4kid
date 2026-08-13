Xếp gạch (100 điểm)
Bộ đồ chơi của Bờm có n viên gạch hình vuông đơn vị. Bờm muốn dùng các viên gạch này để xếp
thành một hình chữ nhật có độ dài hai cạnh là hai số nguyên tố liên tiếp. Biết rằng để xếp thành một
hình chữ nhật với kích thước hai cạnh là p và q thì Bờm cần sử dụng đúng p × q viên gạch. Bờm
muốn xác định kích thước cạnh của hình chữ nhật cần xếp để số viên gạch thừa ra (không được
dùng để xếp) là ít nhất.
Cụ thể là Bờm cần tìm hai số p, q là độ dài hai cạnh của hình chữ nhật thỏa mãn các điều kiện sau:
p, q là hai số nguyên tố liên tiếp;
Số viên gạch cần dùng không vượt quá n: p × q ≤ n;
Số viên gạch bị thừa: n − p × q là nhỏ nhất có thể.
Yêu cầu: Bạn cần trả lời t truy vấn, mỗi truy vấn cho bởi số n là số viên gạch của Bờm. Với mỗi
truy vấn, hãy xác định kích thước hình chữ nhật Bờm cần xếp, cho biết số viên gạch bị thừa theo
phương án tìm được.
Dữ liệu: Vào từ thiết bị nhập chuẩn:
Dòng đầu chứa số nguyên dương t;
t dòng tiếp theo, mỗi dòng chứa một số nguyên n ứng với một truy vấn (6 ≤ n ≤ 1012).
Kết quả: Ghi ra thiết bị xuất chuẩn:
Ứng với mỗi truy vấn, ghi ra số viên gạch bị thừa theo phương án tìm được
Ví dụ:
----------------------------------------------------
| XEPGACH.INP | XEPGACH.UOT |   Giải thích          |
| 3           | 5           |n = 20, chọn 3 × 5     |
| 20          | 10          |n = 25, chọn 3 × 5     |
| 25          | 0           |n = 2021, chọn 43 × 47 |
| 2021        |
----------------------------------------------------
n = 20, chọn 3 × 5, thừa 5 viên
n = 25, chọn 3 × 5, thừa 10 viên
n = 2021, chọn 43 × 47, thừa 0 viên

Ràng buộc:
• Có 30% số test ứng với 30% số điểm của bài thỏa mãn: n ≤ 1000 và t ≤ 5;
• 40% số test khác ứng với 40% số điểm của bài thỏa mãn: n ≤ 109 và t ≤ 100;
• 30% số test còn lại ứng với 30% số điểm của bài thỏa mãn: n ≤ 1012 và t ≤ 105