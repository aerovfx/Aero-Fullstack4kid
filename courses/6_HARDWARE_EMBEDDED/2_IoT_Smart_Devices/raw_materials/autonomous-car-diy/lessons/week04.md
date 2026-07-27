# Tuần 4: GPS Module & Hệ Tọa Độ / Week 4: GPS Module & Coordinate Systems

## Mục Tiêu / Objectives

Trong tuần này, chúng ta sẽ đi sâu vào việc làm chủ module định vị toàn cầu GPS, một trong những cảm biến quan trọng nhất để chiếc xe tự hành của bạn có thể biết được nó đang ở đâu trên thế giới. Mục tiêu học tập bao gồm:
1. Hiểu rõ nguyên lý hoạt động của hệ thống GPS và vệ tinh định vị (Trilateration).
2. Giao tiếp với module GPS NEO-6M qua giao thức UART.
3. Giải mã các bản tin NMEA bằng thư viện TinyGPS++.
4. Nắm vững hệ tọa độ WGS84 và cách tính toán khoảng cách bằng công thức Haversine.
5. Lập trình tính toán góc phương vị (Heading) để điều hướng xe đến một điểm đích.

*In this week, we will dive deep into mastering the Global Positioning System (GPS) module, one of the most crucial sensors for your autonomous car to know its exact location in the world. Learning objectives include:*
*1. Understanding the operating principles of the GPS system and satellite trilateration.*
*2. Communicating with the NEO-6M GPS module via the UART protocol.*
*3. Parsing NMEA sentences using the TinyGPS++ library.*
*4. Mastering the WGS84 coordinate system and calculating distances using the Haversine formula.*
*5. Programming heading calculations to navigate the car to a destination waypoint.*

## Linh Kiện & Dụng Cụ / Components & Tools

| Tên Linh Kiện (Component) | Số lượng (Qty) | Mô tả ngắn (Description) | Giá dự kiến (Est. Price VND) |
|-------------------------------------|----------------|----------------------------------------------------------|------------------------------|
| Arduino Mega 2560 | 1 | Vi điều khiển chính với nhiều cổng Serial | 250,000 |
| Module GPS NEO-6M kèm Antenna | 1 | Cảm biến định vị toàn cầu (Global Positioning Sensor) | 120,000 |
| Module thẻ nhớ MicroSD (SPI) | 1 | Dùng để ghi log dữ liệu GPS | 35,000 |
| Thẻ nhớ MicroSD (4GB-16GB) | 1 | Lưu trữ file log tọa độ (Storage for logs) | 80,000 |
| Dây cắm DuPont cái-cái (F-F Jumper) | 20 | Dùng để nối dây tín hiệu (Signal wiring) | 15,000 |
| Dây cắm DuPont đực-cái (M-F Jumper) | 20 | Dùng để nối với breadboard (Breadboard wiring) | 15,000 |
| Test Board (Breadboard) mini | 1 | Bảng cắm test linh kiện mạch (Prototyping board) | 20,000 |
| Cáp USB type B | 1 | Kết nối Arduino với máy tính (PC connection) | 15,000 |

## Lý Thuyết / Theory

### Hệ Thống GPS Hoạt Động Như Thế Nào? / How GPS Works: Satellites & Trilateration

Hệ thống Định vị Toàn cầu (Global Positioning System - GPS) ban đầu được phát triển bởi Bộ Quốc phòng Hoa Kỳ. Nó bao gồm một mạng lưới tối thiểu 24 vệ tinh bay quanh Trái Đất trên các quỹ đạo xác định. Mỗi vệ tinh liên tục phát sóng vô tuyến chứa thông tin về thời gian chính xác (từ đồng hồ nguyên tử) và vị trí quỹ đạo của nó.

