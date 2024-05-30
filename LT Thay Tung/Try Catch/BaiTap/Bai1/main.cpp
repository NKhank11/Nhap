#include <iostream>
#include <cmath>
using namespace std;

class MyStack {
  private:
    int top;
    int arr[10]; // Giới hạn mảng thành 10 phần tử

  public:
    MyStack() {
      top = -1;
    }

    void push(int value) {
      if (top >= 9) { // Thay đổi điều kiện kiểm tra để phù hợp với kích thước tối đa
        throw "Stack is full";
      }
      arr[++top] = value;
    }

    int pop() {
      if (top < 0) {
        throw "Stack is empty";
      }
      return arr[top--];
    }

    int peek() {
      if (top < 0) {
        throw "Stack is empty";
      }
      return arr[top];
    }

    bool isEmpty() {
      return top < 0;
    }

    int size() {
      return top + 1;
    }
};

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

int main() {
  MyStack stack;
  int n;
  
  while (true) {
    n = rand() % 10 + 1; // Sinh số ngẫu nhiên từ 1 đến 10
    cout << "So ngau nhien: " << n << endl;
    
    try {
      if (isPrime(n)) {
        throw 1;
      }
      stack.push(n);
    } catch (int) {
      cout << "La so nguyen to, khong them vao stack" << endl;
    } catch (const char* msg) {
      cout << msg << endl;
      break;
    }

    if (stack.size() >= 10) { // Kiểm tra nếu stack đầy
      cout << "Day stack, khong the them vao" << endl;
      break;
    }
  }

  // In stack ra
  cout << "Stack hien tai: ";
  while (!stack.isEmpty()) {
    cout << stack.pop() << " ";
  }
  cout << endl;

  return 0;
}
