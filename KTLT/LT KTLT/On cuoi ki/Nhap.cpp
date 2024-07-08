/*#include <iostream>
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
int SZ(Node *head, Node *tail){
	int cnt = 0;
	while(head != NULL){
		cnt++;
		head = head->next;
	}
	return cnt;
}
void them(Node *&head, Node *&tail, int x, int k){
	Node *newNode = taoNode(x);
	if(k < 1 || k > SZ(head, tail) + 1) return;
	if(k == 1){
		newNode->next = head;
		head = newNode;
		return;
	}
	else if(k == SZ(head, tail)){
		tail->next = newNode;
		tail = newNode;
	}
	else{
		Node *cur = head;
		for(int i = 1; i <= k - 2; i++){
			cur = cur->next;
		}
		newNode->next = cur->next;
		cur->next = newNode;
	}
}
void in(Node *head, Node *tail){
	while(head != NULL){
		cout << head->data << " ";
		head = head->next;
	}
	cout << endl;
}
int main(){
	Node *head = NULL, *tail = NULL;
	int ok = 1;
	while(ok){
		cout << "1. Them\n2. Xoa\n3. In\n0. Thoat\n";
		cout << "Nhap thao tac: ";
		int tt;
		cin >> tt;
		switch(tt){
			case 1:{
				int k, x;
				cout << "Nhap gia tri va vi tri can them: ";
				cin >> x >> k;
				them(head, tail, x, k);
				break;
			}
			case 2:{
				int k;
				cout << "Nhap vi tri can xoa: ";
				cin >> k;
				xoa(head, tail, k);
				break;
			}
			case 3:{
				cout << "Danh sach lien ket hien tai: ";
				in(head, tail);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Chuong trinh da thoat !";
				break;
			}
			default:{
				cout << "Du lieu khong hop le, vui long nhap lai !\n";
				break;
			}
		}
	}
	return 0;
}*/

/*// Dao nguoc cac phan tu trong mang dung de quy
#include <bits/stdc++.h>
using namespace std;
void DaoNguoc(int *&a, int i, int n){
	int l = i, r = n - 1;
	if(l >= r) return;
	swap(a[l], a[r]);
	DaoNguoc(a, i + 1, n - 1);
}
int main(){
	int n;
	cin >> n;
	int *a = new int[n];
	for(int i = 0; i < n; i++) cin >> a[i];
	DaoNguoc(a, 0, n);
	for(int i = 0; i < n; i++) cout << a[i] << " ";
	return 0;
}*/

/*// Tinh tong cac gia tri lon hon gia tri dung lien truoc
// Vd 2 3 4 1 => 3 + 4 = 7
#include <bits/stdc++.h>
using namespace std;
void nhapMang(int *&a , int &n){
	cin >> n;
	a = new int [n];
	for(int i = 0; i < n; i++) cin >> a[i];
}
int sum = 0;
int tinhTong(int *a, int n){
	if(n == 0) return sum;
	if(a[n] > a[n - 1]) sum += a[n];
	tinhTong(a, n - 1);
}
int main(){
	int *a = NULL;
	int n;
	nhapMang(a, n);
	n = n - 1;
	cout << tinhTong(a, n);
	return 0;
}*/

/*//Dem cac gia tri phan biet trong mang
#include <bits/stdc++.h>
using namespace std;
void NhapMang(int *&a, int &n){
	cin >> n;
	a = new int[n];
	for(int i = 0; i < n; i++){
		cin >> a[i];
	}
}
int ok[100] = {0};
int cnt = 0;
int dem(int *a, int n){
	int i = n - 1;
	if(i == -1) return cnt;
	if(ok[a[i]] == 0){
		ok[a[i]] = 1;
		cnt++;
	}
	dem(a, n - 1);
}
int main(){
	int *a = NULL;
	int n;
	NhapMang(a, n);
	cout << dem(a, n);
	return 0;
}*/

/*// Dem so chinh phuong trong mang
#include <bits/stdc++.h>
using namespace std;
void nhapMang(int *&a, int &n){
	cin >> n;
	a = new int[n];
	for(int i = 0; i < n; i++){
		cin >> a[i];
	}
}
bool check(int n){
	int sqr = sqrt(n);
	return sqr * sqr == n;
}
int cnt = 0;
int dem(int *a, int n){
	int i = n - 1;
	if(i == -1) return cnt;
	if(check(a[i])) cnt++;
	dem(a, n - 1);
}
int main(){
	int *a = NULL;
	int n;
	nhapMang(a, n);
	cout << dem(a, n);
	return 0;
}*/
