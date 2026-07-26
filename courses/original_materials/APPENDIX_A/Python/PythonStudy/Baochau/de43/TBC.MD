cau 3:Đề thi quốc gia năm 2019

Cho một số thức R. Tìm số lượng số nguyên ít nhất để trung bình cộng của chúng bằng R.<br/>
Dữ liệu nhập vào sẽ có 10 test, mỗi test chứa một số thực R <br/>

Em cần tạo file văn bản TBC.INT gồm 10 dòng, mỗi dòng chứa duy nhất một số nguyên dương là số lượng nhỏ nhất các số nguyên thoả mãn đề bài. <br/>
Mỗi dòng ghi kết quả của một test tương ứng. Nếu test nào không tìm thấy kết quả, để trống dòng của test đó.<br/>

Ví dụ:<br/>
----------------------------------------------------<br/>
|   TEST   | TBC.INP                   |TBC.OUT     |<br/>
| 1        | 2.5                       | 2          |<br/>
| 2        | 8.125                     | 8          |<br/>
| 3        | 1.0625                    | 16         |<br/>
| 4        | 5.0475                    |            |<br/>
| 5        | 11.5936                   |            |<br/>
| 6        | 2019.0873984              |            |<br/>
| 7        | 1707.740873728            |            |<br/>
| 8        | 2.237663674368            |            |<br/>
| 9        | 4.47532757942272          |            |<br/>
| 10       | 1.8036983803445248        |            |<br/>
-----------------------------------------------------<br/>

Giải thích test 1: 2.5 là trung bình cộng của ít nhất 2 số nguyên, ví dụ: trung bình cộng của 1 và 4 l à 2.5.<br/>

Phân tích: để giải toán, ta thực hiện chuyển đổi số nhập vào thành dạng phân số rút gọn nhờ thư viện fractions. Sau khi chuyển đổi, đáp án cần tìm chính là mẫu số trong phân số đó.<br/>