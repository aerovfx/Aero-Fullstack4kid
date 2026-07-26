Một nhóm gồm n bạn học sinh của một lớp tham gia một câu lạc bộ tin học vào dịp nghỉ hè. Biết rằng khoảng thời gian mà bạn thứ i có mặt tại câu lạc bộ là [ai, bi] (ai<bi tương ứng là các thời điểm đến và rời khỏi câu lạc bộ). Cô giáo chủ nhiệm lớp muốn tới thăm các bạn trong nhóm này. Hãy giúp cô giáo chủ nhiệm xác định thời điểm đến câu lạc bộ sao cho tại thời điểm đó cô giáo có thể gặp được nhiều bạn trong nhóm nhất.

Dữ liệu: Vào từ file văn bản MEETING.INP:

Dòng đầu tiên ghi số nguyên dương n (n <= 1000);
Dòng thứ i trong số n dòng tiếp theo ghi 2 số nguyên không âm ai, bi, i = 1, 2,…, n.
Kết quả: Ghi ra file văn bản MEETING.OUT:

Dòng đầu tiên ghi số nguyên dương k là số lượng bạn đang có mặt ở câu lạc bộ tại thời điểm cô giáo đến;
Trong k dòng tiếp theo ghi chỉ số của k bạn có mặt ở câu lạc bộ tại thời điểm cô giáo đến, mỗi dòng ghi một chỉ số của một bạn.
Ví dụ:
-----------------------------------------------
| DAYSO.INP         | DAYSO.OUT               |
| 6                 | 3                       |
| 1 2               | 1                       |
| 2 3               | 2                       |
| 2 5               | 3                       |
| 5 7               |                         |
| 6 7               |                         |
| 9 11              |                         |
----------------------------------------------
| 5                 | 1                       |
| 1 2               | 1                       |
| 3 5               |                         |
| 7 9               |                         |
| 11 15             |                         |
| 17 21             |                         |
-----------------------------------------------
