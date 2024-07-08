import numpy as np
np.set_printoptions(suppress=True)  # Không hiển thị số thực theo dạng 1e-xx

def inverse(A):
    #Tạo ma trận đơn vị kích thước bằng ma trận vuông A
    I = np.eye(A.shape[0])
    #Tạo ma trận bổ sung B = (A|I)
    B = np.hstack([A, I])
    rows, cols =  B.shape
    for c in range(cols):   # Duyệt qua từng cột
        if np.all(B[:, c] == 0):    # Nếu tất cả các phần tử trong cột c đều bằng 0 thì kết thúc
            return "Ma tran khong kha nghich"

        pivot = None
        for r in range(c, rows):    # Tìm phần tử pivot khác 0 đầu tiên trong cột c
            if B[r, c] != 0:
                pivot = r
                break

        if pivot is None:  
            continue

        # Hoán vị dòng chứa pivot lên vị trí của dòng c
        B[[c, pivot]] = B[[pivot, c]]
        
        # Nhân giá trị của dòng chứa pivot cho 1/pivot
        B[c] = B[c] / B[c, c]

        # Biến các phần tử trên dưới pivot về 0
        for r in range(rows):   
            if r == c:
                continue
            factor = B[r, c] / B[c, c]
            B[r] = B[r] -  factor * B[c]

    #Nếu ma trận B lúc này có dạng [I, A^-1] thì trả về ma trận nghịch đảo
    if np.all(B[:, :cols//2] == I):
        return B[:, cols//2:]
    else:
        return "Ma tran khong kha nghich"

            

    

A = np.array(
    [[1, 1.5, -1.2],
    [2, 3.7, 8],
    [3.5, 2.5, 4]]
)


# A = np.array(
#     [[1, -0.5, 2, -1.6],
#      [5, -7, -3.2, -4.8],
#      [6, 2, 8.9, 8.2],
#      [5, 3.1, 4.2, 7.7]]
# )

# A = np.array(
#     [[-1, 3, -4],
#      [2, 4, 1],
#      [-4, 2, -9]]
# )

# A = np.array(
#     [[1, 2, 3, 4],
#      [5, 6, 7, 8],
#      [9, 10, 11, 12],
#      [13, 14, 15, 16]]
# )


#Kiểm tra nếu A là ma trận vuông thì mới in
if A.shape[0] == A.shape[1]:
    print("Ma tran nghich dao khong dung thu vien numpy:")
    print(inverse(A))
    print("\n")

print("Ma tran nghich dao dung thu vien numpy:")
det = np.linalg.det(A)  # Tính định thức của ma trận A

if np.isclose(det, 0):  
    print("Ma tran khong kha nghich")
else:
    invA = np.linalg.inv(A)
    print(invA)