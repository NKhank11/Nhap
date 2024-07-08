import numpy as np
np.set_printoptions(suppress=True)  # Không hiển thị số thực theo dạng 1e-xx

# Hàm nhân ma trận với vector
def dot_vector(A, b):
    result = [0 for _ in range(len(A))]
    for i in range(len(A)):
        for k in range(len(b)):
            result[i] += A[i][k] * b[k]
    return result

# Hàm tính chuẩn của vector
def norm(vector):
    sum_of_squares = 0
    for x in vector:
        sum_of_squares += x**2
    return sum_of_squares ** 0.5

# Hàm tính tích vô hướng của 2 vector
def dot(a, b):
    result = 0
    for i in range(len(a)):
        result += a[i] * b[i]
    return result

# Hàm chuyển vị ma trận
def transpose(A):
    rows, cols = A.shape
    AT = np.zeros((cols, rows))
    for i in range(rows):
        for j in range(cols):
            AT[j][i] = A[i][j]
    return AT

# Hàm tìm ma trận nghịch đảo
def inverse(A):
    #Tạo ma trận đơn vị kích thước bằng ma trận vuông A
    I = np.eye(A.shape[0])
    #Tạo ma trận bổ sung B = (A|I)
    B = np.hstack([A, I])
    rows, cols =  B.shape
    for c in range(cols):   # Duyệt qua từng cột
        if np.all(B[:, c] == 0):    # Nếu tất cả các phần tử trong cột c đều bằng 0 thì kết thúc
            return None

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
        return None
    
# Hàm tạo ma trận đường chéo từ mảng giá trị
def create_diagonal_matrix(values):
    n = len(values)
    result = np.zeros((n, n))
    for i in range(n):
        result[i, i] = values[i]
    return result

# Hàm sắp xếp mảng giảm dần
def argsort_descending(arr):
    n = len(arr)
    indices = list(range(n))
    for i in range(n):
        for j in range(i + 1, n):
            if arr[j] > arr[i]:
                # Hoán đổi chỉ mục tương ứng của phần tử tại vị trí i và vị trí j
                indices[i], indices[j] = indices[j], indices[i]
    return indices

def is_close(A, B, eps=0.1):
    return np.all(np.abs(A - B) < eps)

# Hàm tìm trị riêng và vector riêng
def eigen_power_iteration(A, n_iter=1000, eps=10e-5):
    # Khởi tạo vector ngẫu nhiên
    b_k = np.random.rand(A.shape[1]) # Vector riêng
    b_k_pre = np.zeros(A.shape[1])

    # Tìm vector riêng
    for _ in range(int(n_iter)):
        # Tính tích ma trận theo vector riêng
        numerator = dot_vector(A, b_k)
        denominator = norm(numerator)
        
        b_k = numerator / denominator
        
        # Dừng khi sự thay đổi của vecto trước và vector sau không đáng kể
        if np.all(np.abs(b_k - b_k_pre) < eps):
            break
        
        b_k_pre = b_k
        
    # Tìm trị riêng (Rayleigh quotient iteration)
    lamb = dot(dot_vector(A, b_k), b_k) / dot(b_k, b_k) # Trị riêng
    

    return lamb, b_k

# Hàm nhân 2 ma trận
def matrix_multiply(A, B):
    rows_A, cols_A = A.shape
    rows_B, cols_B = B.shape
    result = np.zeros((rows_A, cols_B))
    for i in range(rows_A):
        for j in range(cols_B):
            for k in range(cols_A):
                result[i, j] += A[i, k] * B[k, j]
    return result

# Hàm deflation để loại bỏ trị riêng và vector riêng đã tìm được để tìm trị riêng tiếp theo
def deflation(A, lamb, R, L):
    A -= (lamb / matrix_multiply(R.T, L)) * matrix_multiply(R, L.T)


def my_eigens(A, n_iter=1000, eps=1e-5):
    # Khởi tạo danh sách trị riêng và vector riêng của A và chuyển vị của A để xử lý cả TH ma trận không đối xứng
    eigenvalues = []    
    eigenvectors = [] 
    Teigenvalues = []
    Teigenvectors = []
    
    A = np.array(A, dtype=float)  # Đảm bảo A là ma trận số thực
    A_T = transpose(A)  # Ma trận chuyển vị của A
    n_rows = A.shape[0]

    for _ in range(n_rows):
        # Tìm trị riêng và vector riêng của A và A_T
        lamb, eigenvector_A = eigen_power_iteration(A, n_iter, eps)
        Tlamb, eigenvector_A_T = eigen_power_iteration(A_T, n_iter, eps)
        
        # Lưu trị riêng và vector riêng tìm được
        eigenvalues.append(lamb)
        eigenvectors.append(eigenvector_A)
        Teigenvalues.append(Tlamb)
        Teigenvectors.append(eigenvector_A_T)
        
        # Reshape vector riêng về ma trận
        eigenvector_A = eigenvector_A.reshape(n_rows, -1)
        eigenvector_A_T = eigenvector_A_T.reshape(n_rows, -1)
        
        # Loại bỏ trị riêng và vector riêng đã tìm được để tìm trị riêng tiếp theo
        deflation(A, lamb, eigenvector_A, eigenvector_A_T)
        
    return np.array(eigenvalues), transpose(np.array(eigenvectors))


def my_diag(A):
    # Tìm trị riêng, vector riêngs
    eigenvalues, eigenvectors = my_eigens(A)
    
    # Sắp xếp giảm dần theo trị riêng
    sorted_idx = argsort_descending(eigenvalues)
    eigenvalues = eigenvalues[sorted_idx]
    eigenvectors = eigenvectors[:, sorted_idx]
    
    # Tạo ma trận P, D, P_inv
    P_matrix = eigenvectors
    P_inv_matrix = inverse(P_matrix)
    D_matrix = create_diagonal_matrix(eigenvalues)
    
    return P_matrix, D_matrix, P_inv_matrix


# A = np.array([[4, 0, 1], 
#              [-2, 1, 0], 
#              [-2, 0, 1]])

# A = np.array([[3, -2, 0],
#              [-2, 3, 0],
#              [0, 0, 5]])


A = np.array([[-1, 3, -1],
             [-3, 5, -1],
             [-3, 3, 1]])

# A = np.array([[5, -1, 1],
#              [-1, 2, -2],
#              [1, -2, 2]])

# A = np.array([[1, 3, 3],
#              [-3, -5, -3],
#              [3, 3, 1]])

# A = np.array([[3, 4, -4],
#              [-2, -1, 2],
#              [-2, 0, 1]])



P, D, P_inv = my_diag(A)

print("Matrix A:")
print(A)
print("Matrix P:")
print(P)
print("Matrix D:")
print(D)
print(P_inv)
print("A = P * D * P_inv:")

temp = matrix_multiply(P, D)
print(matrix_multiply(temp, P_inv))

print(is_close(A, matrix_multiply(P, matrix_multiply(D, P_inv))))

