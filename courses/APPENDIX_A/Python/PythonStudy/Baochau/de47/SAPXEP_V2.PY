def tong_cac_chuso(so):
    tong_chuso = 0
    while so > 0:
        tong_chuso += so % 10 # lấy lần lượt từng chữ số cuối cùng của so và cộng vào biến tong_chuso
        so //= 10 # chia so cho 10 để lược bỏ chữ số cuối cùng đã lấy
    return tong_chuso

# nhập số n
n = int(input('nhập số n: '))
if n < 0 or n >= 3200:
    print('thông số ko hợp lệ.')
    
# nhập các phần tử trong n
so = input('nhập các phần tử, các nhau bởi dấu cách: ').split()
so = [int(i) for i in so]
# tìm tổng chữ số lớn nhất
max_tong_chuso = max(so, key = tong_cac_chuso)
print('số có tổng chữ số lớn nhất:',max_tong_chuso)
dayso = [str(i)[::1] for i in so]
print('dãy số sau khi đảo ngược: '.join(dayso))