import numpy as np
np.set_printoptions(suppress=True)  # Không hiển thị số thực theo dạng 1e-xx

def qr_algorithm(A, n_iter=1000, eps=1e-5):
    A = np.array(A, dtype=float)
    n = A.shape[0]
    Q_total = np.eye(n)
    
    for _ in range(n_iter):
        Q, R = np.linalg.qr(A)
        A = R @ Q
        Q_total = Q_total @ Q
        
        # Check for convergence
        off_diagonal_norm = np.sqrt(np.sum(np.tril(A, -1)**2))
        if off_diagonal_norm < eps:
            break

    eigenvalues = np.diag(A)
    eigenvectors = Q_total
    return eigenvalues, eigenvectors

def my_diag(matrix):
    # Tìm trị riêng, vector riêng
    # eigenvalues, eigenvectors = np.linalg.eig(A)
    eigenvalues, eigenvectors = qr_algorithm(matrix, 1000, 1e-5)
    
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

# A = np.array([[3, -2, 0],
#              [-2, 3, 0],
#              [0, 0, 5]])


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