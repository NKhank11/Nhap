#include <iostream>
using namespace std;
template <class T>
class MyQueue{
  private:
    T *mq;
    int count;
    int size;
  public:
    MyQueue(int);
    void push(T);
    T pop();
    bool isEmpty();
};

template <class T>
MyQueue<T>::MyQueue(int n){
  size = n;
  count = 0;
  mq = new T[size];
}

template <class T>
void MyQueue<T>::push(T value){
  if(count == size){
    cout << "Queue is full" << endl;
  }
  else{
    mq[count++] = value;
  }
}

template <class T>
T MyQueue<T>::pop(){
  if(count == 0){
    cout << "Queue is empty" << endl;
  }
  else{
    T temp = mq[0];
    for(int i = 0; i < count - 1; i++){
      mq[i] = mq[i + 1];
    }
    count--;
    return temp;
  }
}

template <class T>
bool MyQueue<T>::isEmpty(){
  return count == 0;
}
int main(){
  MyQueue<int> q(3);
  q.push(1);
  q.push(2);
  q.push(3);

  while(!q.isEmpty()){
    cout << q.pop() << " ";
  }
  return 0;
}