Khi module GPS NEO-6M trên mặt đất nhận được tín hiệu từ các vệ tinh, nó sẽ tính toán khoảng thời gian từ lúc tín hiệu được phát đi cho đến khi nhận được, qua đó đo được khoảng cách từ module đến vệ tinh đó. Kỹ thuật này được gọi là **Trilateration** (Đo đạc khoảng cách ba chiều, khác với Triangulation là đo góc).
Để xác định được chính xác kinh độ, vĩ độ và độ cao (3D position), module cần bắt được tín hiệu từ ít nhất 4 vệ tinh. Độ chính xác của GPS dân dụng thông thường rơi vào khoảng 2 đến 5 mét ngoài trời và khi không bị cản trở bởi các tòa nhà cao tầng.

*The Global Positioning System (GPS) was originally developed by the US Department of Defense. It consists of a network of at least 24 satellites orbiting the Earth in precise trajectories. Each satellite continuously broadcasts radio signals containing precise time (from atomic clocks) and orbital position information.*

*When the NEO-6M GPS module on the ground receives signals from these satellites, it calculates the time taken for the signal to travel, thereby determining the distance from the module to that specific satellite. This technique is called **Trilateration** (measuring distances, unlike Triangulation which measures angles).*
*To accurately determine latitude, longitude, and altitude (3D position), the module needs to lock onto signals from at least 4 satellites. The accuracy of standard civilian GPS is typically between 2 to 5 meters in open spaces with a clear sky view.*

### Giao Tiếp Với Module NEO-6M & Giao Thức UART / Communicating with NEO-6M via UART

Module NEO-6M là một trong những mạch GPS phổ biến nhất trong giới DIY nhờ chi phí rẻ và tính ổn định cao. Giao tiếp mặc định của mạch này với vi điều khiển (như Arduino) là thông qua chuẩn **UART (Universal Asynchronous Receiver-Transmitter)**.
Tốc độ baud (Baud rate) mặc định của đa số mạch NEO-6M là **9600 bps**. Do tín hiệu nối tiếp là bất đồng bộ nên không cần dây cấp xung nhịp (clock), chỉ cần nối chân TX của GPS với RX của Arduino, và RX của GPS với TX của Arduino (Tuy nhiên nếu chỉ đọc dữ liệu thì chỉ cần nối TX GPS -> RX Arduino).

*The NEO-6M module is one of the most popular GPS boards in the DIY community due to its low cost and high stability. Its default communication interface with a microcontroller (like Arduino) is via the **UART (Universal Asynchronous Receiver-Transmitter)** standard.*
*The default baud rate for most NEO-6M modules is **9600 bps**. Since serial communication is asynchronous, no clock wire is needed; simply connect the TX pin of the GPS to the RX of the Arduino, and the RX of the GPS to the TX of the Arduino (However, if only reading data, connecting TX GPS -> RX Arduino is sufficient).*

### Chuẩn Dữ Liệu NMEA / NMEA Sentences

Mỗi giây, module NEO-6M sẽ xuất ra một đoạn văn bản (text string) chứa dữ liệu định vị theo một chuẩn quy định toàn cầu gọi là NMEA 0183 (National Marine Electronics Association). Mỗi dòng văn bản (sentence) bắt đầu bằng ký tự `$` và kết thúc bằng mã kiểm tra (checksum).

Một số bản tin NMEA quan trọng bao gồm:
1. **$GPGGA (Global Positioning System Fix Data):** Chứa thông tin quan trọng nhất bao gồm thời gian, kinh độ, vĩ độ, chất lượng tín hiệu (fix quality), và số lượng vệ tinh đang kết nối.
2. **$GPRMC (Recommended Minimum Specific GPS/TRANSIT Data):** Chứa thời gian, tọa độ, và đặc biệt là vận tốc di chuyển (Speed) và góc phương vị (Heading/Course over ground) tính theo độ lệch Bắc thực (True North).
3. **$GPGSV (GPS Satellites in View):** Liệt kê chi tiết từng vệ tinh (ID, độ cao góc chiếu, tỷ số tín hiệu/nhiễu SNR).

Ví dụ một bản tin GPGGA:
`$GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,*47`

