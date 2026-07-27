# Phiên bản chia khối
from fractions import Fraction

data = []
with open("TBC.INP", "r") as input_file:
    for line in input_file:
        num = float(line)
        data.append(num)
with open("TBC.OUT", "w") as output_file:
    for num in data:
        fraction = Fraction(num)
        s = str(fraction).split("/")
        output_file.write(s[1] + "\n")


print(Fraction(5.0475))
# Phiên bản tối ưu
# from fractions import Fraction

# with open("TBC.INP", "r") as input_file, open("TBC.OUT", "w") as output_file:
#     for line in input_file:
#         num = float(line)
#         fraction = Fraction(num)
#         s = str(fraction).split("/")
#         output_file.write(s[1] + "\n")
