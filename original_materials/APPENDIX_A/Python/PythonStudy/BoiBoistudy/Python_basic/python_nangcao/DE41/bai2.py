def xauchung(s1, s2):
    m = len(s1)
    n = len(s2)
    
    #Tạo bảng lưu trữ độ dài xâu con chung dài nhất
    #Tại vị trí {i, j} trong bảng lưu trữ,giá trị độ dài của xâu con chung của s1 và s2
    p = [[0] * (n+1) for _ in range (m+1)]
    #Tạo biến lưu trữ độ dài xâu con chung dài nhất
    max_len = 0
    #vị trí kết thúc xâu con chung dài nhất
    end_pos = 0
    #Lập qua các phần tử của phần tử 2 xâu s1 và s2
    for i in range(1, m+1):
        for j in range(1, n+1):
            if s1[i-1] == s2[j-1]:
                p[i][j] = p[i-1][j-1] +1
                if p[i][j] > max_len:
                    max_len = p[i][j]
                    end_pos = i
    #Trích xuất xâu con chung
    long_subsstring = s1[end_pos - max_len:end_pos]
    return long_subsstring 
#Nhập xâu s1 và s2 từ người dùng
s1 = input('Nhập xâu s1:')
s2 = input('Nhập xâu s2:')
#Tìm xâu con chung dài nhất
kq = xauchung(s1, s2)
#In kq
print('Xâu con chung dài nhất:', kq)
    