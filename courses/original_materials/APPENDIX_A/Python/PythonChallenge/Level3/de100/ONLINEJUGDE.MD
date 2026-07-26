Các vấn đề trong Khoa học Máy tính thường được phân loại vào một số lớp vấn đề cụ thể (ví dụ: NP, Không thể giải, Đệ quy). Trong bài toán này, bạn sẽ phân tích một thuộc tính của một thuật toán mà phân loại của nó không được biết đối với tất cả các giá trị đầu vào có thể có.

Xem xét thuật toán sau:
2. 3. 4. 5. 6.

Nhập giá trị n
In ra giá trị n
Nếu n = 1 thì DỪNG
Nếu n là số lẻ thì gán n ←− 3n + 1
Ngược lại, gán n ←− n/2 và QUAY LẠI bước 2
Cho giá trị đầu vào là 22, chuỗi các số sau sẽ được in ra: 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1

Có một giả thiết rằng thuật toán trên sẽ kết thúc (khi giá trị 1 được in ra) với bất kỳ giá trị nguyên nào. Mặc dù thuật toán rất đơn giản, không biết liệu giả thiết này có đúng hay không. Tuy nhiên, đã được xác minh rằng giả thiết này đúng đối với tất cả các số nguyên n sao cho 0 < n < 1,000,000 (thậm chí đúng với nhiều số hơn nữa).

Cho một giá trị đầu vào n, có thể xác định số lượng số được in ra trước khi số 1 được in ra (bao gồm cả số 1). Đối với một n cụ thể, đây được gọi là chiều dài chu kỳ của n. Trong ví dụ trên, chiều dài chu kỳ của 22 là 16.

Đối với hai số i và j bất kỳ, bạn cần xác định chiều dài chu kỳ tối đa qua tất cả các số từ i đến j (bao gồm cả i và j).

Đầu vào:
Đầu vào sẽ bao gồm một loạt các cặp số nguyên i và j, mỗi cặp trên một dòng. Tất cả các số nguyên đều nhỏ hơn 10,000 và lớn hơn 0.

Bạn nên xử lý tất cả các cặp số nguyên và đối với mỗi cặp, xác định chiều dài chu kỳ tối đa qua tất cả các số từ i đến j.

Bạn có thể giả định rằng không có phép tính nào làm tràn số nguyên 32-bit.

Đầu ra:
Đối với mỗi cặp số nguyên i và j đầu vào, bạn nên xuất i, j và chiều dài chu kỳ tối đa cho các số từ i đến j. Ba số này phải được tách ra ít nhất một dấu cách và được in trên cùng một dòng, mỗi dòng đầu vào tương ứng với một dòng đầu ra. Các số nguyên i và j phải xuất hiện trong kết quả theo cùng thứ tự như trong đầu vào và phải được theo sau bởi chiều dài chu kỳ tối đa (cùng trên một dòng).

Ví dụ đầu vào:
1 10
100 200
201 210
900 1000

Ví dụ đầu ra:
1 10 20
100 200 125
201 210 89
900 1000 174

Nguồn
https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&category=3&page=show_problem&problem=36