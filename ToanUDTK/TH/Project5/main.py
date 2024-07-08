import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
np.set_printoptions(suppress=True)  # Không hiển thị số thực theo dạng 1e-xx

df = pd.read_csv('wine.csv')
print(df)

# Hàm chuyển vị ma trận
def transpose(A):
    if len(A.shape) == 1:
        A = A.reshape(-1, 1)
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

# Hàm tính theta
def theta(A, b):
    A_transpose_A = matrix_multiply(A.T, A)
    A_transpose_b = matrix_multiply(A.T, b)
    A_transpose_A_inv = inverse(A_transpose_A)
    return matrix_multiply(A_transpose_A_inv, A_transpose_b)

# Hàm tính norm
def norm(A, b, theta):
    error_vector = matrix_multiply(A, theta)  # Tính A * theta
    for i in range(len(error_vector)):
        error_vector[i] -= b[i][0]            # Trừ đi b
    sum_of_squares = 0
    for x in error_vector:
        sum_of_squares += x**2
    return sum_of_squares ** 0.5

# Hàm lấy ma trận A và vector b từ dữ liệu
def getAb(x, y):
    col1 = np.ones(len(x))  # Tạo mảng phần tử 1 với số phần tử bằng số phần tử của x
    colx = transpose(np.array(x))  # Chuyển vị ma trận x
    A = transpose(np.vstack((col1, colx)))   # Gộp cột 1 và cột x
    b = np.array(y).reshape(len(y), 1)  # Chuyển y thành ma trận cột
    return A, b

#Cau a
# Hàm xây dựng mô hình tuyến tính
def linear_model():
  x = (df.iloc[:, 1:12]).to_numpy() # Lấy các cột từ 1 đến 11
  y = (df.iloc[:, 0]).to_numpy()    # Lấy cột 0
  A, b = getAb(x, y)   
  print(theta(A, b)) 
  print(norm(A, b, theta(A, b)))

# Hàm hiển thị biểu đồ
def show(xs, ys, theta):
    plt.plot(xs, ys, "o", color="blue") # Vẽ các điểm dữ liệu
    ts = np.linspace(np.min(xs), np.max(xs), 50) # Tạo 50 điểm trong khoảng từ min(xs) đến max(xs)
    yts = theta[0] + theta[1] * ts  # Tính giá trị y tương ứng với các điểm ts
    plt.plot(ts, yts, color="red")
    plt.xlabel("X")
    plt.ylabel("Y")
    plt.title("Linear Model")
    plt.legend(["Data points", "Line of regression"])
    plt.grid(True)
    plt.show()


#Cau b
def best_model():
    y = df.iloc[:, 0].to_numpy()
    min_norm = None  # Initialize to None to ensure proper comparison

    for i in range(1, 12):
        x = df.iloc[:, i].to_numpy()
        A, b = getAb(x, y)
        current_theta = theta(A, b)
        cur_norm = norm(A, b, current_theta)
        
        print(f"Norm cho đặc trưng {df.columns[i]} là: {cur_norm}\n")

        if min_norm is None or cur_norm < min_norm:
            min_norm = cur_norm
            best_feature = x
            best_feature_index = i
            best_theta = current_theta

    print(f"Đặc trưng có norm nhỏ nhất: {df.columns[best_feature_index]}")
    print(f"Giá trị norm nhỏ nhất: {min_norm}")

    show(best_feature, y, best_theta)
    print('\n')


#Cau c: Xay dung mo hinh cho ket qua tot nhat. Chon mo hinh Y = theta1 + theta2 * X + theta3 * X^2
def getAb_my_model(x, y):
    col1 = np.ones(len(x))
    colx = transpose(np.array(x))
    A = transpose(np.vstack((col1, colx, colx**2)))
    b = np.array(y).reshape(len(y), 1)
    return A, b


def my_model():
    x = df.iloc[:, 1:12].to_numpy()
    y = df.iloc[:, 0].to_numpy()
    A, b = getAb_my_model(x, y)
    model_theta = theta(A, b)
    model_norm = norm(A, b, model_theta)
    print("Theta values:", model_theta)
    print("Norm value:", model_norm)
    

linear_model()
best_model()
my_model()