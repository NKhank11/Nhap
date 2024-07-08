import numpy as np

def argsort_descending(arr):
    n = len(arr)
    indices = list(range(n))
    for i in range(n):
        for j in range(i + 1, n):
            if arr[j] > arr[i]:
                # Hoán đổi chỉ mục tương ứng của phần tử tại vị trí i và vị trí j
                indices[i], indices[j] = indices[j], indices[i]
    return indices

# Sử dụng hàm:
eigenvalues = [3, 1, 2, -4, 10]  # Thay thế bằng danh sách các giá trị riêng tương ứng
sorted_idx = argsort_descending(eigenvalues)
print("Sorted indices:", sorted_idx)
print("Sorted eigenvalues:", [eigenvalues[i] for i in sorted_idx])
