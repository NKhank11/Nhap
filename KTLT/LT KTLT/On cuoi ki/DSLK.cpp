#include <bits/stdc++.h>
using namespace std;
struct Node{
	int data;
	Node *next;
};
Node *taoNode(int x){
	Node *newNode = new Node;
	newNode->data = x;
	newNode->next = NULL;
	return newNode;
}
int SZ(Node *, Node *);
void themDau(Node *&, Node *&, int );
void themGiua(Node *&, Node *&, int, int );
void themVaoSauGiaTri(Node *&, Node *&, int, int );
void themVaoSauNode(Node *&, Node *&, Node *, int);
void themCuoi(Node *&, Node *&, int );
void xoaDau(Node *&, Node *&);
void xoaGiua(Node *&, Node *&, int);
void xoaNode(Node *&, Node *&, Node *);
void xoaCuoi(Node *&, Node *&);
void xoaGiaTri(Node *&, Node *&, int );
void daoNguoc(Node *&, Node *&);
void in(Node *, Node *);
void phanTuLonHonXungQuanh(Node *, Node *);
void dslkMoi(Node *, Node *);
void bonOXungQuanh(Node *, Node *);
void duaVeCuoi(Node *&, Node *&, Node *);
void menu();
Node *head = NULL, *tail = NULL;
int main(){
	menu();
	return 0;
}
void menu(){
	bool ok = 1;
	while(ok){
		cout << "-------------------\n";
		cout << "1. Them dau\n";
		cout << "2. Them giua\n";
		cout << "3. Them vao sau gia tri\n";
		cout << "4. Them vao sau Node\n";
		cout << "5. Them cuoi\n";
		cout << "6. Xoa dau\n";
		cout << "7. Xoa giua\n";
		cout << "8. Xoa Node\n";
		cout << "9. Xoa cuoi\n";
		cout << "10. Xoa gia tri\n";
		cout << "11. Duyet\n";
		cout << "12. Phan tu lon nhat\n";
		cout << "13. Phan tu chan dau tien\n";
		cout << "14. Phan tu lon hon cac phan tu xung quanh\n";
		cout << "15. DSLK moi\n";
		cout << "16. 2 trai, 2 phai\n";
		cout << "17. Dao nguoc\n";
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
				int valueFind, valueIns;
				cin >> valueFind >> valueIns;
				themVaoSauGiaTri(head, tail, valueFind, valueIns);
				break;
			}
			case 5:{
				int value;
				cin >> value;
				themCuoi(head, tail, value);
				break;
			}
			case 6:{
				xoaDau(head, tail);
				break;
			}
			case 7:{
				int pos;
				cin >> pos;
				xoaGiua(head, tail, pos);
				break;
			}
			case 9:{
				xoaCuoi(head, tail);
				break;
			}
			case 10:{
				int value;
				cin >> value;
				xoaGiaTri(head, tail, value);
				break;
			}
			case 11:{
				in(head, tail);
				break;
			}
			case 14:{
				cout << "Cac phan tu can tim: ";
				phanTuLonHonXungQuanh(head, tail);
				break;
			}
			case 15:{
				cout << "DSLK moi: ";
				dslkMoi(head, tail);
				break;
			}
			case 16:{
				bonOXungQuanh(head, tail);
				break;
			}
			case 17:{
				daoNguoc(head, tail);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Thoat chuong trinh !";
				break;
			}
			default:{
				cout << "Cu phap khong hop le! ";
				break;
			}
		}
	}
}
int SZ(Node *head, Node *tail){
	int cnt = 0;
	while(head != NULL){
		cnt++;
		head = head->next;
	}
	return cnt;
}
void themDau(Node *&head, Node *&tail, int value){
	Node *newNode = taoNode(value);
	if(head == NULL){
		head = tail = newNode;
		return;
	}
	newNode->next = head;
	head = newNode;
}
void themGiua(Node *&head, Node *&tail, int value, int pos){
	Node *newNode = taoNode(value);
	if(head == NULL){
		head = tail = newNode;
		return;
	}
	if(pos <= 1 || pos > SZ(head, tail)) return;
	Node *cur = head;
	for(int i = 1; i <= pos - 2; i ++){
		cur = cur->next;
	}
	newNode->next = cur->next;
	cur->next = newNode;
}
void themCuoi(Node *&head, Node *&tail, int value){
	Node *newNode = taoNode(value);
	if(head == NULL){
		head = tail = newNode;
		return;
	}
	tail->next = newNode;
	tail = newNode;
}
void themVaoSauGiaTri(Node *&head, Node *&tail, int valueFind, int valueIns){
	// Them vao sau gia tri gap dau tien
	Node *cur = head;
	while(cur->data != valueFind){
		cur = cur->next;
	}
	if(cur == NULL){
		return;
	}
	Node *newNode = taoNode(valueIns);
	newNode->next = cur->next;
	cur->next = newNode;
}
void themVaoSauNode(Node *&head, Node *&tail, Node *p, int value){
	Node *newNode = taoNode(value);
	Node *cur = head;
	while(cur != p){
		cur = cur->next;
	}
	newNode->next = cur->next;
	cur->next = newNode;
}
void xoaDau(Node *&head, Node *&tail){
	if(head == NULL) return;
	if(head == tail){
		head = tail = NULL;
		return;
	}
	Node *cur = head;
	head = head->next;
	delete cur;
}
void xoaCuoi(Node *&head, Node *&tail){
	Node *cur = head;
	while(cur->next != tail){
		cur = cur->next;
	}
	cur->next = NULL;
	tail = cur;
}
void xoaGiua(Node *&head, Node *&tail, int pos){
	Node *cur = head;
	for(int i = 1; i <= pos - 2; i++){
		cur = cur->next;
	}
	Node *del = cur->next;
	cur->next = del->next;
	delete del;
}
void xoaNode(Node *&head, Node *&tail, Node *p){
	Node *cur = head;
	while(cur->next != p){
		cur = cur->next;
	}
	cur->next = p->next;
	delete p;
}
void xoaGiaTri(Node *&head, Node *&tail, int valueRemove){
	int dem = 0;
	Node *temp = head;
	while(temp != NULL){
		if(temp->data == valueRemove) dem++;
		temp = temp->next;
	}
	while(dem--){
		Node *cur = head;
		while(cur->next->data != valueRemove){
			cur = cur->next;
		}
		Node *del = cur->next;
		cur->next = del->next;
		delete del;		
	}

}
void in(Node *head, Node *tail){
	cout << "DSLK hien tai: ";
	while(head != NULL){
		cout << head->data << " ";
		head = head->next;
	}
	cout << endl;
}
void daoNguoc(Node *&head, Node *&tail){
	Node *prev = NULL, *cur = head, *next = NULL;
	while(cur != NULL){
		next = cur->next;
		cur->next = prev;
		prev = cur;
		cur = next;
	}
	head = prev;
}
void phanTuLonHonXungQuanh(Node *head, Node *tail){
	if(head->next == NULL){
		cout << head->data;
		return;
	}
	Node *prev = NULL;
	Node *cur = head;
	while(cur != NULL){
		if(prev == NULL){
			if(cur->data > cur->next->data) cout << cur->data << " ";
		}
		else if(cur->next == NULL){
			if(cur->data > prev->data) cout << cur->data << " ";
		}
		else{
			if(cur->data > prev->data && cur->data > cur->next->data) cout << cur->data << " ";
		}
		prev = cur;
		cur = cur->next;
	}
	cout << endl;
}
void dslkMoi(Node *head, Node *tail){
	Node *cur = head;
	while(cur != NULL){
		int max = cur->data;
		for(Node *i = cur; i != NULL; i = i ->next){
			if(i->data > max){
				max = i->data;
				break;
			}
		}
		cur->data = max;
		cur = cur->next;
	}
	in(head, tail);
}
void bonOXungQuanh(Node *head, Node *tail){
	Node *prev1 = NULL, *prev2 = NULL, *cur = head;
	while(cur != NULL){
		if(prev1 == NULL && prev2 == NULL){
			if(cur->data > cur->next->data && cur->data > cur->next->next->data){
				duaVeCuoi(head, tail, cur);
			}
		}
		else if(prev2 == NULL){
			if(cur->data > prev1->data && cur->data > cur->next->data && cur->data > cur->next->next->data){
				duaVeCuoi(head, tail, cur);
			}
		}
		else if(cur->next == NULL && cur->next->next == NULL){
			if(cur->data > prev2->data && cur->data > prev1->data){
				duaVeCuoi(head, tail, cur);
			}
		}
		else if(cur->next->next == NULL){
			if(cur->data > prev2->data && cur->data > prev1->data && cur->data > cur->next->data){
				duaVeCuoi(head, tail, cur);
			}
		}
		else{
			if(cur->data > prev2->data && cur->data > prev1->data &&
			cur->data > cur->next->data && cur->data > cur->next->next->data ){
				duaVeCuoi(head, tail, cur);
			}
		}
		prev2 = prev1;
		prev1 = cur;
		cur = cur->next;
	}
	in(head, tail);
}
void duaVeCuoi(Node *&head, Node *&tail, Node *p){
	Node *cur = head;
	while(cur->next != p){
		cur = cur->next;
	}
	cur->next = p->next;
	tail->next = p;
	p->next = NULL;
	tail = p;
}