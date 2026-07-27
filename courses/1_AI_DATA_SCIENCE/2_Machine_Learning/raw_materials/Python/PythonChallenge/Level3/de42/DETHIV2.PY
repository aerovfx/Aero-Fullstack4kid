def count_combinations(n, k, numbers):
    combinations = set()

    def find_combinations(target, current_combination, visited):
        if target == 0 and len(current_combination) == k:
            sorted_combination = tuple(sorted(current_combination))
            combinations.add(sorted_combination)
            return

        if target < 0 or len(current_combination) > k:
            return

        for i in range(len(numbers)):
            num = numbers[i]
            if not visited[i]:
                visited[i] = True
                remaining = target - num
                find_combinations(remaining, current_combination + [num], visited)
                visited[i] = False

    visited = [False] * len(numbers)
    find_combinations(n, [], visited)

    for combination in combinations:
        print(combination)

    return len(combinations)

# Test với danh sách số từ 1 đến 10
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
n = 10
k = 3

count = count_combinations(n, k, numbers)
print("Tổng các phương án sắp xếp:", count)
