import numpy as np
np.set_printoptions(suppress=True)  # Không hiển thị số thực dạng scientific
def QR_decomposition(A):
    # Lấy số hàng và cột của ma trận A
    m, n = A.shape
    
    # Khởi tạo ma trận Q và R
    Q = np.zeros((m, n))
    R = np.zeros((n, n))
    
    # Lặp qua từng cột của ma trận A
    for i in range(n):
        # Lấy vector cột thứ j của A
        v = A[:, i]
        
        # Lặp qua các cột trước đó
        for j in range(i):
            R[j, i] = np.dot(Q[:, j], A[:, i])  # Tính R[j, i]
            v = v - R[j, i] * Q[:, j] # Cập nhật lại vector cột
        
        # Tính chuẩn của vector hiện tại
        R[i, i] = np.linalg.norm(v)
        
        # Trực chuẩn hóa vector và đưa vào ma trận Q
        Q[:, i] = v / R[i, i]
    
    return Q, R

# Test với ma trận A

# A = np.array(
#   [[1, 1, 1],
#     [2,-2, 2],
#     [1, 1, -1]]
# )

A = np.array(
  [[1, 1, 2],
    [2,-1, 1],
    [-2, 4, 1]]
)

# A = np.array(
#   [[1, 1, 1],
#     [2,2, 0],
#     [3, 0, 0],
#     [0 ,0 , 1]]
# )

Q, R = QR_decomposition(A)
print ("Ma trận A:")
print(A)
print("\nMa trận Q:")
print(Q)
print("\nMa trận R:")
print(R)
