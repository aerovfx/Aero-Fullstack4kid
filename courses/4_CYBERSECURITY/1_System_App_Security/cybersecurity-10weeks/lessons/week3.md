###### [CEH V10](https://blog.crfnetwork.com/category/security/ceh-v10/)

# \[CEH-Module 4\] Phần 1: Enumeration – Khái niệm & Phân loại

## Tóm tắt chủ đề

Trong những quá trình trước như **FOOTPRINTING** & **SCANNING**, ta đã hiểu được cách thu thập thông tin từ bất kỳ tổ chức, trang web hoặc một mạng lưới nào đó. Chúng ta cũng đã thảo luận về một vài công cụ có thể giúp ích trong việc thu thập thông tin về mục tiêu cần tìm.

Bây giờ chúng ta sẽ tiến lại gần mục tiêu để quan sát và thu thập các thông tin cụ thể. Những thông tin này rất nhạy cảm, như thông tin mạng lưới, tài nguyên mạng lưới, các đường dẫn, CNMP, DNS và các thông tin liên quan đến giao thức, người dùng hay thông tin của một nhóm nào đó, v..v… Các thông tin này là cần thiết để truy cập vào hệ thống.

## Khái niệm

### Enumeration (Điều Tra)

Trong giai đoạn **Điều Tra**, kẻ xâm nhập khởi tạo các kết nối hoạt động với mục tiêu. Với kết nối hoạt động này, các truy vấn trực tiếp được tạo ra để nhận được nhiều thông tin hơn. Những thông tin này giúp xác định các điểm yếu của hệ thống. Khi kẻ tấn công phát hiện ra các điểm yếu, chúng có thể truy cập trái phép bằng cách sử dụng thông tin được thu thập này để chiếm đoạt tài sản.

Thông tin bị điều tra trong giai đoạn này là:

- Thông tin định tuyến

- Thông tin SNMP

- Thông tin DNS

- Tên máy

- Thông tin người dùng

- Thông tin nhóm

- Ứng dụng và biểu ngữ

- Thông tin chia sẻ qua mạng

- Tài nguyên mạng

Trong các giai đoạn trước, chúng ta không cần quá quan tâm đến bất kỳ vấn đề pháp lý nào. Nhưng sử dụng các công cụ cho giai đoạn điều tra có thể **vượt qua ranh giới pháp lý** và **có thể bị quy tội** thành đồng bọn của kẻ tấn công. Bạn cần phải được cho phép để thực hiện các hoạt động này.



## Kỹ thuật điều tra (Techniques for Enumeration)

### Sử dụng Email ID (Enumeration Using Email ID)

Việc trích xuất thông tin bằng ID email có thể cung cấp thông tin hữu ích như tên người dùng, tên miền, v.v. Địa chỉ email chứa tên người dùng và tên miền trong đó.

### Sử dụng mật khẩu mặc định (Enumeration using Default Password)

Một cách khác để điều tra là sử dụng mật khẩu mặc định. Mọi thiết bị và phần mềm đều có thông tin đăng nhập và cài đặt mặc định. Cài đặt và cấu hình mặc định này được khuyến nghị thay đổi ngay khi người dùng có sản phẩm.

Một số (thật ra là hầu hết) người dùng tiếp tục sử dụng mật khẩu và cài đặt mặc định. Điều này dễ dàng cho kẻ tấn công truy cập trái phép bằng thông tin xác thực mặc định. Phát hiện cài đặt mặc định, cấu hình và mật khẩu của một dòng thiết bị không phải là vấn đề lớn.

### Sử dụng SNMP (Enumeration using SNMP)

Việc **điều tra bằng SNMP** là một quá trình thu thập thông tin thông qua **SNMP**. Các kẻ tấn công sử dụng các chuỗi cộng đồng mặc định hoặc đoán chuỗi để trích xuất thông tin của một thiết bị. Giao thức **SNMP** được phát triển để cho phép quản trị viên quản lý thiết bị (máy chủ, bộ định tuyến, thiết bị chuyển mạch, máy trạm trên mạng IP).

Nó cho phép quản trị viên mạng quản lý hiệu suất mạng của mạng tìm, khắc phục sự cố và giải quyết các vấn đề về mạng, thiết kế và lập kế hoạch phát triển mạng. **SNMP** là một giao thức giữa các tầng ứng dụng. Nó làm nhiệm vụ liên lạc giữa các nhà quản lý và các đại lý.

Hệ thống SNMP bao gồm ba yếu tố:

- Trình quản lý SNMP (SNMP manager)

- Các tác nhân SNMP (nút được quản lý) (SNMP agents (managed node))

- Cơ sở thông tin quản lý (MIB) (Management Information Base (MIB))

