#Hàm:
def hs(P,t,m,h,):
    cci = int(m)*1000*10*int(h)
    ctp = int(P)*int(t)*3600
    hs = int(cci)/int(ctp)*100
    return hs
#Đưa dữ liệu đầu vào từ file TUVAN.INP:
with open("TUVAN.INP","r") as file:
    lines = file.readlines()
#Xử lý từng dòng trong danh sách lines:
results = []
for line in lines:
    data = line.strip().split(" ")
    cong_suat = int(data[0])
    thoi_gian = int(data[1])
    khoi_luong = int(data[2])
    do_cao = int(data[3])
    
    hieu_suat = hs(cong_suat, thoi_gian, khoi_luong, do_cao)
    results.append(hieu_suat)
#Xuất kết quả ra file:
with open("TUVAN.OUT","w") as file:
    for result in results:
        file.write(f"{result}\n")
