DỊCH VỤ MÁY CHỦ VPS
Các nhà cung cấp chủ yếu hiện nay:
1. Google cloud
2. Amazon 
3. Digital ocean
4. Vultr
5. Mắt bão
6. Tên tên

lựa chọn cho gói dịch vụ máy chủ của baochaupharm.com là Vultr với giá dịch vụ là 12usd/tháng.<br>

Cài đặt cho máy chủ theo LAMP STACK (APACHE) hoặc LEMP STACK (NGINX).<br>
Cài đặt các module trên ubuntu bằng lệnh <br>
Cú pháp: sudo apt tên module<br>
LAMP:<br>
BƯỚC 1: Cài đặt ubuntu 18 bằng cách lựa chọn máy chủ có sẵn thay vì cài đặt từ đầu.<br>

BƯỚC 2: Cài đặt Apache<br>
Cài đặt Apache and Updating the Firewall<br>
-Cập nhật atp<br>
Cú pháp: sudo apt update<br>
-Cài đặt Apache<br>
sudo apt install apache2<br>
-Cài đặt Firewall để cho phép Web Traffic<br>
Cú pháp: sudo ufw app list<br>
-Check thông tin cổng:<br>
Cú pháp: sudo ufw app info "Apache Full"<br>
-To allow incoming HTTP and HTTPS traffic for this server<br>
Cú pháp: sudo ufw allow "Apache Full"<br>
-Check quá trình hoàn thành:<br>
Cú pháp: http://your_server_ip ví dụ: http://203.123.12.45<br>
Trả về kết quả là một trang thông báo như hình:<br>
![small_apache_default_1804](https://user-images.githubusercontent.com/109997053/232965487-cb5b8bcc-98f5-48b4-89ea-4b589191a23e.png)<br>

BƯỚC 3: CÀI ĐẶT MYSQL<br>
-Cài đặt mysql server:<br>
Cú pháp: sudo apt install mysql-server<br>
-Loại bỏ cấu hình mặc định:<br>
Cú pháp: sudo mysql_secure_installation<br>
-Thoát mysql:<br>
Cú pháp: exit<br>

BƯỚC 4: CÀI ĐẶT PHP<br>
Cú pháp: sudo apt install php libapache2-mod-php php-mysql<br>
-Cấu hình file ưu tiên:<br>
Cú pháp: sudo nano /etc/apache2/mods-enabled/dir.conf<br>
-Khởi động để cập nhật thay đổi.<br>
Cú pháp: sudo systemctl restart apache2<br>
-Cài đặt Virtual Host (áp dụng cho IP có nhiều website khác nhau, nếu chỉ có 1 website thì chỉ cần keó thả file nguồn cài đặt vào thư mục html và đổi tên thành domain của bạn là được).<br>
-Tạo thư mục:<br>
Cú pháp: sudo mkdir /var/www/your_domain<br>
-Phân quyền:<br>
Cú pháp: sudo chown -R $USER:$USER /var/www/your_domain<br>
Ở đây thường dùng tài khoản user là www-data:www-data. <br>
Ví dụ: sudo chown -R www-data:www-data /var/www/phimviet.com<br>
Phân quyền 755 cho thư mục và 644 cho tập tin:<br>
Cú pháp: sudo chmod -R 755 /var/www/your_domain và <br>

-Check sự hoạt động của server, tạo file index.html và tạo 1 nội dung trong đó.<br>
Cú pháp: nano /var/www/your_domain/index.html<br>
Dán nội dung này vào file:<br>
<html>
    <head>
        <title>Welcome to Your_domain!</title>
    </head>
    <body>
        <h1>Success!  The your_domain server block is working!</h1>
    </body>
</html>

Ấn Ctrl (cmd) + C để thoát và lưu thay đổi với phím Y.<br>

-Mặc định /etc/apache2/sites-available/000-default.conf file quản lí và điều hướng thư mục cho domain là file ở trên chạy với địa chỉ IP được cấp, tuy nhiên chúng ta thường cấu hình file đó theo tên miền của mình.<br>
Cú pháp: nano /etc/apache2/sites-available/your_domain.conf.<br>
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName your_domain
    ServerAlias www.your_domain
    DocumentRoot /var/www/your_domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
Cập nhật nội dung theo đường dẫn cụ thể của bạn.<br>
-Kích hoạt file your_domain.conf <br>
Cú pháp: sudo a2ensite your_domain.conf<br>
-Khi cần tắt thì dùng cú pháp;<br>
Cú pháp: sudo a2dissite 000-default.conf thường ta thực hiện khi kích hoạt file your_domain.conf để đám bảo không bị lộ địa chỉ IP, ngoài ra để an toàn hơn chúng ta sử dụng cloudflare cho việc này.<br>
-Kiểm tra hoạt động.<br>
Cú pháp: sudo apache2ctl configtest<br>
-Khởi động để hoàn tất công việc:<br>
Cú pháp: sudo systemctl restart apache2<br>
-Khi nhận được kết quả sau là chúng ta đã thành công<br>
Success! The your _domain virtual host is working!<br>
Ngoài những module trên thì có 1 số module phụ như:<br>
curl và modwrite chúng ta cần cài đặt trong một số trường hợp nhất định.<br>

Chúc các bạn thành công.<br>









