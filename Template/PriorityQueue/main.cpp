#include <iostream>
using namespace std;

template <class T>
class MyPriorityQueue {
  private:
    T *mpq;
    int count;
    int size;
  public:
    MyPriorityQueue(int);
    void push(T);
    T pop();
    bool isEmpty();
    T pop3();   //Lay phan tu lon thu 3 o hang doi uu tien
};

// Constructor
template <class T>
MyPriorityQueue<T>::MyPriorityQueue(int n) {
  size = n;
  count = 0;
  mpq = new T[size];
}

// Push method
template <class T>
void MyPriorityQueue<T>::push(T value) {
  if (count == size) {
    cout << "Priority Queue is full" << endl;
  } else {
    int i;
    for (i = count - 1; (i >= 0 && mpq[i] > value); i--) {
      mpq[i + 1] = mpq[i];
    }
    mpq[i + 1] = value;
    count++;
  }
}

// Pop method
template <class T>
T MyPriorityQueue<T>::pop() {
  if (count == 0) {
    cout << "Priority Queue is empty" << endl;
    return T();  // Return a default value of T
  } else {
    return mpq[--count];
  }
}

template <class T>
T MyPriorityQueue<T>::pop3() {
  if (count < 3) {
    cout << "Priority Queue has less than 3 elements" << endl;
    return T();
  } else {
    return mpq[count - 3];
  }
}

// Check if the queue is empty
template <class T>
bool MyPriorityQueue<T>::isEmpty() {
  return count == 0;
}

int main() {
  MyPriorityQueue<int> pq(5);
  pq.push(5);
  pq.push(1);
  pq.push(3);
  pq.push(4);
  pq.push(2);

  // while (!pq.isEmpty()) {
  //   cout << pq.pop() << " ";
  // }

  cout << "The third largest element in the priority queue is: " << pq.pop3() << endl;


  return 0;
}
