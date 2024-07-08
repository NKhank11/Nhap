#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
struct Queue{
	int *list;
	int max;
	int size;
};
bool InItQueue(Queue &q, int n){
	q.list = new int[n];
	if(q.list == NULL) return false;
	q.max = n;
	q.size = 0;
	return true;
}
bool IsEmpty(Queue q){
	if(q.size == 0) return true;
	return false;
}
bool IsFull(Queue q){
	if(q.size == q.max) return true;
	return false;
}

//Thêm cuối
bool Push(Queue &q, int x){
	if(IsFull(q)) return false;
	q.list[q.size] = x;
	q.size++;
	return true;
}

// Xóa đầu
bool Pop(Queue &q){
	if(IsEmpty(q)) return false;
	for(int i = 0; i < q.size; i++){
		q.list[i] = q.list[i+1];
	}
	q.size--;
	return true;
}

// Xem đầu, không xóa
int Front(Queue q){
	if(IsEmpty(q)) return INT_MIN;
	return q.list[0];
}

void In(Queue q){
	while(!IsEmpty(q)){
		cout << Front(q) << " ";
		Pop(q);
	}
	cout << endl;
}
int main(){
	Queue q;
	int n = 10;
	InItQueue(q, n);
	Push(q, 5);
	Push(q, 10);
	Push(q, 12);
	Push(q, -8);
	Push(q, 4);
	In(q);
	return 0;
}