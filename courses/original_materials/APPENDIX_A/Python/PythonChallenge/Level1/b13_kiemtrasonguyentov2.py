n = int(input("Enter a number: "))

def nguyento(n):
    for i in range(2, n):
        if n % i == 0:
            print("Khong phai so nguyen toc")
            break
    else:
        print("la so nguyen to")

nguyento(n)