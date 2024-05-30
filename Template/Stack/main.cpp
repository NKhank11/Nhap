#include <iostream>
using namespace std;

template <class T>
class MyStack{
  private:
    T *ms;
    int count;
    int size;
  public:
    MyStack(int);
    void push(T);
    T pop();
    bool isEmpty();
};
//Cai dat cac phuong thuc
template <class T>
MyStack<T>::MyStack(int n){
  size = n;
  count = 0;
  ms = new T[size];
}

template <class T>
void MyStack<T>::push(T value){
  if(count == size){
    cout << "Stack is full" << endl;
  }
  else{
    ms[count++] = value;
  }
}

template <class T>
T MyStack<T>::pop(){
  if(count == 0){
    cout << "Stack is empty" << endl;
  }
  else{
    return ms[--count];
  }
}

template <class T>
bool MyStack<T>::isEmpty(){
  return count == 0;
}

int main(){
  MyStack<int> s(3);
  s.push(1);
  s.push(2);
  s.push(3);

  while(!s.isEmpty()){
    cout << s.pop() << " ";
  }
  return 0;
}