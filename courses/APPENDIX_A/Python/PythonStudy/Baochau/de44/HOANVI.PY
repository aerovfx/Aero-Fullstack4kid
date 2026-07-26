def day_ngich_the(p):
    n = len(p)
    # khởi tạo một list t với n phần tử và giá trị mỗi phần tử là 0
    # t list này sẽ lưu dãy ngịch thế của hoán vị p
    t = [0] * n
    
    # duyệt qua từng phần tử i trong hoán vị p
    for i in range(n):
        # duyệt qua các phần tử từ j từ i +1 đến n-1 trong hoán vị p
        #vì ngịch thế của phàn tử i được tính bằng số lượng các phần tử lớn hơn nó nằm bên trái
        for j in range(i+1, n):
            #nếu phần tử j có giá trị nhỏ hơn phần tử i, tăng giá trị t[i] lên 1
            if p[j] < p[i]:
                t[i] += 1
    return t

n = int(input('nhập số n: '))


# nhập hoán vị p từ người dùng 
p_hoanvi = input('nhập hoán vị p, các số cách nhau bởi dấu phẩy: ')
p = list(map(int, p_hoanvi.split(',')))

# tìm và in ra ngịch thế t của hoán vị p
t = day_ngich_the(p)
print('dãy ngịch thế t: ',t)