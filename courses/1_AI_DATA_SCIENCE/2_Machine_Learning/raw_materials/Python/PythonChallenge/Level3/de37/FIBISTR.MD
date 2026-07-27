Xét dãy các xâu F1, F2,... Fn trong đó:

F1 = 'A'; F2 = 'B'; Fk+1 = Fk + F(k-1) với k=>2

Ví dụ:

F1 = 'A'
F2 = 'B'
F3 = 'BA'
F4 = 'BAB'
F5 = 'BABBA'
F6 = 'BABBABAB'...
Cho xâu S độ dài không quá 25, chỉ bao gồm các kí tự 'A' và 'B'. Yêu cầu:

Hãy xác định số lần xuất hiện xâu S trong xâu Fn, n<=35. Chú ý: Hai lần xuất hiện của S trong Fn không nhất thiết phải là các xâu rời nhau hoàn toàn.
Dữ liệu vào: Đọc từ file văn bản FIBISTR.INP có cấu trúc như sau: Gồm nhiều dòng, mỗi dòng gồm n và S. Giữa n và S có đúng 1 dấu cách. Dữ liệu vào là chuẩn, không cần kiểm tra.
Dữ liệu ra: Ghi ra file văn bản FIBISTR.OUT có cấu trúc như sau: Gồm nhiều dòng, mỗi dòng dữ liệu ứng với một dòng kết quả ra.