*Every second, the NEO-6M module outputs text strings containing positioning data according to a global standard called NMEA 0183 (National Marine Electronics Association). Each sentence starts with a `$` character and ends with a checksum.*

*Important NMEA sentences include:*
*1. **$GPGGA:** Contains essential fix data, time, latitude, longitude, fix quality, and number of satellites in use.*
*2. **$GPRMC:** Contains time, coordinates, and crucially, speed and heading (Course over ground) relative to True North.*
*3. **$GPGSV:** Details each satellite in view (ID, elevation angle, SNR).*

### Phân Tích NMEA Với TinyGPS++ / Parsing NMEA with TinyGPS++

Vì việc tự viết code tách chuỗi (string parsing) từ dữ liệu NMEA thô rất mất thời gian và dễ lỗi, chúng ta sẽ sử dụng thư viện **TinyGPS++** của tác giả Mikal Hart. Thư viện này nhận từng ký tự từ cổng Serial, phân tích liên tục ở chế độ nền (background), và cung cấp các hàm lấy dữ liệu dễ sử dụng như `gps.location.lat()`, `gps.speed.kmph()`, `gps.satellites.value()`.

*Because writing custom string parsing code for raw NMEA data is time-consuming and error-prone, we will use the **TinyGPS++** library by Mikal Hart. This library ingests characters from the Serial port, parses them continuously in the background, and provides user-friendly data extraction functions like `gps.location.lat()`, `gps.speed.kmph()`, and `gps.satellites.value()`.*

### Hệ Tọa Độ & Các Chuẩn Biểu Diễn / Coordinate Systems: WGS84, Decimal Degrees vs DMS

Trái đất không phải là hình cầu hoàn hảo, mà hơi dẹt ở hai cực. Hệ quy chiếu chuẩn để đo đạc cho GPS là **WGS84** (World Geodetic System 1984).
Vị trí một điểm được thể hiện qua **Vĩ độ (Latitude)** (Trục Y, từ -90 ở Nam cực đến +90 ở Bắc cực) và **Kinh độ (Longitude)** (Trục X, từ -180 đến +180, với 0 đi qua đài thiên văn Greenwich).

Có hai cách viết tọa độ phổ biến:
- **DMS (Degrees, Minutes, Seconds) - Độ, Phút, Giây:** Ví dụ: 21° 1' 36.1" N , 105° 48' 23.4" E. (Khó để vi điều khiển tính toán).
- **DD (Decimal Degrees) - Độ thập phân:** Ví dụ: 21.0267, 105.8065. Đây là định dạng Arduino và TinyGPS++ sử dụng để dễ dàng cộng trừ, tính toán khoảng cách toán học.

*The Earth is not a perfect sphere but slightly flattened at the poles. The standard reference frame for GPS is **WGS84** (World Geodetic System 1984).*
*A location is expressed via **Latitude** (Y-axis, -90 at South Pole to +90 at North Pole) and **Longitude** (X-axis, -180 to +180, with 0 passing through Greenwich).*

*Two common formats for writing coordinates:*
*- **DMS (Degrees, Minutes, Seconds):** E.g., 21° 1' 36.1" N, 105° 48' 23.4" E (Hard for MCUs to compute).*
*- **DD (Decimal Degrees):** E.g., 21.0267, 105.8065. This is the format Arduino and TinyGPS++ use for easy mathematical operations.*

## Công Thức / Formulas

Để cho xe tự hành đi từ điểm A (Hiện tại) đến điểm B (Đích - Waypoint), chúng ta cần giải quyết bài toán định vị hàng hải cơ bản: Tính Khoảng cách và Góc phương vị.
*To navigate an autonomous car from point A (Current) to point B (Target - Waypoint), we must solve basic marine navigation problems: Calculating Distance and Bearing.*

### 1. Tính Khoảng Cách: Công Thức Haversine / Distance: Haversine Formula

Trái đất cong, vì vậy ta không thể tính khoảng cách bằng định lý Pytago đơn giản trên mặt phẳng lớn. Công thức Haversine cho phép tính toán khoảng cách ngắn nhất giữa 2 điểm trên mặt cầu (Đường tròn lớn - Great-circle distance).

