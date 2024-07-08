import numpy as np
np.set_printoptions(suppress=True)  # Không hiển thị số thực theo dạng 1e-xx

def dot_vector(A, b):
    result = [0 for _ in range(len(A))]
    for i in range(len(A)):
        for k in range(len(b)):
            result[i] += A[i][k] * b[k]
    return result

def norm(vector):
    sum_of_squares = 0
    for x in vector:
        sum_of_squares += x**2
    return sum_of_squares ** 0.5

def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def eigen_power_iteration(A, n_iter=1000, eps=10e-5):
    # Khởi tạo vector ngẫu nhiên
    b_k = np.random.rand(A.shape[1])
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
    lamb = dot(dot_vector(A, b_k), b_k) / dot(b_k, b_k)
    

    return lamb, b_k


def my_eigens(A, n_iter=1000, eps=1e-5):
    eigenvalues = []
    eigenvectors = []
    Teigenvalues = []
    Teigenvectors = []
    
    A = np.array(A, dtype=float)  # Ensure A is of type float
    AT = A.T  # Transpose of A
    n_rows = A.shape[0]

    for _ in range(n_rows):
        # Compute the dominant eigenvalue and eigenvector of A
        lamb, R = eigen_power_iteration(A, n_iter, eps)
        # Compute the dominant eigenvalue and eigenvector of A.T
        Tlamb, L = eigen_power_iteration(AT, n_iter, eps)
        
        eigenvalues.append(lamb)
        eigenvectors.append(R)
        Teigenvalues.append(Tlamb)
        Teigenvectors.append(L)
        
        # Reshape eigenvectors to column vectors
        R = R.reshape(n_rows, -1)
        L = L.reshape(n_rows, -1)
        
        # Deflation: remove the component of the found eigenvalue/vector
        A = A - (lamb / (R.T @ L)) * (R @ L.T)
        
    return np.array(eigenvalues), np.array(eigenvectors).T


def my_diag(A):
    # Tìm trị riêng, vector riêngs
    # eigenvalues, eigenvectors = np.linalg.eig(A)
    eigenvalues, eigenvectors = my_eigens(A)
    
    # Sắp xếp giảm dần theo trị riêng
    sorted_idx = np.argsort(eigenvalues)[::-1]
    eigenvalues = eigenvalues[sorted_idx]
    eigenvectors = eigenvectors[:, sorted_idx]
    
    P_matrix = eigenvectors
    P_inv_matrix = np.linalg.inv(P_matrix)
    D_matrix = np.diag(eigenvalues)
    
    return P_matrix, D_matrix, P_inv_matrix


# A = np.array([[4, 0, 1], 
#              [-2, 1, 0], 
#              [-2, 0, 1]])

A = np.array([[3, -2, 0],
             [-2, 3, 0],
             [0, 0, 5]])


# A = np.array([[-1, 3, -1],
#              [-3, 5, -1],
#              [-3, 3, 1]])

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
print("Matrix P_inv:")
print(P_inv)
print("A = P * D * P_inv:")
print(P @ D @ P_inv)
