
Nam sở hữu một khu vườn có trồng n cây, cây thứ i có độ tươi tốt hiện tại a_i và khả năng tăng trưởng b_i.
Hôm nay, Nam dự định sử dụng tổng cộng L lít nước để tưới cho các cây trong vườn. Với mỗi lít nước tưới vào một cây thứ i, độ tươi tốt của cây sẽ tăng thêm b_i. Ngoài ra, số lít nước tưới vào mỗi cây phải là số nguyên.
Nam đánh giá vẻ đẹp của khu vườn là độ tươi tốt bé nhất trong số n cây trong vườn. Hãy giúp Nam tìm cách tưới nước sao cho vẻ đẹp của khu vườn là lớn nhất có thể.
Dữ liệu
• Dòng thứ nhất ghi hai số nguyênn,L(1≤n≤105,1≤L≤109) –số cây trong vườn và số lít nước dùng để tưới cây.
• n dòng tiếp theo, dòng thứ i gồm hai số nguyên a_i và b_i (1 ≤ a_i, b_i ≤ 10^4) 
-độ tươi tốt và khả năng tăng trưởng của cây thứ i.
Kết quả
In ra vẻ đẹp lớn nhất có thể của khu vườn với cách tưới cây tối ưu.
Dữ liệu vào
GARDEN.INP
Ví dụ thứ nhất
1 5
3 2

Ví dụ thứ hai 
3 5
1 5
6 2
3 3

Dữ liệu ra ghi vào file
GARDEN.OUT
Ví dụ thứ nhất
13

Ví dụ thứ hai 
8


Giải thích
• Ở ví dụ thứ nhất, ta sẽ tưới 5 lít nước vào cây duy nhất trong vườn. 
Khi đó, độ tươi tốt của cây + lượng nước tưới * khả năng tăng trưởng.
Kết quả là 3 + 5 * 2 = 13, và đây cũng là vẻ đẹp của khu vườn.

• Ở ví dụ thứ hai,ta sẽ tưới:
 2 lít nước vào cây thứ nhất, độ tươi tốt là 1, khả năng tăng tưởng là 5
 1 lít nước vào cây thứ hai, độ tươi tối là 6, khả năng tăng trường là 2
 2 lít nước vào cây thứ 3. độ tươi tối là 3, hkar năng tăng trưởng là 3
 Khi đó, độ tươi tốt của các cây lần lượt
 2 + 1*5 = 7
 1 + 6*2 = 13
 2 + 3*3 = 11
 
 [11,8,9] và vẻ đẹp của khu vườn là 13.

https://oj.vnoi.info/problem/fct052_garden