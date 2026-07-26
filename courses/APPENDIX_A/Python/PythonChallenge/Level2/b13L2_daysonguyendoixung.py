#Viết chương trình Python nhập một dãy số nguyên, sau đó kiểm tra xem nó có khả đối xứng không? Nếu có, hãy biến đổi nó để được một dãy đối xứng.

#Gợi ý:

#Bạn có thể dùng hàm kiem_tra_doi_xung để kiểm tra tính đối xứng của dãy số bằng cách so sánh dãy số ban đầu với dãy số đảo ngược. Nếu chúng bằng nhau, dãy số là đối xứng.
#Nếu dãy số chưa đối xứng, hãy thử dùng hàm sx_doi_xung để biến đổi dãy số thành dãy số đối xứng: bằng cách điều chỉnh giá trị của một phần tử ở một vị trí sao cho nó khớp với phần tử đối xứng của nó.

def kiem_tra_doi_xung(lst):
    return lst == lst[::-1]

def sx_doi_xung(lst):
    if kiem_tra_doi_xung(lst):
        return lst
    else:
        for i in range(len(lst)//2):
            if lst[i] != lst[-i-1]:
                for j in range(i+1, len(lst)):
                    if lst[j] == lst[-i-1]:
                        lst[i], lst[j] = lst[j], lst[i]
                        break
        return lst

lst = list(map(int, input("Nhập dãy số nguyên, cách nhau bởi dấu cách: ").split()))

if kiem_tra_doi_xung(lst):
    print("Dãy số đã đối xứng.")
else:
    new_lst = sx_doi_xung(lst)
    if kiem_tra_doi_xung(new_lst):
        print("Dãy số đã khả đối xứng và biến đổi thành dãy số đối xứng: ", new_lst)
    else:
        print("Dãy số không khả đối xứng.")
        