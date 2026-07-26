# Read input data from file
with open("CNTSEQ.INP", "r") as input_file:
    input_lines = input_file.readlines()

# Process input data
readline1_split = list(map(int, input_lines[0].split()))
readline2_split = list(map(int, input_lines[1].split()))

# Remove negative numbers and convert them to positive
readline2_split = [abs(num) for num in readline2_split]

# Calculate the sum and count
total_sum = 0
count = 0

for i in range(len(readline2_split)):
    for j in range(i+1, len(readline2_split)):
        current_sum = readline2_split[i] + readline2_split[j]
        if current_sum > readline1_split[1]:
            count += 1

# Write output data to file
with open("CNTSEQ.OUT", "w") as output_file:
    output_file.write(str(count))
