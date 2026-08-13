Thuật toán Dijkstra.<br/>

Thuật toán Dijkstra có thể giải quyết bài toán tìm đường đi ngắn nhất trên đồ thị vô hướng lẫn có hướng miễn là trọng số không âm.<br/>

Ý tưởng cơ bản của thuật toán như sau:<br/>

Bước 1: Từ đỉnh gốc, khởi tạo khoảng cách tới chính nó là 0, khởi tạo khoảng cách nhỏ nhất ban đầu tới các đỉnh khác là +∞. Ta được danh sách các khoảng cách tới các đỉnh.<br/>

Bước 2: Chọn đỉnh a có khoảng cách nhỏ nhất trong danh sách này và ghi nhận. Các lần sau sẽ không xét tới đỉnh này nữa.<br/>

Bước 3: Lần lượt xét các đỉnh kề b của đỉnh a. Nếu khoảng cách từ đỉnh gốc tới đỉnh b nhỏ hơn khoảng cách hiện tại đang được ghi nhận thì cập nhật giá trị và đỉnh kề a vào khoảng cách hiện tại của b.<br/>

Bước 4: Sau khi xét tất cả đỉnh kề b của đỉnh a. Lúc này ta được danh sách khoảng cách tới các điểm đã được cập nhật. Quay lại Bước 2 với danh sách này. Thuật toán kết thúc khi chọn được khoảng cách nhỏ nhất từ tất cả các điểm.<br/>

Bài toán.<br/>

Cho một đồ thị có hướng với 𝑁 đỉnh (được đánh số từ 0 đến 𝑁−1), 𝑀 cạnh có hướng, có trọng số, và một đỉnh nguồn 𝑆. Trọng số của tất cả các cạnh đều không âm. Yêu cầu tìm ra đường đi ngắn nhất từ đỉnh 𝑆 tới tất cả các đỉnh còn lại (hoặc cho biết nếu không có đường đi).<br/>

Sample Input <br/>

7 8 0<br/>
0 2 7<br/>
0 1 1<br/>
0 3 4<br/>
2 5 8<br/>
5 3 3<br/>
4 5 6<br/>
1 4 3<br/>
2 4 3<br/>
Sample Output<br/>
0<br/>
1<br/>
7<br/>
4<br/>
4<br/>
10<br/>
-1<br/>

Hình ảnh của Test ví dụ. Ở đồ thị này, đỉnh nguồn là đỉnh 0, đường đi ngắn nhất từ 0 đến các đỉnh 0 đến 5 là [0,1,7,4,4,10]. Riêng đỉnh 6 không có đường đi đến.<br/>
![](https://i.imgur.com/UhI67bO.png)

Link tham khảo
https://chidokun.github.io/2021/09/dijkstra-algorithm/
