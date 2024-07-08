import numpy as np
np.set_printoptions(suppress=True)  # Khong hien thi so thuc theo dang 1e-xx

def Gauss_elimination(A):
    rows, cols = A.shape

    for c in range(cols):   # Duyet qua tung cot
        if np.all(A[:, c] == 0):    # Neu tat ca cac phan tu trong cot c deu bang 0 thi bo qua
            continue

        pivot = None
        for r in range(c, rows):    # Tim phan tu khac 0 dau tien trong cot c
            if A[r, c] != 0:
                pivot = r
                break

        if pivot is None:
            continue

        # Hoan vi dong chua pivot len vi tri cua dong c
        A[[c, pivot]] = A[[pivot, c]]

        # Bien cac phan tu duoi pivot ve 0
        for r in range(c + 1, rows):   
            factor = A[r, c] / A[c, c]
            A[r] = A[r] -  factor * A[c]

    return A

def back_substitution(A):   # Giai he phuong trinh bang phuong phap thay nguoc
    rank_A = np.linalg.matrix_rank([row[:-1] for row in A]) # Rank cua ma tran khong co cot cuoi cung
    rank_Ab = np.linalg.matrix_rank(A)  # Rank cua ma tran co cot cuoi cung

    n = A.shape[1] - 1  # So bien

    if rank_A < rank_Ab:
        return "He phuong trinh vo nghiem"
    elif rank_A == rank_Ab < n:
        anTuDo = n - rank_A
        return f"He phuong trinh co vo so nghiem, voi {anTuDo} an tu do"


    else:  
        print('He phuong trinh co nghiem duy nhat: ')
        x = [0] * n #Tao mang chua nghiem cua he phuong trinh
        for i in range(n-1, -1, -1): # Duyet tu dong cuoi cung den dong dau tien
            if A[i][i] != 0:    # Neu phan tu tren duong cheo chinh khac 0
                s = sum(A[i][j] * x[j] for j in range(i, n)) # Tinh tong cac phan tu tren duong cheo phia sau phan tu A[i][i]
                x[i] = (A[i][n] - s) / A[i][i]  # Tinh nghiem cua phuong trinh A[i][i] * x[i] + s =  A[i][n]
        return x
    


# A = np.array(
#     [[1, 2, -1, -1], 
#     [2, 2, 1, 1],
#     [3, 5, -2, -1]], dtype=float)

A = np.array(
    [[1, -2, -1, 1], 
    [2, -3, 1, 6],
    [3, -5, 0, 7],
    [1, 0, 5, 9]], dtype=float)
    
# A = np.array(
#     [[2, -4, -1, 1], 
#     [1, -3, 1, 1],
#     [3, -5, -3, 2]], dtype=float)

# A = np.array(
#     [[1, 2, 0, 2, 6],
#     [3, 5, -1, 6, 17],
#     [2, 4, 1, 2, 12],
#     [2, 0, -7, 11, 7]], dtype=float)

# A = np.array(
#     [[2, -4, 6, 8],
#     [1, -1, 1, -1],
#     [1, -3, 4, 0]], dtype=float)
    

# A = np.array(
#     [[1, 2, -2, 3], 
#     [3, -1, 1, 1],
#     [-1, 5, -5, 5]], dtype=float)




print ('Ma tran ban dau: ')
print(A)
print ('\n')

print ('Ma tran bac thang:')
A = Gauss_elimination(A)
print(A)
print ('\n')

print(back_substitution(A))