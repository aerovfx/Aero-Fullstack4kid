Cho dãy số nguyên a1, a2,…, an (n <= 1000).

Hãy tìm cách thực hiện một số ít nhất phép đổi chỗ hai số hạng bất kỳ của dãy để thu được dãy số mà số lẻ đứng ở vị trí lẻ, số chẵn đứng ở vị trí chẵn.

Dữ liệu: Vào từ file văn bản DAYSO.INP:

Dòng đầu tiên chứa số nguyên dương n;
Dòng thứ i trong số n dòng tiếp theo chứa số hạng ai của dãy đã cho (-32767 à 32767, i = 1, 2,…, n).
Kết quả: ghi ra file văn bản DAYSO.OUT:

Dòng đầu tiên ghi số lượng phép đổi chỗ cần thực hiện k (qui ước k = -1, nếu không thể biến đổi được dãy đã cho thành dãy thoả mãn yêu cầu đầu bài);
Nếu k > 0, thì dòng thứ j trong số k dòng tiếp theo ghi chỉ số của hai số hạng cần đổi chỗ cho nhau ở lần đổi chỗ thứ j  ( j =1, 2,…, k).
Ví dụ:
-----------------------------------------------
| DAYSO.INP         | DAYSO.OUT               |
| 6                 |  1                      |
| 1                 |  5 6                    |
| 2                 |                         |
| 3                 |                         |
| 4                 |                         |
| 6                 |                         |
| 5                 |                         |
----------------------------------------------
| 4                 | -1                      |
| 1                 |                         |
| 3                 |                         |
| 2                 |                         |
| 5                 |                         |
-----------------------------------------------
