def is_happy_number(n, seen=None):
    if seen is None:
        seen = set()

    if n == 1:
        return True

    if n in seen:
        return False

    seen.add(n)

    next_num = sum(int(digit) ** 2 for digit in str(n))
    return is_happy_number(next_num, seen)


def happy_numbers(input_file, output_file):
    with open(input_file, "r") as input_file:
        numbers = input_file.readlines()

    with open(output_file, "w") as output_file:
        for number in numbers:
            number = int(number.strip())
            if is_happy_number(number):
                output_file.write(str(number) + " là số hạnh phúc.\n")
            else:
                output_file.write(str(number) + " không phải là số hạnh phúc.\n")


happy_numbers("SOHANHPHUC.INP", "SOHANHPHUC.OUT")
