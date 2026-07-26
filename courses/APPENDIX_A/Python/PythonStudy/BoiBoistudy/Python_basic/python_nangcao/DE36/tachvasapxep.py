sap_xep = input('Nhập vào dãy ký tự:')
so = []
chucai= []
for sap in sap_xep:
    if sap.isdigit():
        so.append(sap)
    else:
        chucai.append(sap)
so.sort(reverse = True)
chucai.sort()

print('Nửa đầu giảm dần', so )
print('Nửa sau tăng dần', chucai)
    
