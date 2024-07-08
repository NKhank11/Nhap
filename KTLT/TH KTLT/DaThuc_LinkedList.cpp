#include <iostream>
using namespace std;
struct DaThuc{
	int coSo;
	int soMu;
	DaThuc *next;
};
void nhap(DaThuc &x){
	cout << "\nNhap co so: ";
	cin >> x.coSo;
	cout << "Nhap so mu: ";
	cin >> x.soMu;
}
DaThuc *taoNode(DaThuc x){
	DaThuc *newNode = new DaThuc;
	newNode->coSo = x.coSo;
	newNode->soMu = x.soMu;
	newNode->next = NULL;
	return newNode;
}
void themCuoi(DaThuc *&head, DaThuc x){
	DaThuc *newNode = taoNode(x);
	DaThuc *cur = head;
	if(head == NULL){
		head = newNode;
		return;
	}
	while(cur->next != NULL){
		cur = cur->next;
	}
	cur->next = newNode;
	newNode->next = NULL;
}
void in(DaThuc *head){
	while(head != NULL){
		cout << head->coSo << "x^" << head->soMu;
		if(head->next != NULL) cout << " + ";
		head = head->next;
	}
	cout << endl;
}
void rutGon(DaThuc *&head){
	DaThuc *cur = head;
	while(cur != NULL && cur->next != NULL){
		if(cur->soMu == cur->next->soMu){
			cur->coSo += cur->next->coSo;
			DaThuc *del = cur->next;
			cur->next = del->next;
			delete del;
		}
		else{
			cur = cur->next;
		}
	}
}
int main(){
	DaThuc *head = NULL;
	int t;
	cout << "Ban muon nhap bao nhieu da thuc: ";
	cin >> t;
	while(t--){
		DaThuc x;
		nhap(x);
		themCuoi(head, x);
	}
	cout << endl;
	in(head);
	rutGon(head);
	in(head);
	return 0;
}