### Tấn công dò mật khẩu trên thư mục hoạt động (Brute Force Attack on Active Directory)

**Active Directory (AD)** cung cấp lệnh và kiểm soát tập trung của người dùng miền, máy tính và máy in mạng. Nó hạn chế quyền truy cập vào nguồn mạng chỉ cho người dùng và máy tính được xác định. AD là một mục tiêu lớn, một nguồn thông tin lớn cho kẻ tấn công.

Tấn công **Brute Force** để khai thác, hoặc tạo truy vấn đến các dịch vụ **LDAP** được thực hiện để thu thập thông tin như tên người dùng, địa chỉ, thông tin xác thực, thông tin đặc quyền, v.v.

### Thông qua chuyển vùng DNS (Enumeration through DNS Zone Transfer)

Điều tra qua **quá trình chuyển vùng DNS** bao gồm trích xuất thông tin như định vị máy chủ DNS, bản ghi DNS, các thông tin liên quan đến mạng có giá trị khác như tên máy chủ, địa chỉ IP, tên người dùng, v…v…

Chuyển vùng là quá trình cập nhật các máy chủ DNS. Tệp vùng mang thông tin có giá trị được truy xuất bởi kẻ tấn công. **UDP 53** được sử dụng cho các yêu cầu DNS từ các máy chủ DNS. **TCP 53** được sử dụng để chuyển vùng DNS đảm bảo việc chuyển giao.

Các dịch vụ và cổng mạng (Services and Ports to Enumerate):

![](images/image20.png){width="4.805555555555555in" height="3.111111111111111in"}

## Điều tra SNMP (SNMP Enumeration)

### SNMP Enumeration

**SNMP Enumeration** là một kỹ thuật điều tra sử dụng giao thức quản lý mạng được sử dụng rộng rãi nhất SNMP. Trong điều tra **SNMP**, tài khoản người dùng và thông tin thiết bị mục tiêu được sử dụng SNMP. **SNMP** yêu cầu chuỗi cộng đồng để xác thực trạm quản lý.

![](images/image28.png){width="6.267716535433071in" height="2.875in"}

Chuỗi cộng đồng này ở các dạng khác trong các phiên bản khác nhau của **SNMP**. Sử dụng chuỗi cộng đồng mặc định, bằng cách đoán chuỗi cộng đồng, kẻ tấn công trích xuất thông tin như máy chủ, thiết bị, chia sẻ, thông tin mạng và nhiều hơn thế nữa bởi truy cập trái phép.

![](images/image3.png){width="6.027777777777778in" height="2.5in"}

### Giao thức quản lí mạng đơn giản (Simple Network Management Protocol)

Trong môi trường sản xuất, nơi hàng nghìn thiết bị mạng như bộ định tuyến, thiết bị chuyển mạch, máy chủ và thiết bị đầu cuối được triển khai, **Network Operation Center** (NOC) đóng một vai trò rất quan trọng. Hầu hết mọi nhà cung cấp đều hỗ trợ **giao thức quản lý mạng đơn giản** (SNMP).

Ban đầu, triển khai **SNMP** yêu cầu trạm quản lý thu thập thông tin về các khía cạnh khác nhau của thiết bị mạng. Tiếp theo, cấu hình và hỗ trợ phần mềm bằng chính các thiết bị mạng. Cấu hình như loại mã hóa và được chia nhỏ chạy trên phần mềm của trạm quản lý phải khớp với cài đặt **SNMP** trên thiết bị mạng.

Ba thành phần có liên quan đến việc triển khai **SNMP** trong một mạng là:

#### Trình quản lý SNMP (SNMP Manager)

Một ứng dụng phần mềm chạy trên trạm quản lý để hiển thị thông tin được thu thập từ các thiết bị mạng một cách tinh tế và có thể triển khai. Phần mềm **SNMP** thường được sử dụng là **PRTG, Solarwinds, OPManager**, v.v..

#### Quản lý SNMP (SNMP Agent)

Phần mềm đang chạy trên các nút mạng có các thành phần khác nhau cần phải được theo dõi. Ví dụ sử dụng **CPU/RAM**, trạng thái giao diện, v.v. Số cổng **UDP** 161 được sử dụng để liên lạc giữa quản lý **SNMP** và trình quản lý **SNMP**.

#### Cơ sở thông tin quản lý (Management Information Base)

**MIB** là viết tắt của **Management Information Base** và là một tập hợp các thông tin được tổ chức theo cấp bậc trong một cơ sở dữ liệu ảo. Chúng được truy cập bằng giao thức SNMP

Có hai loại MIB:

-   Scaler (**đối tượng vô hướng**): Định nghĩa một cá thể đối tượng đơn lẻ

