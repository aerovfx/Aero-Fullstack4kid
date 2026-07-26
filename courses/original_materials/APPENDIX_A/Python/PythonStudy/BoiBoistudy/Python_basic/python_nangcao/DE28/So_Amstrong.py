def so_amstrong():
    list_amstrong = []
    for num in range(100, 1000):
        digit1 = num // 100  # Chữ số hàng trăm
        digit2 = (num % 100) // 10  # Chữ số hàng chục
        digit3 = num % 10  # Chữ số hàng đơn vị

        tonglapphuong = digit1 ** 3 + digit2 ** 3 + digit3 ** 3
        if num == tonglapphuong:
            print('Số Amstrong là:',num)
            list_amstrong.append(num)   
    return list_amstrong
so_amstrong()