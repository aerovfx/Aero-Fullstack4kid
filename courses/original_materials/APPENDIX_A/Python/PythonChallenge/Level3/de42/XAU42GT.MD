<<<<<<< HEAD
thuật toán đơn giản như sau:<br/>

Đọc xâu S từ tệp tin XAU42.INP.<br/>
Tìm vị trí đầu tiên từ cuối xâu S sao cho kí tự tại vị trí đó lớn hơn kí tự đứng sau nó. Gọi vị trí này là pos.<br/>
Nếu không tìm thấy vị trí pos, tức là xâu S đã là số lớn nhất có thể có, ta ghi xâu S vào tệp tin XAU42.OUT và kết thúc chương trình.<br/>
Nếu tìm thấy vị trí pos, ta tìm kí tự nhỏ nhất từ pos+1 đến cuối xâu S mà lớn hơn kí tự tại vị trí pos. Gọi vị trí của kí tự này là next_pos.<br/>
Hoán đổi kí tự tại vị trí pos và next_pos.<br/>
Sắp xếp lại các kí tự từ pos+1 đến cuối xâu S theo thứ tự tăng dần để tạo xâu có giá trị nhỏ nhất.<br/>
Ghi xâu mới được tạo ra vào tệp tin XAU42.OUT.<br/>
=======
Đọc xâu S từ tệp tin XAU42.INP. <br/>
pos = -1<br/>
for i từ 0 đến độ dài của S - 2:<br/>
    if S[i] < S[i+1]:<br/>
        pos = i<br/>

Nếu pos = -1:<br/>
    Ghi "IMPOSSIBLE" vào tệp tin XAU42.OUT.<br/>
Ngược lại:<br/>
    max_pos = -1<br/>
    for j từ pos+1 đến độ dài của S:<br/>
        if S[j] > S[pos]:<br/>
            max_pos = j<br/>

    Hoán vị S[pos] và S[max_pos] <br/>
    Đảo ngược các phần tử từ pos+1 đến cuối của xâu S <br/>
    Ghi xâu S vào tệp tin XAU42.OUT <br/>
>>>>>>> 52f0aee02b18761e019da96d0ddf5998068ec9b0