-   Tabular (**đối tượng dạng bảng**): Định nhiều nhiều cá thể đối tượng liên quan

**MIB** là tập hợp các định nghĩa, xác định các thuộc tính của đối tượng được quản lý trong thiết bị được quản lý. Bộ sưu tập thông tin này như mô tả các đối tượng mạng được tổ chức và quản lý theo thứ bậc trong **MIB** và sử dụng **SNMP** được giải quyết thông qua bộ nhận dạng đối tượng (OID).

Các định danh đối tượng (OID) bao gồm các đối tượng **MIB** như chuỗi, địa chỉ, số lượt truy cập, cấp truy cập và thông tin khác.

Ví dụ: các đối tượng điển hình để theo dõi trên máy in là các trạng thái hộp mực khác nhau và có thể là số lượng tệp đã in và trên chuyển đổi , các đối tượng tiêu biểu quan tâm là lưu lượng đến và đi cũng như tốc độ mất gói tin hoặc số gói được gửi đến địa chỉ quảng bá.

Các phiên bản SNMP có sẵn là:

![](images/image18.png){width="5.888888888888889in" height="4.666666666666667in"}

### Công cụ Điều tra SNMP (SNMP Enumeration Tool)

#### OpUtils

**OpUtils** là một công cụ theo dõi mạng và khắc phục sự cố cho các kỹ sư mạng. **OpUtils** được cung cấp bởi Manage Engines, hỗ trợ các công cụ cho **Switch Port & IP Address Management**. Nó giúp các kỹ sư mạng quản lý thiết bị và không gian địa chỉ IP một cách dễ dàng. Nó thực hiện giám sát mạng, phát hiện xâm nhập thiết bị lừa đảo, giám sát sử dụng băng thông và hơn thế nữa.

