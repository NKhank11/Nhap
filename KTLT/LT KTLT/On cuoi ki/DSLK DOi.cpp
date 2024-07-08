#include <iostream>
using namespace std;
struct Node{
	int data;
	Node *next;
	Node *prev;
};
Node *taoNode(int x){
	Node *newNode = new Node;
	newNode->data = x;
	newNode->next = NULL;
	newNode->prev = NULL;
	return newNode;
}
void themDau(Node *&, Node *&, int);
void themGiua(Node *&, Node *&, int, int );
void themCuoi(Node *&, Node *&, int );
void xoaDau(Node *&, Node *&);
void xoaGiua(Node *&, Node *&, int );
void xoaCuoi(Node *&, Node *&);
void in(Node *, Node *);
int SZ(Node *, Node *);
int main(){
	Node *head = NULL, *tail = NULL;
	int ok = 1;
	while(ok){
		cout << "-------------------\n";
		cout << "1. Them dau\n";
		cout << "2. Them giua\n";
		cout << "3. Them cuoi\n";
		cout << "4. Xoa dau\n";
		cout << "5. Xoa giua\n";
		cout << "6. Xoa cuoi\n";		
		cout << "7. In\n";
		cout << "0. Thoat\n";
		int tt;
		cout << "Nhap lua chon: ";
		cin >> tt;
		switch(tt){
			case 1:{
				int x;
				cin >> x;
				themDau(head, tail, x);
				break;
			}
			case 2:{
				int x, k;
				cin >> x >> k;
				themGiua(head, tail, x, k);
				break;
			}
			case 3:{
				int x;
				cin >> x;
				themCuoi(head, tail, x);
				break;
			}
			case 4:{
				xoaDau(head, tail);
				break;
			}
			case 5:{
				int k;
				cin >> k;
				xoaGiua(head, tail, k);
				break;
			}
			case 6:{
				xoaCuoi(head, tail);
				break;
			}
			case 7:{
				in(head, tail);
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
int SZ(Node *head, Node *tail){
	int dem = 0;
	while(head != NULL){
		dem++;
		head = head->next;
	}
	return dem;
}
void in(Node *head, Node *tail){
	cout << "DSLK hien tai: ";
	while(head != NULL){
		cout << head->data << " ";
		head = head->next;
	}
	cout << endl;
}
void themDau(Node *&head, Node *&tail, int value){
	Node *newNode = taoNode(value);
	newNode->next = head;
	if(head != NULL){
		head->prev = newNode;
	}
	head = newNode;
}
void themGiua(Node *&head, Node *&tail, int value, int pos){
	Node *newNode = taoNode(value);
	Node *cur = head;
	for(int i = 1; i <= pos - 1; i++){
		cur = cur->next;
	}
	newNode->next = cur;
	cur->prev->next = newNode;
	newNode->prev = cur->prev;
	cur->prev = newNode;
}
void themCuoi(Node *&head, Node *&tail, int value){
	Node *newNode = taoNode(value);
	Node *cur = tail;
	cur->next = newNode;
	newNode->prev = cur;
	tail = newNode;
}
void xoaDau(Node *&head, Node *&tail){
	if(head == NULL) return;
	Node *cur = head;
	head = head->next;
	if(head != NULL){
		head->prev = NULL;
	}
	delete cur;
}
void xoaCuoi(Node *&head, Node *&tail){
	Node *cur = tail;
	tail = cur->prev;
	cur->prev->next = NULL;
	delete cur;
}
void xoaGiua(Node *&head, Node *&tail, int pos){
	Node *cur = head;
	for(int i = 1; i <= pos - 1; i++){
		cur = cur->next;
	}
	cur->prev->next = cur->next;
	delete cur;
}