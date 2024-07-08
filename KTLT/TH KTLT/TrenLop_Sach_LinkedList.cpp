#include <iostream>
#include <string>
using namespace std;
struct TacGia {
	int n;
	string danhsach[5];
	void nhap() {
		cin >> n;
		cin.ignore();
		for (int i = 0; i < n; i++) {
			string s;
			getline(cin, s);
			danhsach[i] = s;
		}
	}
};
struct Sach {
	string tenSach;
	TacGia tacGia;
	string nhaXuatBan;
	int namXuatBan;
	void nhap() {
		getline(cin, tenSach);
		tacGia.nhap();
		getline(cin, nhaXuatBan);
		cin >> namXuatBan;
		cin.ignore();
	}
	void xuat() {
		cout << tenSach << "-" << tacGia.n << " tac gia" << "-" << nhaXuatBan << "-" << namXuatBan << endl;
	}
};
struct Node {
	Sach sach;
	Node* next;
};
Node *taoNode(Sach s) {
	Node* newNode = new Node;
	newNode->sach = s;
	newNode->next = NULL;
	return newNode;
}
void themCuoi(Node*& head, Sach s) {
	Node* cur = head;
	Node* newNode = taoNode(s);
	if (head == NULL) {
		head = newNode;
		return;
	}
	while (cur->next != NULL) {
		cur = cur->next;
	}
	cur->next = newNode;
	newNode->next = NULL;
}
void in(Node* head) {
	Node* cur = head;
	while (cur != NULL) {
		cur->sach.xuat();
	}
}
int main() {
	Node* head = NULL;
	int namXuatBan, soLuong;
	string nhaXuatBan, tacGia;
	cin >> namXuatBan;
	cin.ignore();
	getline(cin, nhaXuatBan);
	getline(cin, tacGia);
	cin >> soLuong;
	cin.ignore();
	for (int i = 0; i < soLuong; i++) {
		Sach s;
		s.nhap();
		themCuoi(head, s);
	}
	Node* cur = head;
	while (cur != NULL) {
		cur->sach.xuat();
		cur = cur->next;
	}
	int soLuongTG = 0, soLuongNXB = 0;
	for (Node* i = head; i != NULL; i = i->next) {
		for (int j = 0; j < (i->sach).tacGia.n; j++) {
			if ((i->sach).tacGia.danhsach[j] == tacGia) {
				soLuongTG++;
			}
		}
	}
	cout << soLuongTG << endl;
	for (Node* i = head; i != NULL; i = i->next) {
		if ((i->sach).nhaXuatBan == nhaXuatBan && (i->sach).namXuatBan == namXuatBan) {
			soLuongNXB++;
		}
	}
	cout << soLuongNXB << endl;
	for (Node* i = head; i != NULL; i = i->next) {
		if ((i->sach).nhaXuatBan == nhaXuatBan && (i->sach).namXuatBan == namXuatBan) {
			(i->sach).xuat();
		}
	}
	return 0;
}