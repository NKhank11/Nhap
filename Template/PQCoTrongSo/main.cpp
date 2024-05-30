#include <iostream>
using namespace std;

// Structure to represent elements in the priority queue
struct Element {
    int id;       // Mã số
    int weight;   // Trọng số

    // Overload the comparison operator to give priority to higher weights
    bool operator>(const Element& other) const {
        return weight > other.weight;
    }
};

// Priority Queue class
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
    int countElements();
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

// Check if the queue is empty
template <class T>
bool MyPriorityQueue<T>::isEmpty() {
    return count == 0;
}

// Count elements in the queue
template <class T>
int MyPriorityQueue<T>::countElements() {
    return count;
}

int main() {
    MyPriorityQueue<Element> pq(5);
    
    pq.push({1, 50});
    pq.push({2, 30});
    pq.push({3, 40});
    pq.push({4, 60});
    pq.push({5, 20});

    cout << "Number of elements in the priority queue: " << pq.countElements() << endl;

    while (!pq.isEmpty()) {
        Element e = pq.pop();
        cout << "Popped element: ID = " << e.id << ", Weight = " << e.weight << endl;
    }
    
    return 0;
}
