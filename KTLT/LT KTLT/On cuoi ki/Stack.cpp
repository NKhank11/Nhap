/*#include <bits/stdc++.h>
using namespace std;
struct Stack{
	int *list;
	int max;
	int size;
};
bool khoiTao(Stack &s, int);
bool isEmpty(Stack );
bool isFull(Stack );
void push(Stack &, int );
void pop(Stack &);
int top(Stack );
void in(Stack );
int main(){
	Stack s;
	int n = 100;
	khoiTao(s, n);
	int ok = 1;
	while(ok){
		cout << "1.Push\n2.Pop\n3.Top\n4.In\n5.Thoat\n";
		int choice;
		cout << "Nhap lua chon: ";
		cin >> choice;
		switch(choice){
			case 1:{
				int value;
				cin >> value;
				push(s, value);
				break;
			}
			case 2:{
				pop(s);
				break;
			}
			case 3:{
				cout << top(s) << endl;
				break;
			}
			case 4:{
				in(s);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Thoat chuong trinh !";
				break;
			}
			default:{
				cout << "Cu phap khong hop le !";
				break;
			}
		}
	}
	return 0;
}
bool khoiTao(Stack &s, int n){
	s.list = new int[n];
	if(s.list == NULL) return false;
	s.max = n;
	s.size = 0;
	return true;
}
bool isEmpty(Stack s){
	return s.size == 0;
}
bool isFull(Stack s){
	return s.size == s.max;
}
void push(Stack &s, int value){
	if(isFull(s)) return;
	s.list[s.size] = value;
	s.size++;
}
void pop(Stack &s){
	if(isEmpty(s)) return;
	s.size--;
}
int top(Stack s){
	if(isEmpty(s)) return INT_MIN;
	return s.list[s.size - 1];
}
void in(Stack s){
	for(int i = s.size - 1; i >= 0; i --){
		cout << s.list[i] << " ";
	}
	cout << endl;
}*/
/*#include <iostream>
using namespace std;
struct Node{
	int data;
	Node *next;
};
struct Stack{
	Node *head;
	Node *tail;
	int max;
	int size;
};
Node *taoNode(int x){
	Node *newNode = new Node;
	newNode->data = x;
	newNode->next = NULL;
	return newNode;
}
bool khoiTao(Stack &, int );
bool isEmpty(Stack );
bool isFull(Stack );
void push(Stack &, int );
void pop(Stack & );
int top(Stack );
void in(Stack );
int main(){
	Stack s;
	int n = 100;
	khoiTao(s, n);
	int ok = 1;
	while(ok){
		cout << "1.Push\n2.Pop\n3.Top\n4.In\n5.Thoat\n";
		int choice;
		cout << "Nhap lua chon: ";
		cin >> choice;
		switch(choice){
			case 1:{
				int value;
				cin >> value;
				push(s, value);
				break;
			}
			case 2:{
				pop(s);
				break;
			}
			case 3:{
				cout << top(s) << endl;
				break;
			}
			case 4:{
				in(s);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Thoat chuong trinh !";
				break;
			}
			default:{
				cout << "Cu phap khong hop le !";
				break;
			}
		}
	}
	return 0;
}
bool khoiTao(Stack &s, int n){
	s.head = NULL;
	s.tail = NULL;
	s.max = n;
	s.size = 0;
	return true;
}
bool isEmpty(Stack s){
	return s.size == 0;
}
bool isFull(Stack s){
	return s.size == s.max;
}
void push(Stack &s, int value){
	Node *newNode = taoNode(value);
	if(isFull(s)) return;
	if(isEmpty(s)){
		s.head = s.tail = newNode;
		s.size++;
		return;
	}
	s.tail->next = newNode;
	s.tail = newNode;
	s.size++;
}
void pop(Stack &s){
	if(isEmpty(s)) return;
	if(s.head == s.tail){
		s.head = s.tail = NULL;
		s.size--;
	}
	Node *del = s.tail;
	Node *cur = s.head;
	while(cur->next != s.tail){
		cur = cur->next;
	}
	cur->next = NULL;
	delete del;
	s.size--;
}
int top(Stack s){
	if(isEmpty(s)) return INT_MIN;
	return s.tail->data;
}
void in(Stack s){
	Node *cur = s.head;
	while(cur != NULL){
		cout << cur->data << " ";
		cur = cur->next;
	}
	cout << endl;
}*/

