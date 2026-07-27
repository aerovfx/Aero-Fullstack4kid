Công ty X sản xuất những con robots thông minh gọi là pokemon, các con pokemon ban đầu giống hệt nhau, mỗi con có 𝑛 kỹ năng đánh số từ 1 tới 𝑛 và tất cả các kỹ năng đều ở cấp độ 0 khi xuất xưởng. Các con pokemon sau đó sẽ được huấn luyện bằng một chương trình đặc biệt nhằm gia tăng cấp độ các kỹ năng, để tăng cấp độ kỹ năng thứ 𝑖 lên 1 đơn vị cần thời gian huấn luyện đúng 𝑖 giây (∀𝑖 = 1..n). Ngoài ra do vấn đề kỹ thuật, không kỹ năng nào được huấn luyện vượt quá cấp độ 𝑚. Công ty X nhận được đơn đặt hàng 𝑘 con pokemon hoàn toàn phân biệt, tức là hai con pokemon bất kỳ phải có ít nhất một kỹ năng ở cấp độ khác nhau. Hãy cho biết tổng số giây ít nhất cần để huấn luyện 𝑘 con pokemon thỏa mãn yêu cầu trên. Ví dụ với số kỹ năng 𝑛 = 3, giới hạn cấp độ kỹ năng 𝑚 = 4, số con pokemon đặt hàng 𝑘 = 10. Công ty có thể huấn luyện 10 con pokemon với các kỹ năng như sau: 

Dữ liệu: 
- Dòng 1 chứa số 𝑞 ≤ 10 là số test 
- 𝑞 dòng tiếp theo, mỗi dòng chứa thông tin về 1 test, gồm ba số nguyên dương 𝑛, 𝑚, 𝑘 (𝑛 × 𝑚 ≤ 106 ; 𝑘 ≤ 105 ; 𝑘 ≤ (𝑚 + 1) 𝑛 ) 
Kết quả: 
Ghi ra với mỗi test trong file dữ liệu, ghi ra tổng số giây ít nhất cần để huấn luyện 𝑘 con pokemon theo phương án tìm được.
Ví dụ
Input
1 
3 4 10
Output
26