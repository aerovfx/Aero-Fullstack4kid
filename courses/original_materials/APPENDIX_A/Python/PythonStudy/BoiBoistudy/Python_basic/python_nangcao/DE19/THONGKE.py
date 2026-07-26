def dem_tansuat(numbers):
    tansuat={}
    for num in numbers:
        if num in tansuat:
            tansuat[num] += 1
        else:
            tansuat[num] = 1
    return tansuat

def read_input_file():
    with open("THONGKE.INP","r") as file:
        lines = file.readlines()
        numbers_list = [line.strip().split() for line in lines ]
    return numbers_list

def write_output_file(freq):
    with open("THONGKE.OUT","w") as file:
        for ts in freq :
            for num, dem in ts.items():
                file.write(f"{num}({dem}) ")
            file.write("\n")
            
def main():
    numbers_list = read_input_file()
    freq = []
    for numbers in numbers_list:
        tuansuat = dem_tansuat(numbers)
        freq.append(tuansuat)
    write_output_file(freq)
    
main()