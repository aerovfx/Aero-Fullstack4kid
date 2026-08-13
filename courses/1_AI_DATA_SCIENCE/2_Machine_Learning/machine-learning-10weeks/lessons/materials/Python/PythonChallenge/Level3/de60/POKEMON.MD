Công ty X sản xuất những con robots thông minh gọi là pokemon, các con pokemon ban đầu giống hệt nhau, mỗi con có 𝑛 kỹ năng đánh số từ 1 tới 𝑛 và tất cả các kỹ năng đều ở cấp độ 0 khi xuất xưởng. Các con pokemon sau đó sẽ được huấn luyện bằng một chương trình đặc biệt nhằm gia tăng cấp độ các kỹ năng, để tăng cấp độ kỹ năng thứ 𝑖 lên 1 đơn vị cần thời gian huấn luyện đúng 𝑖 giây (∀𝑖 = 1..n). Ngoài ra do vấn đề kỹ thuật, không kỹ năng nào được huấn luyện vượt quá cấp độ 𝑚. Công ty X nhận được đơn đặt hàng 𝑘 con pokemon hoàn toàn phân biệt, tức là hai con pokemon bất kỳ phải có ít nhất một kỹ năng ở cấp độ khác nhau. Hãy cho biết tổng số giây ít nhất cần để huấn luyện 𝑘 con pokemon thỏa mãn yêu cầu trên. Ví dụ với số kỹ năng 𝑛 = 3, giới hạn cấp độ kỹ năng 𝑚 = 4, số con pokemon đặt hàng 𝑘 = 10. Công ty có thể huấn luyện 10 con pokemon với các kỹ năng như sau: 

Dữ liệu: 
- Dòng 1 chứa số 𝑞 ≤ 10 là số test 
- 𝑞 dòng tiếp theo, mỗi dòng chứa thông tin về 1 test, gồm ba số nguyên dương 𝑛, 𝑚, 𝑘 (𝑛 × 𝑚 ≤ 106 ; 𝑘 ≤ 105 ; 𝑘 ≤ (𝑚 + 1) 𝑛 ) 
Kết quả: 
Ghi ra với mỗi test trong file dữ liệu, ghi ra tổng số giây ít nhất cần để huấn luyện 𝑘 con pokemon theo phương án tìm được.
Ví dụ
POKEMON.INP <br/>
1 
3 4 10
n m k

Dữ liệu ra: kết quả bài toán <br />
POKEMON.OUT <br/>
Pokemon 1: Kỹ năng 1 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 1: Kỹ năng 2 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 1: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 1 là 0 giây

Pokemon 2: Kỹ năng 1 ở cấp độ 1, Thời gian huấn luyện: 1
Pokemon 2: Kỹ năng 2 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 2: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 2 là 1 giây

Pokemon 3: Kỹ năng 1 ở cấp độ 2, Thời gian huấn luyện: 2
Pokemon 3: Kỹ năng 2 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 3: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 3 là 2 giây

Pokemon 4: Kỹ năng 1 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 4: Kỹ năng 2 ở cấp độ 1, Thời gian huấn luyện: 2
Pokemon 4: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 4 là 2 giây

Pokemon 5: Kỹ năng 1 ở cấp độ 3, Thời gian huấn luyện: 3
Pokemon 5: Kỹ năng 2 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 5: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 5 là 3 giây

Pokemon 6: Kỹ năng 1 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 6: Kỹ năng 2 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 6: Kỹ năng 3 ở cấp độ 3, Thời gian huấn luyện: 3
Tổng thời gian huấn luyện Pokemon 6 là 3 giây

Pokemon 7: Kỹ năng 1 ở cấp độ 1, Thời gian huấn luyện: 1
Pokemon 7: Kỹ năng 2 ở cấp độ 1, Thời gian huấn luyện: 2
Pokemon 7: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 7 là 3 giây

Pokemon 8: Kỹ năng 1 ở cấp độ 4, Thời gian huấn luyện: 4
Pokemon 8: Kỹ năng 2 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 8: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 8 là 4 giây

Pokemon 9: Kỹ năng 1 ở cấp độ 2, Thời gian huấn luyện: 2
Pokemon 9: Kỹ năng 2 ở cấp độ 1, Thời gian huấn luyện: 2
Pokemon 9: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 9 là 4 giây

Pokemon 10: Kỹ năng 1 ở cấp độ 0, Thời gian huấn luyện: 0
Pokemon 10: Kỹ năng 2 ở cấp độ 2, Thời gian huấn luyện: 4
Pokemon 10: Kỹ năng 3 ở cấp độ 0, Thời gian huấn luyện: 0
Tổng thời gian huấn luyện Pokemon 10 là 4 giây

Tổng thời gian huấn luyện tối thiểu là 26 giây
0	0	0
0	1	0
0	0	1
0	2	0
1	0	0
1	1	0
2	1	0
2	0	0
3	0	0
4	0	0