Tải trên: [https://www.manageengine.com](https://www.manageengine.com/)

#### SolarWinds Engineer’s Toolset

**Bộ công cụ của kỹ sư SolarWinds** là công cụ quản trị mạng cung cấp hàng trăm công cụ mạng để phát hiện và khắc phục sự cố cũng như chẩn đoán mạng.

Tải trên: [https://www.solarwinds.com](https://www.solarwinds.com/)

Một số tính năng nổi bật:

-   Phát hiện mạng tự động

-   Theo dõi và cảnh báo trong thời gian thực

-   Khả năng chẩn đoán công hiệu

-   Cải thiện an ninh mạng

-   Cấu hình và quản trị Registry

-   Giám sát địa chỉ IP và phạm vi DHCP

## Điều tra LDAP (LDAP Enumeration)

### Giao thức truy cập thư mục hạng nhẹ (LDAP)

**LDAP** (Lightweight Directory Access Protocol) là một giao thức Internet chuẩn mở. **LDAP** dùng để truy cập và duy trì các dịch vụ thông tin thư mục phân tán trong một cấu trúc phân cấp hợp lý. Dịch vụ thư mục đóng một vai trò quan trọng bằng cách cho phép chia sẻ thông tin như người dùng, hệ thống, mạng, dịch vụ, v.v. trên toàn mạng.

**LDAP** cung cấp một trung tâm để lưu trữ tên người dùng và mật khẩu. Các ứng dụng và dịch vụ kết nối với máy chủ **LDAP** để xác thực người dùng. Máy khách khởi tạo một phiên **LDAP** bằng cách gửi một yêu cầu hoạt động tới **Directory System Agent** (DSA) bằng cổng **TCP** 389. Giao tiếp giữa Client và Server sử dụng **Basic Encoding Rules** (BER).

Các dịch vụ thư mục sử dụng LDAP bao gồm:

-   Active Directory

-   Open Directory

-   Oracle iPlanet

-   Novell eDirectory

-   OpenLDAP

### Công cụ điều tra LDAP (LDAP Enumeration Tool):

Công cụ điều tra LDAP có thể được sử dụng để điều tra các hệ thống và dịch vụ hỗ trợ **LDAP** bao gồm:

![](images/image23.png){width="5.694444444444445in" height="5.888888888888889in"}

**Rất nhiều người dùng Windows thậm chí chưa bao giờ chạm vào Command Prompt hay còn gọi là CMD. Với các hệ điều hành tiên tiến hiện nay, thật dễ để sử dụng máy tính mà không cần lo lắng về việc nhập các lệnh văn bản trong Command Prompt.**

![](images/image29.jpg){width="6.267716535433071in" height="3.138888888888889in"}

Tuy nhiên, bạn cũng nên làm quen với Command Prompt trong Windows. Nó giúp bạn tương tác với hệ điều hành nhiều hơn và có thể làm nhiều tác vụ hữu ích hơn. Vậy nên, trong bài viết này, mình sẽ cùng các bạn làm quen với Command Prompt nhé.

## CMD là gì?

Command Prompt, tên chính thức là Windows Command Processor và thường được viết tắt là CMD, là giao diện dòng lệnh dành cho hệ điều hành Windows. Giao diện dòng lệnh là một cách tương tác trực tiếp với máy tính bằng các lệnh văn bản.

Những ngày đầu sơ khai của kỉ nguyên máy tính, khi bạn phải nhập các lệnh vào một thiết bị đầu cuối để thực thi các quy trình. Các hệ điều hành PC đời đầu, như MS-DOS, hoạt động độc quyền thông qua giao diện dòng lệnh. Không có con trỏ chuột, quản lý cửa sổ hoặc các phần tử giao diện người dùng đồ họa (GUI) khác như chúng ta thường thấy ngày nay.

![cmd.exe – Wikipedia tiếng Việt](images/image26.png){width="6.267716535433071in" height="3.2083333333333335in"}

Một thuật ngữ khác mà bạn nên biết là “shell”, được sử dụng để mô tả một chương trình cho phép người dùng đưa ra các lệnh cho máy tính. Vì vậy, giao diện dòng lệnh, cũng như GUI, đều là shell.

## Cách mở CMD trong Windows 10

Có một số cách để mở Command Prompt trong Windows. Dưới đây là những cách phổ biến nhất:

**Cách 1:** Nhập “command prompt” vào Start menu để tìm kiếm. Bạn cũng có thể nhập “cmd” (tên viết tắt của Command Prompt)

**Cách 2:** Nhấn Win + R để mở hộp Run, sau đó gõ “cmd” và nhấn Enter để mở hộp.

**Cách 3:** Nhấn Win + X (hoặc nhấp chuột phải vào Start menu) và chọn Command Prompt. Tùy thuộc vào cài đặt Windows của bạn, nên bạn có thể sẽ thấy Windows PowerShell. PowerShell mạnh hơn Command Prompt nhưng vẫn chạy tất cả các lệnh tương tự như nhau.

![Hướng dẫn làm quen CMD cơ bản cho người mới 25](images/image1.jpg){width="6.267716535433071in" height="3.3472222222222223in"}

## Khái niệm cơ bản về Command Prompt

Khi mở cửa sổ Command Prompt, bạn sẽ thấy một số thông tin cơ bản về phiên bản Windows hiện tại của mình. Sau đó, bạn sẽ thấy một dòng như sau:

`C:\Users\Username>`

Đây là vị trí thư mục hiện tại của bạn. Bất kỳ lệnh nào bạn chạy dựa vào vị trí (chẳng hạn như xóa tệp) sẽ diễn ra trong thư mục này. Các lệnh CMD khác chung chung hơn và không phụ thuộc vào vị trí thư mục hiện tại.

Điều quan trọng bạn cần biết là khi làm việc trong Command Prompt, bạn phải nhập các lệnh chính xác. Vì bạn đang phát lệnh trực tiếp đến máy tính của mình, nó sẽ không hiểu nếu bạn nhập sai.

Dòng lệnh sẽ chạy bất cứ lệnh nào bạn nhập, miễn là nó hợp lệ. Vì vậy, bạn nên luôn kiểm tra kỹ những gì bạn sắp làm trước khi bắt đầu.

## Các lệnh cơ bản về Command Prompt dành cho người mới bắt đầu

Có rất nhiều lệnh Command Prompt và hầu hết chúng không trực quan cho người mới. Học các lệnh này khá mất thời gian, vì vậy tốt nhất bạn nên từ từ xây dựng kiến thức của mình hơn là học nhảy.

## Cách xem hướng dẫn lệnh

![](images/image17.png){width="6.267716535433071in" height="4.208333333333333in"}

Lệnh **help** sẽ liệt kê nhiều lệnh phổ biến mà bạn có thể sử dụng. Lệnh này cũng sẽ giải thích từng lệnh cho các bạn sử dụng nên không cần phải tốn thời gian tìm hiêu nữa.

Nếu bạn muốn biết thêm thông tin cụ thể về cách sử dụng một lệnh nhất định, hãy nhập lệnh đó và thêm **/?**. Tùy chọn này sẽ cung cấp cho bạn nhiều trợ giúp hơn, cùng với các tùy chọn bổ sung để sửa đổi cách lệnh hoạt động.

`C:\Users\Username>help`

`C:\Users\Username>[lệnh] /?`

## Liệt kê và thay đổi thư mục

Để thay đổi vị trí thư mục hiện tại, hãy sử dụng **cd** (viết tắt của **change directory**) theo sau là thư mục bạn muốn truy cập.

Ví dụ, để di chuyển đến thư mục Desktop từ thư mục mặc định, bạn sẽ nhập **cd Desktop**. Và để di chuyển ra thư mục cha, hãy sử dụng phím lệnh **cd ..**

Lệnh **dir**, viết tắt của **directory**, sẽ liệt kê nội dung của thư mục hiện tại. Như đã đề cập trước đó, bạn có thể kiểm tra vị trí thư mục hiện tại bằng cách nhìn vào lệnh đầu tiên bên trái.

![](images/image21.png){width="6.267716535433071in" height="4.055555555555555in"}

Với ổ đĩa ta sử dụng **D:** hoặc **E:** (chỉ có tên ổ và dấu 2 chấm) hoặc trở về lập tức đầu ổ hiện tại thì **cd \\**

### Tạo, xóa file và folder

Sử dụng **mkdir \[tên folder\]** hoặc **md \[tên folder\]** để tạo folder mới. Ví dụ: **md 123** sẽ tạo một folder có tên là 123

![](images/image7.png){width="4.486111111111111in" height="1.7361111111111112in"}

Tương tự, **rmdir \[tên folder\]** hoặc **rm \[tên folder\]** sẽ xóa một folder, nhưng chỉ xoá folder trống.

Với file, xoá file sẽ dùng lệnh **del \[tên file\]** hoặc **rm \[tên file\]**

### Dọn dẹp CMD

Nếu có quá nhiều thứ lộn xộn trên màn hình Command Prompt, hãy nhập **cls** để xóa màn hình. Và nếu có một lệnh đang chạy mà bạn muốn hủy, hãy nhấn Ctrl + C để kết thúc lệnh đó.

### Lệnh kiểm tra mạng

Một số lệnh Command Prompt hữu ích nhất liên quan đến mạng. Các lệnh như **ping** cho phép bạn xem liệu máy tính của bạn có thể kết nối tới trang web không và mất bao lâu. Trong khi đó, lệnh **ipconfig** cho phép bạn xem tổng quan mạng của kết nối hiện tại (ví dụ địa chỉ ip)

![](images/image10.png){width="5.861111111111111in" height="3.2222222222222223in"}

Bây giờ bạn đã biết những lệnh cơ bản trong Command Prompt. Một số tác vụ, chẳng hạn như quản lý tệp và thư mục, bạn có thể sẽ cảm thấy rắc rối nếu đã quen dùng GUI. Nhưng đối với các tác vụ khác, như kiểm tra địa chỉ IP của bạn, chạy lệnh CMD sẽ nhanh và thuận tiện hơn nhiều so với việc sử dụng GUI.

Mặc dù hầu hết các lệnh CMD dành riêng cho môi trường Windows, nhưng Windows 10 hiện cũng cho phép bạn chạy Bash shell được sử dụng bởi Linux, macOS và nhiều hệ điều hành khác bằng WSL.

## Điều tra NTP (NTP Enumeration)

### Giao thức thời gian mạng (NTP)

**NTP** (Network Time Protocol) được sử dụng trong mạng để đồng bộ hóa đồng hồ trên máy chủ và thiết bị mạng. NTP là một giao thức quan trọng, như dịch vụ thư mục, thiết bị mạng và máy chủ dựa trên cài đặt đồng hồ cho mục đích đăng nhập và ghi nhật ký để lưu giữ hồ sơ các sự kiện.

**NTP** giúp các sự kiện tương quan bởi các bản ghi hệ thống thời gian được nhận bởi các máy chủ **Syslog**. **NTP** sử dụng cổng **UDP** 123 và toàn bộ giao tiếp của nó dựa trên thời gian quốc tế (UTC).

**NTP** sử dụng thuật ngữ được gọi là tầng để mô tả khoảng cách giữa máy chủ **NTP** và thiết bị. Nó giống như số **TTL** làm giảm mỗi hop một gói đi qua. Stratum (mỗi tầng) bắt đầu từ một, tăng theo từng hop. Ví dụ, nếu chúng ta thấy số tầng là 10 trên bộ định tuyến cục bộ, có nghĩa là máy chủ **NTP** cách 9 bước nhảy.

Bảo vệ **NTP** cũng là một khía cạnh quan trọng vì kẻ tấn công có thể thay đổi thời gian ở vị trí đầu tiên để đánh lừa các nhóm pháp y điều tra và tương quan các sự kiện để tìm nguyên nhân gốc rễ của cuộc tấn công.

### Xác thực NTP (NTP Authentication)

**NTP** phiên bản 3 (NTP v3) và các phiên bản sau này hỗ trợ kỹ thuật xác thực mật mã giữa các đồng nghiệp **NTP**. Xác thực này có thể được sử dụng để giảm thiểu một cuộc tấn công.

Ba lệnh được sử dụng trên trình chủ và trình khách NTP là:

`Router(config)# ntp authenticate`

`Router(config)# ntp authentication-key key-number md5 key-value`

`Router(config)# ntp trusted-key key-number`

Nếu không có cấu hình xác thực **NTP**, thông tin về thời gian mạng vẫn trao đổi giữa máy chủ và máy khách, nhưng sự khác biệt là các máy khách NTP này không xác thực máy chủ NTP dưới dạng nguồn bảo mật như máy chủ NTP hợp lệ bị hỏng và máy chủ NTP giả mạo vượt qua máy chủ NTP thực.

### Điều tra NTP (NTP Enumeration)

Một khía cạnh quan trọng khác của việc thu thập thông tin là thời điểm cụ thể sự kiện xảy ra. Những kẻ tấn công có thể cố gắng thay đổi cài đặt dấu thời gian của bộ định tuyến hoặc có thể giới thiệu máy chủ NTP thô trong mạng để đánh lừa các nhóm pháp y. Ở bản **NTP v3**, nó có hỗ trợ cho xác thực với máy chủ **NTP** trước khi xem xét thời gian của mình để được xác thực.

Có thể thu thập thông tin từ **NTP** bằng các công cụ khác nhau như lệnh **NTP, Nmap** và một kịch bản **NSE**. Trong quá trình điều tra NTP, kẻ tấn công tạo ra các truy vấn tới máy chủ **NTP** để trích xuất thông tin có giá trị từ phản hồi như:

-   Thông tin máy chủ được kết nối với máy chủ NTP

-   Địa chỉ IP của khách hàng, tên máy, thông tin hệ điều hành

-   Thông tin mạng như IP nội bộ phụ thuộc vào việc triển khai máy chủ NTP, tức là nếu máy chủ NTP được triển khai trong DMZ

### Lệnh điều tra NTP (NTP Enumeration Commands)

**ntpdc** được sử dụng để truy vấn **ntpd daemon** về trạng thái hiện hành và các thay đổi yêu cầu trong trạng thái.

`root@kali: ntpdc [-<flag> [<val>] | --<name> [{=| }<val>] ]... [host...]`

Lệnh **ntpdc** có thể được sử dụng với các tùy chọn sau:

![](images/image4.png){width="5.791666666666667in" height="4.166666666666667in"}

**ntptrace** là một kịch bản Perl, sử dụng **ntpq** để theo chuỗi các máy chủ NTP từ một máy chủ đã cho trở về nguồn thời gian chính. **ntptrace** yêu cầu thực hiện giao thức kiểm soát và giám sát NTP được chỉ định trong RFC 1305 và cho phép các gói NTP Mode 6 hoạt động bình thường.

![](images/image25.png){width="6.267716535433071in" height="3.513888888888889in"}

**ntpq** là một dòng lệnh tiện ích được sử dụng để truy vấn máy chủ NTP. Các **ntpq** được sử dụng để màn hình **NTP daemon ntpd** hoạt động & xác định hiệu suất. Nó sử dụng các định dạng tin nhắn điều khiển chuẩn của chế độ NTP 6.

Lệnh **ntpq** có thể được sử dụng với các tùy chọn sau:

![](images/image11.png){width="5.861111111111111in" height="5.569444444444445in"}

### Công cụ Điều tra NTP (NTP Enumeration Tools)

-   Nmap

-   NTP server Scanner

-   Wireshark

-   NTPQuery

## Điều tra SMTP (SMTP Enumeration)

### Giao thức chuyển thư đơn giản (SMTP)

**SMTP Enumeration** là một cách khác để trích xuất thông tin về đích bằng cách sử dụng **SMTP** (Simple Mail Transfer Protocol). Giao thức **SMTP** đảm bảo giao tiếp thư giữa các máy chủ Email và người nhận qua cổng 25. **SMTP** là một trong những giao thức **TCP/IP** phổ biến được sử dụng rộng rãi bởi hầu hết các máy chủ email hiện được định nghĩa trong RFC 821.

### Kỹ thuật điều tra SMTP (SMTP Enumeration Technique)

Sau đây là một số lệnh **SMTP** có thể được sử dụng để điều tra. Các phản hồi của máy chủ **SMTP** cho các lệnh này như **VRFY, RCPT TO** và **EXPN** là khác nhau. Bằng cách kiểm tra và so sánh các phản hồi cho người dùng hợp lệ và không hợp lệ thông qua tương tác với máy chủ **SMTP** qua telnet, người dùng hợp lệ có thể được xác định.

![](images/image12.png){width="6.25in" height="3.263888888888889in"}

### Công cụ Điều tra SMTP (SMTP Enumeration Tool)

-   NetScan Tool Pro

-   SMTP–user-enum

-   Telnet

### Điều tra chuyển vùng DNS bằng NSLookup (DNS Zone Transfer Enumeration Using NSLookup)

Trong quá trình điều tra thông qua chuyển vùng DNS, kẻ tấn công tìm thấy cổng **TCP** của mục tiêu là 53, vì cổng **TCP** 53 được sử dụng bởi DNS và chuyển vùng sử dụng cổng này theo mặc định. Sử dụng kỹ thuật quét cổng, bạn có thể tìm thấy nếu cổng đang mở.

### Chuyển vùng DNS (DNS Zone Transfer)

**Chuyển vùng DNS** là quá trình chuyển một bản sao **DNS** chứa các bản ghi cơ sở dữ liệu đến một máy chủ **DNS** khác. Quá trình **chuyển vùng DNS** cung cấp hỗ trợ cho việc giải quyết các truy vấn, vì nhiều máy chủ DNS có thể trả lời các truy vấn.

Hãy chú ý một kịch bản trong đó cả máy chủ **DNS** chính và phụ đều phản hồi các truy vấn. Máy chủ **DNS** phụ sẽ sao chép bản ghi DNS để cập nhật thông tin trong cơ sở dữ liệu của nó.

Chuyển vùng DNS bằng lệnh nslookup:

-   Truy cập **CMD** và nhập **nslookup**

-   Cmd sẽ chuyển dấu nhắc lệnh thành biểu tượng ” \> “

-   Nhập tên DNS Server hoặc địa chỉ DNS Server và Enter

-   Nhập **set type=any** và Enter. Nó sẽ nhận lại các bản records từ DNS server

-   Nhập **ls -d \<Domain\>** sẽ hiển thị thông tin từ domain mục tiêu (nếu được cho phép)

![](images/image19.png){width="6.267716535433071in" height="1.8472222222222223in"}

-   Nếu không được cho phép sẽ có thông báo từ chối request

![](images/image24.png){width="6.267716535433071in" height="1.0833333333333333in"}

-   Linux hỗ trợ lệnh **dig**, ở terminal máy Linux nhập **dig \<domain.com\> axfr**

![](images/image5.png){width="6.267716535433071in" height="3.013888888888889in"}

## Cách phòng chống Điều tra (Enumeration Countermeasures)

-   Sử dụng kỹ thuật bảo mật nâng cao

-   Cải tiến phần mềm bảo mật

-   Cập nhật phiên bản của giao thức

-   Chính sách bảo mật tốt

-   Mật khẩu đa dạng và khó đoán

-   Giao tiếp mã hóa mạnh mẽ giữa máy khách và máy chủ

-   Vô hiệu hóa các cổng không cần thiết

-   Giao thức, chia sẻ và dịch vụ kích hoạt mặc định

## Lab 4-1: Điều tra với Nmap (Services Enumeration using Nmap)

Trong bài Lab này, hãy xem xét mạng **10.10.10.0/24** nơi các thiết bị khác nhau đang chạy. Chúng ta sẽ điều tra các dịch vụ, cổng và thông tin hệ điều hành bằng ứng dụng **Nmap** sẵn có trên **Kali Linux**.

**Hướng dẫn:**

Mở terminal trên **Kali Linux**

`root@kali: nmap –sP.10.10.10.0/24`

Thực hiện **Ping Sweep** (Quét ping) trên mạng con để kiểm tra máy chủ trực tiếp và các thông tin cơ bản khác.

`root@kali: nmap –sU -p 10.10.10.12`

Quét cổng **UDP** cho cổng 161 (Cổng **SNMP**) của máy chủ đích **10.10.10.12**. Kết quả cho thấy cổng **SNMP** 161 được mở và đã được phân loại. Bây giờ hãy nhập lệnh dưới để thực hiện quét bí mật trên máy chủ đích **10.10.10.12**

`root@kali: nmap –sS 10.10.10.12`

Kết quả cho thấy một danh sách các cổng mở và các dịch vụ đang chạy trên máy chủ đích. Nhập lệnh dưới để quét hệ điều hành & phiên bản trên máy chủ đích **10.10.10.12**

`root@kali: nmap –sSV -O 10.10.10.12`

### NetBIOS Enumeration

**NetBIOS** hay **Network Basic Input/Output System** (hệ thống đầu vào/đầu ra cơ bản của mạng) là một chương trình cho phép giao tiếp giữa các ứng dụng chạy trên các hệ thống khác nhau trong mạng lưới khu vực địa phương.

Dịch vụ **NetBIOS** sử dụng một chuỗi ký tự 16-ASCII duy nhất để xác định các thiết bị mạng qua TCP/IP (15 ký tự ban đầu là để xác định thiết bị, ký tự thứ 16 là xác định dịch vụ)

Dịch vụ NetBIOS sử dụng cổng **TCP** 139. NetBIOS qua **TCP (NetBT)** sử dụng các cổng:

-   UDP port 137 (tên dịch vụ)

-   UDP port 138 (dịch vụ datagram)

-   TCP port 139 (dịch vụ phiên)

Sử dụng **NetBIOS Enumeration**, kẻ tấn công có thể khám phá:

-   Danh sách các máy trong miền (List of Machines within a domain)

-   Chia sẻ file

-   Tên người sử dụng

-   Thông tin nhóm

-   Mật khẩu

-   Các chính sách

Tên **NetBIOS** được phân thành các loại sau:

-   Duy nhất

-   Nhóm

-   Tên miền

-   Nhóm Internet

-   Multihomed (Đa lượng)

![](images/image2.png){width="6.267716535433071in" height="4.777777777777778in"}

![](images/image16.png){width="6.267716535433071in" height="5.125in"}

### Công cụ điều tra NetBIOS (NetBIOS Enumeration Tool)

Lệnh **nbstat** là một công cụ hữu ích để hiển thị thông tin về **NetBIOS** qua số liệu thống kê **TCP/IP**. Nó cũng được sử dụng để hiển thị thông tin như bảng tên NetBIOS, bộ nhớ đệm tên và các thông tin khác.

Lệnh sử dụng **nbstat** được hiển thị dưới đây:

`nbtstat.exe –a "NetBIOS name of the remote system."`

`nbtstat -A 192.168.1.10`

Lệnh **nbstat** có thể được sử dụng cùng với một số tùy chọn như sau:

![](images/image6.png){width="6.267716535433071in" height="5.333333333333333in"}

## Lab 4-2: Điều tra sử dụng SuperScan

Chuẩn bị: tải phần mềm **SuperScan** trên máy Windows của bạn.

Mở **SuperScan**, chuyển đến tab **Windows Enumeration**. Nhập tên máy chủ hoặc địa chỉ IP của máy Windows muốn đến. Ấn **Options** để tùy chỉnh điều tra. Chọn kiểu điều tra từ phần bên trái. Sau khi định dạng, để bắt đầu quá trình liệt kê thì bấm nút **Enumerate** để khởi tạo quá trình.

![](images/image13.png){width="6.267716535433071in" height="3.736111111111111in"}

Sau khi khởi động Enumeration, nó sẽ thu thập thông tin về máy mục tiêu, chẳng hạn như thông tin địa chỉ **MAC**, thông tin hệ điều hành và các thông tin khác tùy thuộc vào loại điều tra được chọn trước khi bắt đầu

![](images/image22.png){width="6.267716535433071in" height="3.7916666666666665in"}

Có thể hiển thị thông tin người dùng của máy mục tiêu cùng với tên đầy đủ, nhận xét hệ thống, thông tin đăng nhập lần cuối, thông tin hết hạn mật khẩu, thông tin thay đổi mật khẩu, số lượng thông tin đăng nhập và số lần đếm mật khẩu không hợp lệ, thông tin về chính sách tài khoản và mật khẩu, chia sẻ thông tin, thông tin đăng nhập từ xa, v.v…

![](images/image27.png){width="6.097222222222222in" height="6.722222222222222in"}

### Dùng Net View để điều tra tài nguyên được chia sẻ (Enumerating Shared Resources Using Net View)

**Net View** là tiện ích được sử dụng để hiển thị thông tin về tất cả các nguồn được chia sẻ của máy chủ hoặc nhóm làm việc từ xa. Cú pháp lệnh Net View là

`net view [\\computername [/CACHE] | [/ALL] | /DOMAIN[:domainname]]`

![](images/image15.png){width="4.194444444444445in" height="4.25in"}

![](images/image8.png){width="4.694444444444445in" height="2.9027777777777777in"}

## Lab 4-3: Điều tra bằng SoftPerfect Network Scanner Tool

Tải và cài đặt công cụ **SoftPerfect Network Scanner**. Trong bài Lab này, tôi sử dụng **Windows Server 2016** để thực hiện quét bằng **SoftPerfect Network Scanner** quét nguồn được chia sẻ trong mạng.

Sau khi cài đặt, mở ứng dụng và nhập phạm vi địa chỉ IP để quét và nhấn **Start Scanning**

![](images/image9.png){width="6.267716535433071in" height="2.6805555555555554in"}

Sau khi quét, chọn host mà bạn muốn điều tra và nhấn chuột phải và chọn **Properties**

![](images/image14.png){width="6.267716535433071in" height="3.138888888888889in"}

Bây giờ màn hình sẽ hiển thị những nguồn đã được chia sẻ về host này.
