#Bài 13. Viết chương trình kiểm tra xem số n có là số nguyên tố hay không.
# check prime number
n = int(input("Enter a number: "))
for i in range(2, n):
    if n % i == 0:
        print("Not a prime number")
        break
else:
    print("Prime number")
    