**Công thức chính xác (Haversine formula):**
- a = sin²(Δφ/2) + cos(φ1) × cos(φ2) × sin²(Δλ/2)
- c = 2 × atan2(√a, √(1−a))
- d = R × c

Trong đó:
- φ1, φ2: Vĩ độ điểm 1 và điểm 2 (tính bằng radian) / *Latitudes in radians*
- Δφ: Chênh lệch vĩ độ (φ2 - φ1)
- Δλ: Chênh lệch kinh độ (λ2 - λ1)
- R: Bán kính trung bình của Trái Đất (6,371,000 mét) / *Earth's mean radius in meters*

**Công thức xấp xỉ cho khoảng cách ngắn (Simplified for short distances):**
Khi khoảng cách di chuyển của xe tự hành thường nhỏ (< 5km), trái đất có thể được coi là mặt phẳng cục bộ. Ta áp dụng hệ số chuyển đổi: 1 độ kinh/vĩ tuyến tương đương khoảng 111km tại xích đạo.
- d ≈ √((Δlat × 111000)² + (Δlon × 111000 × cos(lat_trungbinh))²) (Đơn vị tính ra mét).
- *(Δlat, Δlon là chênh lệch tọa độ tính bằng độ thập phân).*

### 2. Tính Góc Phương Vị (Heading/Bearing): Công Thức Atan2 / Bearing Calculation

Góc phương vị là góc đo từ hướng Bắc thực theo chiều kim đồng hồ đến mục tiêu. Nó dao động từ 0 đến 360 độ.

- X = cos(φ2) * sin(Δλ)
- Y = cos(φ1) * sin(φ2) - sin(φ1) * cos(φ2) * cos(Δλ)
- Bearing = atan2(X, Y)

Hàm `atan2` trả về góc theo radian. Ta cần chuyển sang độ (`* 180 / PI`), và chuẩn hóa về phạm vi `[0, 360)`. Thư viện TinyGPS++ đã hỗ trợ sẵn hàm `TinyGPSPlus::courseTo(lat1, lon1, lat2, lon2)` để tính góc này.

### 3. Kiểm Tra Vị Trí Đến (Arrival Detection)

Một trong những bài toán quan trọng nhất của xe tự hành là nhận biết được "Mình đã đến đích chưa?". Do tín hiệu GPS luôn có sai số (khoảng 2-5m), nếu ta yêu cầu tọa độ xe phải TRÙNG KHỚP 100% với tọa độ đích, xe sẽ không bao giờ dừng lại. Nó sẽ chạy vòng quanh điểm đó vô tận (Hiện tượng "Orbiting").

Do vậy, chúng ta định nghĩa một **Bán kính đến (Arrival Radius)**. Nếu khoảng cách (d) từ xe đến điểm đích < Bán kính đến (ví dụ 1.5m hoặc 3.0m), xe sẽ được coi là đã đến nơi.
- `if (distance_to_target < arrival_radius) { current_waypoint++; }`

*A critical challenge in autonomous vehicles is knowing "Have I arrived?". Since GPS signals inherently have noise (2-5m error), demanding exact coordinate matching will cause the car to never stop; it will circle the target endlessly ("Orbiting" phenomenon).*
*Therefore, we define an **Arrival Radius**. If the distance to the target is less than this radius (e.g., 1.5m or 3m), the car is considered to have arrived.*

## Cấu Trúc Dữ Liệu Waypoint / Waypoint Data Structure

Để xe đi theo một lộ trình, ta cần tổ chức dữ liệu tọa độ thành các điểm (Waypoints). Trong C++, ta dùng `struct`.

