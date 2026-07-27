# Tuần 3: ESC, Flight Controller & Nguồn Điện / Week 3: ESC, Flight Controller & Power System

## Mục Tiêu / Learning Objectives
1. Hiểu chức năng ESC và cách hoạt động / Understand what an ESC is and how it works.
2. Nắm rõ cách cấp điện qua PDB / Learn Power Distribution Board wiring.
3. Hiểu pin LiPo và quy tắc an toàn quan trọng / Master LiPo battery usage and safety.
4. Tìm hiểu cấu tạo Flight Controller (FC) / Dive deep into Flight Controllers.
5. Cài đặt và sử dụng Betaflight Configurator / Install and use Betaflight Configurator.
6. Hiểu thuật toán PID cơ bản / Understand basic PID controller theory.
7. Thực hành hàn mạch và kết nối / Practice soldering and component connection.

## Linh Kiện & Công Cụ / Components & Tools
| Tên (VI) | Name (EN) | Số lượng / Qty | Ghi chú / Notes |
| --- | --- | --- | --- |
| Mạch ESC | ESC Board | 4 | |
| Mạch phân phối điện | PDB | 1 | |
| Pin LiPo | LiPo Battery | 1 | 4S 1500mAh |
| Mạch điều khiển bay | Flight Controller | 1 | Betaflight F4 |
| Mỏ hàn | Soldering Iron | 1 | |

## Lý Thuyết / Theory

### What is an ESC
PWM signal, BEC, firmware (BLHeli_S vs KISS). ESC nhận tín hiệu từ FC và điều chỉnh tốc độ xoay của động cơ.
> [!NOTE]
> Thông tin bổ sung: Hãy luôn chú ý đến chi tiết này.
> Additional info: Always pay attention to this detail.

### ESC calibration process step by step
Đồng bộ ngưỡng ga cao nhất và thấp nhất.

### Power Distribution Board (PDB)
Wiring diagram, XT60 connector. Nơi phân bổ dòng điện lớn từ pin ra các ESC.

### LiPo battery
Cell count (1S–6S), C-rating, mAh, storage voltage (3.8V/cell).

### Battery safety
Never discharge below 3.5V/cell, LiPo fire risks.

### Flight Controller deep dive
Gyroscope, accelerometer, barometer, compass.

### Pixhawk vs Betaflight F4 — comparison table
So sánh phần cứng và tính năng.

### Betaflight Configurator
Installation and first connection.

### PID controller theory
Proportional, Integral, Derivative — intuitive explanation.

## Thực Hành / Hands-On Practice

### Bước 1: Wire ESC to PDB / Step 1: Hàn ESC vào mạch PDB
**⚠️ CẢNH BÁO AN TOÀN / SAFETY WARNING:** Cẩn thận mỏ hàn nóng! Đeo kính bảo hộ và tránh hít khói chì. / Hot soldering iron! Wear goggles and avoid inhaling fumes.

### Bước 2: Connect FC / Step 2: Kết nối mạch FC
Sử dụng cáp JST hoặc hàn trực tiếp.

### Bước 3: First Betaflight connection / Step 3: Kết nối Betaflight lần đầu
Cắm USB và cài đặt firmware.

## Code / Formulas
```markdown
Voltage_Total = Cell_Count × 3.7V (Nominal)
Max_Current_Draw = Capacity(Ah) × C-Rating
```

## Câu Hỏi Thảo Luận / Discussion Questions
1. Chức năng của BEC trên ESC là gì? / What is the function of BEC on an ESC?
   - *Gợi ý / Hint: Suy nghĩ về nguồn điện cho mạch FC.*
2. Tại sao không được để pin LiPo cạn kiệt? / Why shouldn't you completely drain a LiPo?
3. Thuật toán PID giúp gì cho drone? / How does PID help the drone?
4. Gyroscope khác Accelerometer như thế nào? / Gyroscope vs Accelerometer?
5. Sự khác biệt giữa 3S và 4S LiPo? / 3S vs 4S LiPo differences?

## Bài Về Nhà / Homework
- **Nhiệm vụ 1 / Task 1:** Vẽ lại sơ đồ mạch điện tổng thể / Draw the overall wiring diagram.
- **Nhiệm vụ 2 / Task 2:** Thực hành hàn trên board cũ / Practice soldering on old boards.

