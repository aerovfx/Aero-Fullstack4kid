def create_output_dict(n):
    output_dict = {}
    for i in range(1, n+1):
        output_dict[i] = i**2
    return output_dict

def main():
    n = 8
    result = create_output_dict(n)
    print(result)

if __name__ == "__main__":
    main()
