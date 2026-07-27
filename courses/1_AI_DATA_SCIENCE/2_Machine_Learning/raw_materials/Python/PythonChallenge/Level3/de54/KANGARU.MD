
Một chú Kangaroo muốn đi thăm một người bạn trên cùng tuyến đường cách đó một khoảng n (đơn vị dm). Kangaroo chỉ có hai cách di chuyển, một là nhảy ngắn a (đơn vị dm), hai là nhảy dài b (đơn vị dm). Hỏi chú Kangaroo cần nhảy ít nhất bao nhiêu bước nhảy để đến được nhà người bạn (phải nhảy vừa đủ, không nhảy quá nhà bạn).<br/>
* Dữ liệu vào từ file: KANGAROO.INP<br/>
- Gồm ba số nguyên dương n, a, b. Các số cách nhau một khoảng trắng (1 <= n <= 109, 1 <= a < b <= 20).<br/>
* Kết quả ra file: KANGAROO.OUT<br/>
- Ghi tổng số bước nhảy ít nhất của chú Kangaroo.<br/>
Ví dụ:<br/>
KANGAROO.INP <br/>
21 2 5

KANGAROO.OUT<br/>
6
Phân tích: file OUT không nêu ra trường hợp Kangaroo nhảy không được, như vậy dữ liệu được cho hoàn toàn phù hợp (chắc chắn có đáp số đúng).
Lý thuyết số: Nếu gọi x, y lần lượt là số bước nhảy ngắn và số bước nhảy dài thì ta sẽ có phương trình nghiệm nguyên: n = ax + by.