```cpp
struct Waypoint {
  double lat;          // Vĩ độ (Latitude)
  double lon;          // Kinh độ (Longitude)
  const char* label;   // Tên điểm đến (Waypoint name)
  float arrival_radius;// Bán kính chấp nhận đến đích (m)
};

// Khai báo một mảng các điểm lộ trình (Route array)
Waypoint route[] = {
  {21.028511, 105.804817, "Diem Xuat Phat", 2.0},
  {21.028550, 105.804900, "Goc Cua 1", 3.0},
  {21.028600, 105.805000, "Dich Den", 2.0}
};
```

## Sơ Đồ Kết Nối / Wiring Diagram

⚠️ **Lưu ý Quan Trọng / Important Note:** Module GPS hoạt động ở mức logic 3.3V đối với chân TX/RX, nhưng module NEO-6M thường có sẵn bộ chuyển đổi áp (Level Shifter) nên có thể cắm trực tiếp vào Arduino Mega 5V. Luôn kiểm tra tài liệu của mạch bạn mua.
*(GPS modules operate at 3.3V logic for TX/RX, but standard NEO-6M breakout boards usually have onboard Level Shifters, making them 5V safe for Arduino Mega. Always check your board's datasheet.)*

Vì Arduino Mega có 4 cổng Serial phần cứng (Hardware Serial), ta dùng **Serial1** (Chân 18, 19) cho GPS để đảm bảo tốc độ cao và ổn định, thay vì dùng SoftwareSerial. Dành cổng `Serial` (Chân 0, 1) để in dữ liệu ra máy tính qua USB.

*Since Arduino Mega has 4 Hardware Serial ports, we will use **Serial1** (Pins 18, 19) for the GPS to ensure high speed and stability, rather than using SoftwareSerial. We reserve the `Serial` port (Pins 0, 1) for debugging via USB to the PC.*

### Bảng Nối Dây (Wiring Table)

| Module GPS NEO-6M | Arduino Mega 2560 | Chức Năng (Function) |
|-------------------|-------------------|---------------------------------------------------|
| VCC | 5V | Nguồn cấp (Power). Module thường có regulator 3.3v |
| GND | GND | Ground chung (Common ground) |
| TX | RX1 (Pin 19) | Chuyền dữ liệu từ GPS vào Arduino (Data to MCU) |
| RX | TX1 (Pin 18) | Gửi dữ liệu cấu hình từ MCU vào GPS (Config data) |

## Thực Hành / Hands-On

### Bước 1: Kết Nối Cáp & Cài Đặt Thư Viện / Step 1: Wiring & Library Setup
1. Đảm bảo rút nguồn điện khỏi Arduino trước khi đấu dây. Cắm dây theo bảng "Sơ Đồ Kết Nối" ở trên.
2. Nối ăng-ten sứ đi kèm vào cổng IPEX/U.FL trên mạch GPS. Gắn ăng-ten ra vị trí thoáng, mặt hình vuông hướng thẳng lên trời (tránh kim loại che khuất).
3. Mở Arduino IDE. Vào **Sketch -> Include Library -> Manage Libraries**. Tìm "TinyGPSPlus" của Mikal Hart. Bấm Install.

*1. Unplug the Arduino from power before wiring. Wire according to the table above.*
*2. Attach the ceramic antenna to the IPEX/U.FL connector. Place the antenna in an open space, facing the sky directly (avoid metal obstructions).*
*3. Open Arduino IDE. Go to **Sketch -> Include Library -> Manage Libraries**. Search for "TinyGPSPlus" by Mikal Hart. Click Install.*

### Bước 2: Viết Code Đọc Dữ Liệu GPS & Kiểm Tra Khởi Tạo / Step 2: Write GPS Reading Code

⚠️ **Cảnh Báo An Toàn / Safety Warning:** Lần đầu bật nguồn (Cold Start), GPS có thể mất từ 2 đến 10 phút để tải bảng Lịch Thiên Văn (Almanac & Ephemeris data) từ vệ tinh về. Trong thời gian này, đèn LED PPS trên module sẽ TẮT. Chỉ khi bắt được từ 4 vệ tinh trở lên và chốt vị trí (3D Fix), đèn LED PPS sẽ NHẤP NHÁY mỗi giây 1 lần. Hãy kiên nhẫn mang ra ban công hoặc ngoài trời!

*⚠️ **Safety Warning:** On the first power-up (Cold Start), the GPS may take 2 to 10 minutes to download Almanac and Ephemeris data from satellites. During this time, the PPS LED will be OFF. Only when it gets a 3D Fix (>= 4 satellites), the PPS LED will BLINK once per second. Be patient and take it outdoors!*

## Code Arduino

```cpp
/*
 * Week 4: GPS Module & Waypoint Navigation Practice
 * Author: Course Instructor
 * Board: Arduino Mega 2560
 * Dependencies: TinyGPSPlus library
 */

#include <TinyGPS++.h>

// Khởi tạo đối tượng TinyGPSPlus / Initialize TinyGPSPlus object
TinyGPSPlus gps;

// Khai báo chân sử dụng Serial1 của Mega / Using Hardware Serial1
#define GPS_BAUD_RATE 9600

// Struct lưu waypoint mục tiêu (Target waypoint struct)
struct Waypoint {
  double lat;
  double lon;
  const char* label;
  float arrival_radius; // meters
};

// Mục tiêu giả định (Target coordinates) - Thay đổi theo vị trí của bạn
// Target example - Change to your actual location coordinates
Waypoint target = {21.028511, 105.804817, "Diem Test", 2.0};

void setup() {
  // Mở Serial monitor giao tiếp với máy tính ở tốc độ 115200
  // Open Serial to PC at 115200
  Serial.begin(115200);
  
  // Mở giao tiếp với GPS ở tốc độ 9600 qua Serial1 (Chân 18,19)
  // Open Serial1 to GPS at 9600
  Serial1.begin(GPS_BAUD_RATE);
  
  Serial.println(F("--- He Thong GPS Xe Tu Hanh Khoi Dong ---"));
  Serial.println(F("--- Autonomous Car GPS System Started ---"));
  Serial.println(F("Dang doi tin hieu ve tinh (Waiting for satellite fix)..."));
}

void loop() {
  // Liên tục đọc ký tự từ Serial1 và đẩy vào thư viện TinyGPS++
  // Continuously read characters from Serial1 and feed to TinyGPS++
  while (Serial1.available() > 0) {
    char c = Serial1.read();
    // Hàm encode trả về true nếu vừa phân tích xong một câu NMEA hoàn chỉnh hợp lệ
    // encode returns true when a valid NMEA sentence has been fully parsed
    if (gps.encode(c)) {
      processGPSData();
    }
  }

  // Cảnh báo nếu sau 5 giây không nhận được byte nào từ Serial1
  // Warning if no characters received for 5 seconds (wiring error)
  if (millis() > 5000 && gps.charsProcessed() < 10) {
    Serial.println(F("LOI: Khong nhan duoc du lieu GPS. Kiem tra day noi TX/RX!"));
    Serial.println(F("ERROR: No GPS data received. Check TX/RX wiring!"));
    while(true); // Stop execution
  }
}

// Hàm in dữ liệu và tính toán khoảng cách/góc
// Function to print data and compute distance/bearing
void processGPSData() {
  // Chỉ xử lý nếu vị trí đã được cập nhật hợp lệ (isValid)
  if (gps.location.isValid()) {
    
    double currentLat = gps.location.lat();
    double currentLon = gps.location.lng();
    
    Serial.print(F("Toa do hien tai (Current Pos): "));
    Serial.print(currentLat, 6); // In ra 6 chữ số thập phân (6 decimal places)
    Serial.print(F(", "));
    Serial.println(currentLon, 6);
    
    Serial.print(F("So ve tinh (Satellites): "));
    Serial.println(gps.satellites.value());
    
    // Tính toán khoảng cách tới điểm mục tiêu bằng thư viện
    // Calculate distance to target using built-in function (Haversine inside)
    double distanceToTarget = TinyGPSPlus::distanceBetween(
      currentLat, currentLon, 
      target.lat, target.lon
    );
    
    // Tính toán góc phương vị tới mục tiêu
    // Calculate heading/course to target
    double courseToTarget = TinyGPSPlus::courseTo(
      currentLat, currentLon, 
      target.lat, target.lon
    );
    
    Serial.print(F("Khoang cach den "));
    Serial.print(target.label);
    Serial.print(F(" (Distance): "));
    Serial.print(distanceToTarget);
    Serial.println(F(" met."));
    
    Serial.print(F("Goc phuong vi (Bearing): "));
    Serial.print(courseToTarget);
    Serial.println(F(" do (degrees)."));

    // Kiểm tra trạng thái tới đích
    // Check arrival status
    if (distanceToTarget <= target.arrival_radius) {
      Serial.println(F(">> DA TOI DICH! (ARRIVED AT DESTINATION!) <<"));
    }
    
    Serial.println(F("-----------------------------------"));
  }
}
```

## Giải Pháp Nâng Cao Chất Lượng Dữ Liệu GPS (Improving Accuracy)

Tín hiệu GPS có thể bị nhiễu. Có vài phương pháp thực tế để cải thiện độ mượt cho thuật toán điều hướng của xe tự hành:

1. **Bộ lọc trung bình (Moving Average Filter):** Cộng dồn N giá trị vĩ độ, kinh độ liên tiếp và chia lấy trung bình để giảm nhiễu nhảy điểm ngẫu nhiên. (Tuy nhiên sẽ gây trễ thời gian - delay).
2. **Kiểm tra HDOP (Horizontal Dilution of Precision):** Trong bản tin NMEA có chứa chỉ số HDOP. Giá trị HDOP càng thấp (vd: < 2.0) chứng tỏ tín hiệu càng đáng tin cậy do góc phân bố của vệ tinh tốt. Có thể thiết lập code: Nếu HDOP > 3.0, tạm bỏ qua dữ liệu tọa độ đó để tránh xe bị đi chệch hướng.

*GPS signals can be noisy. Practical methods to improve navigation smoothness:*
*1. **Moving Average Filter:** Average N consecutive coordinate readings to smooth out random jumps (Trade-off: introduces latency).*
*2. **Checking HDOP:** NMEA includes HDOP. Lower is better (< 2.0). If HDOP > 3.0, ignore the data to prevent the car from making erratic turns based on bad fixes.*

## Câu Hỏi Thảo Luận / Discussion

1. [VI] Tại sao module GPS có thể đo được vị trí trên Trái Đất mà không cần kết nối mạng Internet hay Wifi?
   [EN] Why can a GPS module determine its global position without Internet or Wi-Fi?
2. [VI] Nếu chúng ta lắp xe tự hành có trần làm bằng kim loại, liệu ăng-ten GPS đặt bên trong gầm xe có hoạt động được không? Giải thích.
   [EN] If our autonomous car has a metal roof, will the GPS antenna placed underneath it work? Explain.
3. [VI] Baudrate 9600 mất bao lâu để gửi xong 1 byte? Việc phân tích dữ liệu Serial chậm có ảnh hưởng tới vòng lặp điều khiển xe (control loop) không?
   [EN] How long does 9600 baudrate take to send 1 byte? Will slow serial parsing affect the car's control loop?
4. [VI] Nếu tăng bán kính đến đích (arrival_radius) lên 10m, xe tự hành sẽ gặp vấn đề gì trong môi trường đường đua chật hẹp?
   [EN] If we increase the arrival radius to 10m, what problems will the autonomous car face in a tight race track?
5. [VI] Tại sao không tính trực tiếp góc phương vị bằng la bàn từ (Compass/Magnetometer) thay vì chỉ dùng dữ liệu chuyển động từ GPS? Phân tích ưu nhược điểm.
   [EN] Why not just use a magnetic compass for heading instead of relying on GPS course? Analyze pros and cons.

## Bài Về Nhà / Homework

### Bài Tập Lý Thuyết (Theory Assignment)
Sử dụng Google Maps, hãy đánh dấu (Pin) 3 điểm xung quanh nhà bạn, trích xuất tọa độ dạng Decimal Degrees. Sử dụng máy tính cầm tay hoặc Excel, tự tay áp dụng công thức xấp xỉ khoảng cách để tính ra số mét giữa 3 điểm đó. Xác minh lại với công cụ đo khoảng cách của Google Maps.

*Using Google Maps, drop pins on 3 locations around your house and extract their Decimal Degree coordinates. Using a calculator or Excel, manually apply the simplified distance formula to calculate the distances between them in meters. Verify your results with the Google Maps measure tool.*

### Mini-Project Thực Hành (Hands-on Mini-Project): Hệ Thống Đăng Nhập Hành Trình (GPS Data Logger)
Kết hợp module GPS ở bài này và Module thẻ nhớ SD Card (Sử dụng SPI) từ bài học tuần trước:
1. Gắn GPS, SD Card lên breadboard kết nối Mega 2560.
2. Viết chương trình: Mỗi 2 giây, nếu module GPS "khóa" (fix) được tọa độ, ghi một dòng vào thẻ nhớ với định dạng `thoi_gian,vi_do,kinh_do,van_toc`. Cầm hệ thống đi bộ một vòng quanh khu vực bạn ở.
3. Gỡ thẻ nhớ, cắm vào máy tính và chuyển đổi file log thành file CSV để vẽ lại đường đi trên Google Earth hoặc trang `gpsvisualizer.com`.

*Combine this week's GPS module with last week's SD Card module:*
*1. Wire GPS and SD Card modules to the Arduino Mega.*
*2. Write a program: Every 2 seconds, if the GPS has a fix, write a line to the SD card formatted as `time,latitude,longitude,speed`. Walk around your neighborhood with the setup.*
*3. Read the SD card on your PC and plot your logged path on Google Earth or `gpsvisualizer.com`.*

## Đánh Giá / Assessment Rubric

| Tiêu chí (Criteria) | Kém (Poor - 0đ) | Khá (Fair - 5đ) | Tốt (Good - 8đ) | Xuất sắc (Excellent - 10đ) |
|-----------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|-----------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| Lắp ráp phần cứng (Hardware Assembly) | Sai chân, đấu nhầm VCC/GND, không chạy. | Lắp đúng chân nguồn, TX/RX nối chưa chuẩn. | Mạch chạy tốt, ăng-ten được cố định đúng cách. | Mạch gọn gàng, dây rút chắc chắn, hàn hoặc nối jack chuyên nghiệp, không lỏng lẻo. |
| Hiểu về NMEA & Code (NMEA & Code Understanding) | Không phân biệt được các định dạng dữ liệu NMEA. | Hiểu NMEA nhưng chưa biết cách tùy chỉnh code TinyGPS. | Đọc và giải thích được mã NMEA, ứng dụng tốt hàm TinyGPS. | Có khả năng code thêm bộ lọc trung bình hoặc kiểm tra HDOP để loại nhiễu. |
| Toán Navigation (Navigation Math) | Không áp dụng được công thức tính khoảng cách. | Áp dụng thư viện TinyGPS nhưng không hiểu thuật toán nền. | Hiểu nguyên lý Haversine và biết cách đổi góc Bearing. | Hiểu rõ về sai số của hệ tọa độ cầu và biết viết hàm tự tính thay vì dựa 100% vào thư viện. |
| Mini Project Data Log (Project Execution) | Chạy code ví dụ không thành công, không đọc được GPS. | Có dữ liệu in ra Serial nhưng chưa lưu được thẻ nhớ. | Lưu được log, nhưng file dễ bị lỗi khi tắt nguồn. | Chạy mượt mà trọn vẹn, vẽ được bản đồ trên máy tính từ file log chính xác. |

---
*Chúc các bạn hoàn thành xuất sắc dự án Tuần 4! Mọi thắc mắc vui lòng đặt câu hỏi trên diễn đàn khóa học.*
*Good luck with your Week 4 project! Post any questions on the course forum.*
