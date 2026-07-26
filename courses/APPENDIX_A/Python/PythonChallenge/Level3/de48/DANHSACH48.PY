def find_kth_smallest(nums, k):
    # Sắp xếp danh sách theo thứ tự tăng dần
    nums.sort()
    
    # Trả về phần tử ở vị trí k-1 (vì index trong Python bắt đầu từ 0)
    return nums[k - 1]

# Ví dụ sử dụng:
my_list = [4, 2, 7, 1, 9, 5]
k = 2
result = find_kth_smallest(my_list, k)
print(f"Phần tử nhỏ thứ {k} là: {result}")
