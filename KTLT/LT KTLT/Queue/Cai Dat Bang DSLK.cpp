#include <bits/stdc++.h>
using namespace std;
struct Node{
	int data;
	Node *next;
};
struct Queue{
	Node *head;
	Node *tail;
	int max;
	int size;
};
bool InItQueue(Queue &q, int n){
	q.head = NULL;
	q.tail = NULL;
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
// Tạo Node
Node *taoNode(int x){
	Node *newNode = new Node;
	newNode->data = x;
	newNode->next = NULL;
	return newNode;
}

// Thêm cuối
bool Push(Queue &q, int x){
	if(IsFull(q)) return false;
	Node *newNode = taoNode(x);
	if(IsEmpty(q)){
		q.head = q.tail = newNode;
		q.size++;
		return true;
	}
	q.tail->next = newNode;
	q.tail = newNode;
	q.size++;
	return true;
}

// Xóa đầu
bool Pop(Queue &q){
	if(IsEmpty(q)) return false;
	Node *del = q.head;
	q.head = q.head->next;
	delete del;
	if(q.head == NULL){
		q.head = q.tail = NULL;
	}
	q.size--;
	return true;
}

// Xem đầu, không xóa
int Front(Queue q){
	if(IsEmpty(q)) return false;
	return q.head->data;
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
	int n = 100;
	InItQueue(q, n);
	Push(q, 5);
	Push(q, 10);
	Push(q, -12);
	Pop(q);
	cout << Front(q) << endl;
	In(q);
	return 0;
}