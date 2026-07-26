from statistics import mean, median, mode

def calculate_statistics(tuple_data):
    mean_value = mean(tuple_data)
    median_value = median(tuple_data)
    mode_value = mode(tuple_data)
    return mean_value, median_value, mode_value

# Test the function
physics_scores = (78, 86, 92, 76, 82, 78, 85, 90)
mean_score, median_score, mode_score = calculate_statistics(physics_scores)
print(f"Trungbinh: {mean_score}")
print(f"TRung vị: {median_score}")
print(f"Điểm phổ biến: {mode_score}")