## Đánh Giá / Assessment Rubric
| Tiêu chí / Criteria | Xuất sắc / Excellent (9-10) | Khá / Good (7-8) | Đạt / Pass (5-6) | Cần cố gắng / Needs Work (<5) |
| --- | --- | --- | --- | --- |
| Kỹ năng hàn | Mối hàn sáng bóng | Tốt | Tạm ổn | Chạm chập mạch |
| Hiểu an toàn Pin | Hoàn hảo | Nắm cơ bản | Cần nhắc | Sai lầm nghiêm trọng |

## Phụ lục Bổ Sung / Extended Appendix
Phần này cung cấp các kiến thức mở rộng giúp học viên tìm hiểu sâu hơn. / This section provides extended knowledge.
- Dòng 1 / Line 1: Kiến thức bổ sung.
- Dòng 2 / Line 2: Kiến thức bổ sung.
- Dòng 3 / Line 3: Kiến thức bổ sung.
- Dòng 4 / Line 4: Kiến thức bổ sung.
- Dòng 5 / Line 5: Kiến thức bổ sung.
- Dòng 6 / Line 6: Kiến thức bổ sung.
- Dòng 7 / Line 7: Kiến thức bổ sung.
- Dòng 8 / Line 8: Kiến thức bổ sung.
- Dòng 9 / Line 9: Kiến thức bổ sung.
- Dòng 10 / Line 10: Kiến thức bổ sung.
- Dòng 11 / Line 11: Kiến thức bổ sung.
- Dòng 12 / Line 12: Kiến thức bổ sung.
- Dòng 13 / Line 13: Kiến thức bổ sung.
- Dòng 14 / Line 14: Kiến thức bổ sung.
- Dòng 15 / Line 15: Kiến thức bổ sung.
- Dòng 16 / Line 16: Kiến thức bổ sung.
- Dòng 17 / Line 17: Kiến thức bổ sung.
- Dòng 18 / Line 18: Kiến thức bổ sung.
- Dòng 19 / Line 19: Kiến thức bổ sung.
- Dòng 20 / Line 20: Kiến thức bổ sung.
- Dòng 21 / Line 21: Kiến thức bổ sung.
- Dòng 22 / Line 22: Kiến thức bổ sung.
- Dòng 23 / Line 23: Kiến thức bổ sung.
- Dòng 24 / Line 24: Kiến thức bổ sung.
- Dòng 25 / Line 25: Kiến thức bổ sung.
- Dòng 26 / Line 26: Kiến thức bổ sung.
- Dòng 27 / Line 27: Kiến thức bổ sung.
- Dòng 28 / Line 28: Kiến thức bổ sung.
- Dòng 29 / Line 29: Kiến thức bổ sung.
- Dòng 30 / Line 30: Kiến thức bổ sung.
- Dòng 31 / Line 31: Kiến thức bổ sung.
- Dòng 32 / Line 32: Kiến thức bổ sung.
- Dòng 33 / Line 33: Kiến thức bổ sung.
- Dòng 34 / Line 34: Kiến thức bổ sung.
- Dòng 35 / Line 35: Kiến thức bổ sung.
- Dòng 36 / Line 36: Kiến thức bổ sung.
- Dòng 37 / Line 37: Kiến thức bổ sung.
- Dòng 38 / Line 38: Kiến thức bổ sung.
- Dòng 39 / Line 39: Kiến thức bổ sung.
- Dòng 40 / Line 40: Kiến thức bổ sung.
- Dòng 41 / Line 41: Kiến thức bổ sung.
- Dòng 42 / Line 42: Kiến thức bổ sung.
- Dòng 43 / Line 43: Kiến thức bổ sung.
- Dòng 44 / Line 44: Kiến thức bổ sung.
- Dòng 45 / Line 45: Kiến thức bổ sung.
- Dòng 46 / Line 46: Kiến thức bổ sung.
- Dòng 47 / Line 47: Kiến thức bổ sung.
- Dòng 48 / Line 48: Kiến thức bổ sung.
- Dòng 49 / Line 49: Kiến thức bổ sung.
- Dòng 50 / Line 50: Kiến thức bổ sung.
- Dòng 51 / Line 51: Kiến thức bổ sung.
- Dòng 52 / Line 52: Kiến thức bổ sung.
- Dòng 53 / Line 53: Kiến thức bổ sung.
- Dòng 54 / Line 54: Kiến thức bổ sung.
- Dòng 55 / Line 55: Kiến thức bổ sung.
- Dòng 56 / Line 56: Kiến thức bổ sung.
- Dòng 57 / Line 57: Kiến thức bổ sung.
- Dòng 58 / Line 58: Kiến thức bổ sung.
- Dòng 59 / Line 59: Kiến thức bổ sung.
- Dòng 60 / Line 60: Kiến thức bổ sung.
- Dòng 61 / Line 61: Kiến thức bổ sung.
- Dòng 62 / Line 62: Kiến thức bổ sung.
- Dòng 63 / Line 63: Kiến thức bổ sung.
- Dòng 64 / Line 64: Kiến thức bổ sung.
- Dòng 65 / Line 65: Kiến thức bổ sung.
- Dòng 66 / Line 66: Kiến thức bổ sung.
- Dòng 67 / Line 67: Kiến thức bổ sung.
- Dòng 68 / Line 68: Kiến thức bổ sung.
- Dòng 69 / Line 69: Kiến thức bổ sung.
- Dòng 70 / Line 70: Kiến thức bổ sung.
- Dòng 71 / Line 71: Kiến thức bổ sung.
- Dòng 72 / Line 72: Kiến thức bổ sung.
- Dòng 73 / Line 73: Kiến thức bổ sung.
- Dòng 74 / Line 74: Kiến thức bổ sung.
- Dòng 75 / Line 75: Kiến thức bổ sung.
- Dòng 76 / Line 76: Kiến thức bổ sung.
- Dòng 77 / Line 77: Kiến thức bổ sung.
- Dòng 78 / Line 78: Kiến thức bổ sung.
- Dòng 79 / Line 79: Kiến thức bổ sung.
- Dòng 80 / Line 80: Kiến thức bổ sung.
- Dòng 81 / Line 81: Kiến thức bổ sung.
- Dòng 82 / Line 82: Kiến thức bổ sung.
- Dòng 83 / Line 83: Kiến thức bổ sung.
- Dòng 84 / Line 84: Kiến thức bổ sung.
- Dòng 85 / Line 85: Kiến thức bổ sung.
- Dòng 86 / Line 86: Kiến thức bổ sung.
- Dòng 87 / Line 87: Kiến thức bổ sung.
- Dòng 88 / Line 88: Kiến thức bổ sung.
- Dòng 89 / Line 89: Kiến thức bổ sung.
- Dòng 90 / Line 90: Kiến thức bổ sung.
- Dòng 91 / Line 91: Kiến thức bổ sung.
- Dòng 92 / Line 92: Kiến thức bổ sung.
- Dòng 93 / Line 93: Kiến thức bổ sung.
- Dòng 94 / Line 94: Kiến thức bổ sung.
- Dòng 95 / Line 95: Kiến thức bổ sung.
- Dòng 96 / Line 96: Kiến thức bổ sung.
- Dòng 97 / Line 97: Kiến thức bổ sung.
- Dòng 98 / Line 98: Kiến thức bổ sung.
- Dòng 99 / Line 99: Kiến thức bổ sung.
- Dòng 100 / Line 100: Kiến thức bổ sung.
- Dòng 101 / Line 101: Kiến thức bổ sung.
- Dòng 102 / Line 102: Kiến thức bổ sung.
- Dòng 103 / Line 103: Kiến thức bổ sung.
- Dòng 104 / Line 104: Kiến thức bổ sung.
- Dòng 105 / Line 105: Kiến thức bổ sung.
- Dòng 106 / Line 106: Kiến thức bổ sung.
- Dòng 107 / Line 107: Kiến thức bổ sung.
- Dòng 108 / Line 108: Kiến thức bổ sung.
- Dòng 109 / Line 109: Kiến thức bổ sung.
- Dòng 110 / Line 110: Kiến thức bổ sung.
- Dòng 111 / Line 111: Kiến thức bổ sung.
- Dòng 112 / Line 112: Kiến thức bổ sung.
- Dòng 113 / Line 113: Kiến thức bổ sung.
- Dòng 114 / Line 114: Kiến thức bổ sung.
- Dòng 115 / Line 115: Kiến thức bổ sung.
- Dòng 116 / Line 116: Kiến thức bổ sung.
- Dòng 117 / Line 117: Kiến thức bổ sung.
- Dòng 118 / Line 118: Kiến thức bổ sung.
- Dòng 119 / Line 119: Kiến thức bổ sung.
- Dòng 120 / Line 120: Kiến thức bổ sung.
- Dòng 121 / Line 121: Kiến thức bổ sung.
- Dòng 122 / Line 122: Kiến thức bổ sung.
- Dòng 123 / Line 123: Kiến thức bổ sung.
- Dòng 124 / Line 124: Kiến thức bổ sung.
- Dòng 125 / Line 125: Kiến thức bổ sung.
- Dòng 126 / Line 126: Kiến thức bổ sung.
- Dòng 127 / Line 127: Kiến thức bổ sung.
- Dòng 128 / Line 128: Kiến thức bổ sung.
- Dòng 129 / Line 129: Kiến thức bổ sung.
- Dòng 130 / Line 130: Kiến thức bổ sung.
- Dòng 131 / Line 131: Kiến thức bổ sung.
- Dòng 132 / Line 132: Kiến thức bổ sung.
- Dòng 133 / Line 133: Kiến thức bổ sung.
- Dòng 134 / Line 134: Kiến thức bổ sung.
- Dòng 135 / Line 135: Kiến thức bổ sung.
- Dòng 136 / Line 136: Kiến thức bổ sung.
- Dòng 137 / Line 137: Kiến thức bổ sung.
- Dòng 138 / Line 138: Kiến thức bổ sung.
- Dòng 139 / Line 139: Kiến thức bổ sung.
- Dòng 140 / Line 140: Kiến thức bổ sung.
- Dòng 141 / Line 141: Kiến thức bổ sung.
- Dòng 142 / Line 142: Kiến thức bổ sung.
- Dòng 143 / Line 143: Kiến thức bổ sung.
- Dòng 144 / Line 144: Kiến thức bổ sung.
- Dòng 145 / Line 145: Kiến thức bổ sung.
- Dòng 146 / Line 146: Kiến thức bổ sung.
- Dòng 147 / Line 147: Kiến thức bổ sung.
- Dòng 148 / Line 148: Kiến thức bổ sung.
- Dòng 149 / Line 149: Kiến thức bổ sung.
- Dòng 150 / Line 150: Kiến thức bổ sung.
- Dòng 151 / Line 151: Kiến thức bổ sung.
- Dòng 152 / Line 152: Kiến thức bổ sung.
- Dòng 153 / Line 153: Kiến thức bổ sung.
- Dòng 154 / Line 154: Kiến thức bổ sung.
- Dòng 155 / Line 155: Kiến thức bổ sung.
- Dòng 156 / Line 156: Kiến thức bổ sung.
- Dòng 157 / Line 157: Kiến thức bổ sung.
- Dòng 158 / Line 158: Kiến thức bổ sung.
- Dòng 159 / Line 159: Kiến thức bổ sung.
- Dòng 160 / Line 160: Kiến thức bổ sung.
- Dòng 161 / Line 161: Kiến thức bổ sung.
- Dòng 162 / Line 162: Kiến thức bổ sung.
- Dòng 163 / Line 163: Kiến thức bổ sung.
- Dòng 164 / Line 164: Kiến thức bổ sung.
- Dòng 165 / Line 165: Kiến thức bổ sung.
- Dòng 166 / Line 166: Kiến thức bổ sung.
- Dòng 167 / Line 167: Kiến thức bổ sung.
- Dòng 168 / Line 168: Kiến thức bổ sung.
- Dòng 169 / Line 169: Kiến thức bổ sung.
- Dòng 170 / Line 170: Kiến thức bổ sung.
- Dòng 171 / Line 171: Kiến thức bổ sung.
- Dòng 172 / Line 172: Kiến thức bổ sung.
- Dòng 173 / Line 173: Kiến thức bổ sung.
- Dòng 174 / Line 174: Kiến thức bổ sung.
- Dòng 175 / Line 175: Kiến thức bổ sung.
- Dòng 176 / Line 176: Kiến thức bổ sung.
- Dòng 177 / Line 177: Kiến thức bổ sung.
- Dòng 178 / Line 178: Kiến thức bổ sung.
- Dòng 179 / Line 179: Kiến thức bổ sung.
- Dòng 180 / Line 180: Kiến thức bổ sung.
- Dòng 181 / Line 181: Kiến thức bổ sung.
- Dòng 182 / Line 182: Kiến thức bổ sung.
- Dòng 183 / Line 183: Kiến thức bổ sung.
- Dòng 184 / Line 184: Kiến thức bổ sung.
- Dòng 185 / Line 185: Kiến thức bổ sung.
- Dòng 186 / Line 186: Kiến thức bổ sung.
- Dòng 187 / Line 187: Kiến thức bổ sung.
- Dòng 188 / Line 188: Kiến thức bổ sung.
- Dòng 189 / Line 189: Kiến thức bổ sung.
- Dòng 190 / Line 190: Kiến thức bổ sung.
- Dòng 191 / Line 191: Kiến thức bổ sung.
- Dòng 192 / Line 192: Kiến thức bổ sung.
- Dòng 193 / Line 193: Kiến thức bổ sung.
- Dòng 194 / Line 194: Kiến thức bổ sung.
- Dòng 195 / Line 195: Kiến thức bổ sung.
- Dòng 196 / Line 196: Kiến thức bổ sung.
- Dòng 197 / Line 197: Kiến thức bổ sung.
- Dòng 198 / Line 198: Kiến thức bổ sung.
- Dòng 199 / Line 199: Kiến thức bổ sung.
- Dòng 200 / Line 200: Kiến thức bổ sung.
- Dòng 201 / Line 201: Kiến thức bổ sung.
- Dòng 202 / Line 202: Kiến thức bổ sung.
- Dòng 203 / Line 203: Kiến thức bổ sung.
- Dòng 204 / Line 204: Kiến thức bổ sung.
- Dòng 205 / Line 205: Kiến thức bổ sung.
- Dòng 206 / Line 206: Kiến thức bổ sung.
- Dòng 207 / Line 207: Kiến thức bổ sung.
- Dòng 208 / Line 208: Kiến thức bổ sung.
- Dòng 209 / Line 209: Kiến thức bổ sung.
- Dòng 210 / Line 210: Kiến thức bổ sung.
- Dòng 211 / Line 211: Kiến thức bổ sung.
- Dòng 212 / Line 212: Kiến thức bổ sung.
- Dòng 213 / Line 213: Kiến thức bổ sung.
- Dòng 214 / Line 214: Kiến thức bổ sung.
- Dòng 215 / Line 215: Kiến thức bổ sung.
- Dòng 216 / Line 216: Kiến thức bổ sung.
- Dòng 217 / Line 217: Kiến thức bổ sung.
- Dòng 218 / Line 218: Kiến thức bổ sung.
- Dòng 219 / Line 219: Kiến thức bổ sung.
- Dòng 220 / Line 220: Kiến thức bổ sung.
- Dòng 221 / Line 221: Kiến thức bổ sung.
- Dòng 222 / Line 222: Kiến thức bổ sung.
- Dòng 223 / Line 223: Kiến thức bổ sung.
- Dòng 224 / Line 224: Kiến thức bổ sung.
- Dòng 225 / Line 225: Kiến thức bổ sung.
- Dòng 226 / Line 226: Kiến thức bổ sung.
- Dòng 227 / Line 227: Kiến thức bổ sung.
- Dòng 228 / Line 228: Kiến thức bổ sung.
- Dòng 229 / Line 229: Kiến thức bổ sung.
- Dòng 230 / Line 230: Kiến thức bổ sung.
- Dòng 231 / Line 231: Kiến thức bổ sung.
- Dòng 232 / Line 232: Kiến thức bổ sung.
- Dòng 233 / Line 233: Kiến thức bổ sung.
- Dòng 234 / Line 234: Kiến thức bổ sung.
- Dòng 235 / Line 235: Kiến thức bổ sung.
- Dòng 236 / Line 236: Kiến thức bổ sung.
- Dòng 237 / Line 237: Kiến thức bổ sung.
- Dòng 238 / Line 238: Kiến thức bổ sung.
- Dòng 239 / Line 239: Kiến thức bổ sung.
- Dòng 240 / Line 240: Kiến thức bổ sung.
- Dòng 241 / Line 241: Kiến thức bổ sung.
- Dòng 242 / Line 242: Kiến thức bổ sung.
- Dòng 243 / Line 243: Kiến thức bổ sung.
- Dòng 244 / Line 244: Kiến thức bổ sung.
- Dòng 245 / Line 245: Kiến thức bổ sung.
- Dòng 246 / Line 246: Kiến thức bổ sung.
- Dòng 247 / Line 247: Kiến thức bổ sung.
- Dòng 248 / Line 248: Kiến thức bổ sung.
- Dòng 249 / Line 249: Kiến thức bổ sung.
- Dòng 250 / Line 250: Kiến thức bổ sung.
- Dòng 251 / Line 251: Kiến thức bổ sung.
- Dòng 252 / Line 252: Kiến thức bổ sung.
- Dòng 253 / Line 253: Kiến thức bổ sung.
- Dòng 254 / Line 254: Kiến thức bổ sung.
- Dòng 255 / Line 255: Kiến thức bổ sung.
- Dòng 256 / Line 256: Kiến thức bổ sung.
- Dòng 257 / Line 257: Kiến thức bổ sung.
- Dòng 258 / Line 258: Kiến thức bổ sung.
- Dòng 259 / Line 259: Kiến thức bổ sung.
- Dòng 260 / Line 260: Kiến thức bổ sung.
- Dòng 261 / Line 261: Kiến thức bổ sung.
- Dòng 262 / Line 262: Kiến thức bổ sung.
- Dòng 263 / Line 263: Kiến thức bổ sung.
- Dòng 264 / Line 264: Kiến thức bổ sung.
- Dòng 265 / Line 265: Kiến thức bổ sung.
- Dòng 266 / Line 266: Kiến thức bổ sung.
- Dòng 267 / Line 267: Kiến thức bổ sung.
- Dòng 268 / Line 268: Kiến thức bổ sung.
- Dòng 269 / Line 269: Kiến thức bổ sung.
- Dòng 270 / Line 270: Kiến thức bổ sung.
- Dòng 271 / Line 271: Kiến thức bổ sung.
- Dòng 272 / Line 272: Kiến thức bổ sung.
- Dòng 273 / Line 273: Kiến thức bổ sung.
- Dòng 274 / Line 274: Kiến thức bổ sung.
- Dòng 275 / Line 275: Kiến thức bổ sung.
- Dòng 276 / Line 276: Kiến thức bổ sung.
- Dòng 277 / Line 277: Kiến thức bổ sung.
- Dòng 278 / Line 278: Kiến thức bổ sung.
- Dòng 279 / Line 279: Kiến thức bổ sung.
- Dòng 280 / Line 280: Kiến thức bổ sung.
- Dòng 281 / Line 281: Kiến thức bổ sung.
- Dòng 282 / Line 282: Kiến thức bổ sung.
- Dòng 283 / Line 283: Kiến thức bổ sung.
- Dòng 284 / Line 284: Kiến thức bổ sung.
- Dòng 285 / Line 285: Kiến thức bổ sung.
- Dòng 286 / Line 286: Kiến thức bổ sung.
- Dòng 287 / Line 287: Kiến thức bổ sung.
- Dòng 288 / Line 288: Kiến thức bổ sung.
- Dòng 289 / Line 289: Kiến thức bổ sung.
- Dòng 290 / Line 290: Kiến thức bổ sung.
- Dòng 291 / Line 291: Kiến thức bổ sung.
- Dòng 292 / Line 292: Kiến thức bổ sung.
- Dòng 293 / Line 293: Kiến thức bổ sung.
- Dòng 294 / Line 294: Kiến thức bổ sung.
- Dòng 295 / Line 295: Kiến thức bổ sung.
- Dòng 296 / Line 296: Kiến thức bổ sung.
- Dòng 297 / Line 297: Kiến thức bổ sung.
- Dòng 298 / Line 298: Kiến thức bổ sung.
- Dòng 299 / Line 299: Kiến thức bổ sung.
- Dòng 300 / Line 300: Kiến thức bổ sung.