/*// Cai queue bang mang
#include <bits/stdc++.h>
using namespace std;
struct Queue{
	int *list;
	int max;
	int size;
};
bool khoiTao(Queue &, int );
bool isEmpty(Queue );
bool isFull(Queue );
void push(Queue &, int );
void pop(Queue &);
int front(Queue );
void in(Queue );
int main(){
	Queue q;
	int n = 100;
	khoiTao(q, n);
	int ok = 1;
	while(ok){
		cout << "1.Push\n2.Pop\n3.Front\n4.In\n0.Thoat\n";
		int choice;
		cout << "Nhap lua chon: ";
		cin >> choice;
		switch(choice){
			case 1:{
				int value;
				cin >> value;
				push(q, value);
				break;
			}
			case 2:{
				pop(q);
				break;
			}
			case 3:{
				cout << front(q) << endl;
				break;
			}
			case 4:{
				in(q);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Thoat chuong trinh !";
				break;
			}
			default:{
				cout << "Cu phap khong hop le !";
				break;
			}
		}
	}
	return 0;
}
bool khoiTao(Queue &q, int n){
	q.list = new int[n];
	q.max = n;
	q.size = 0;
	return true;
}
bool isEmpty(Queue q){
	return q.size == 0;
}
bool isFull(Queue q){
	return q.size == q.max;
}
void push(Queue &q, int value){
	if(isFull(q)) return;
	q.list[q.size] = value;
	q.size++;
}
void pop(Queue &q){
	if(isEmpty(q)) return;
	for(int i = 0; i < q.size; i++){
		q.list[i] = q.list[i+1];
	}
	q.size--;
}
int front(Queue q){
	if(isEmpty(q)) return INT_MIN;
	return q.list[0];
}
void in(Queue q){
	for(int i = 0; i < q.size; i++){
		cout << q.list[i] << " ";
	}
	cout << endl;
}*/

// Cai queue bang dslk
#include <iostream>
using namespace std;
struct Node{
	int data;
	Node *next;
};
Node *taoNode(int value){
	Node *newNode = new Node;
	newNode->data = value;
	newNode->next = NULL;
	return newNode;
}
struct Queue{
	Node *head;
	Node *tail;
	int max;
	int size;
};
bool khoiTao(Queue &, int );
bool isEmpty(Queue );
bool isFull(Queue );
void push(Queue &, int );
void pop(Queue &);
int front(Queue );
void in(Queue);
int main(){
	Queue q;
	int n = 100;
	khoiTao(q, n);
	int ok = 1;
	while(ok){
		cout << "1.Push\n2.Pop\n3.Front\n4.In\n0.Thoat\n";
		int choice;
		cout << "Nhap lua chon: ";
		cin >> choice;
		switch(choice){
			case 1:{
				int value;
				cin >> value;
				push(q, value);
				break;
			}
			case 2:{
				pop(q);
				break;
			}
			case 3:{
				cout << front(q) << endl;
				break;
			}
			case 4:{
				in(q);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Thoat chuong trinh !";
				break;
			}
			default:{
				cout << "Cu phap khong hop le !";
				break;
			}
		}
	}
	return 0;
}
bool khoiTao(Queue &q, int n){
	q.head = NULL;
	q.tail = NULL;
	q.max = n;
	q.size = 0;
	return true;
}
bool isEmpty(Queue q){
	return q.size == 0;
}
bool isFull(Queue q){
	return q.size == q.max;
}
void push(Queue &q, int value){
	Node *newNode = taoNode(value);
	if(isFull(q)) return;
	if(isEmpty(q)){
		q.head = q.tail = newNode;
		q.size++;
		return;
	}
	q.tail->next = newNode;
	q.tail = newNode;
	q.size++;
}
void pop(Queue &q){
	if(isEmpty(q)) return;
	Node *del = q.head;
	q.head = q.head->next;
	delete del;
	if(q.head == NULL) q.head = q.tail = NULL;
	q.size--;
}
int front(Queue q){
	if(isEmpty(q)) return INT_MIN;
	return q.head->data;
}
void in(Queue q){
	while(q.head != NULL){
		cout << q.head->data << " ";
		q.head = q.head->next;
	}
	cout << endl;
}