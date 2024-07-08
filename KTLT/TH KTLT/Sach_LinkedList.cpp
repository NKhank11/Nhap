#include <iostream>
#include <string>
using namespace std;
struct Sach{
	string tenSach;
	string tacGia;
	string nhaXuatBan;
	int namXuatBan;
	Sach *next;
};
void nhap(Sach &s){
	cout << endl;
	cin.ignore();
	cout << "Nhap ten sach: ";
	getline(cin, s.tenSach);
	cout << "Nhap ten tac gia: ";
	getline(cin, s.tacGia);
	cout << "Nhap nha xuat ban: ";
	getline(cin, s.nhaXuatBan);
	cout << "Nhap nam xuat ban: ";
	cin >> s.namXuatBan;
}
Sach *taoNode(Sach s){
	Sach *newNode = new Sach;
	newNode->tenSach = s.tenSach;
	newNode->tacGia = s.tacGia;
	newNode->nhaXuatBan = s.nhaXuatBan;
	newNode->namXuatBan = s.namXuatBan;
	newNode->next = NULL;
	return newNode;
}
void themCuoi(Sach *&head, Sach s){
	Sach *newNode = taoNode(s);
	Sach *cur = head;
	if(cur == NULL){
		head = newNode;
		return;
	}
	while(cur->next != NULL){
		cur = cur->next;
	}
	cur->next = newNode;
	newNode->next = NULL;
}
void in(Sach *head){
	while(head != NULL){
		cout << "\nTen sach: " << head->tenSach << endl;
		cout << "Tac gia: " << head->tacGia << endl;
		cout << "Nha xuat ban: " << head->nhaXuatBan << endl;
		cout << "Nam xuat ban: " << head->namXuatBan << endl;
		head = head->next;
	}
	cout << endl;
	
}
int solveb(Sach *head, string tacGia){
	Sach *cur = head;
	int cnt = 0;
	while(cur != NULL){
		if(tacGia == cur->tacGia){
			cnt++;
		}
		cur = cur->next;
	}
	return cnt;
}
void solvec(Sach *head, string nxb, int namXb){
	Sach *cur = head;
	while(cur != NULL){
		if(nxb == cur->nhaXuatBan && cur->namXuatBan == namXb){
			cout << cur->tenSach << endl;
		}
		cur = cur->next;
	}
}
using namespace std;
int main(){
	Sach *head = NULL;
	int t;
	cout << "Nhap so cuon sach co trong thu vien: ";
	cin >> t;
	while(t--){
		Sach s;
		nhap(s);
		themCuoi(head, s);
	}
	cout << "---------------Thong tin cac cuon sach co trong thu vien--------------- ";
	in(head);
	
	cout << "\n-------So sach cua tac gia---------\n";
	string tacGia;
	cout << "Nhap ten tac gia: ";
	cin.ignore();
	getline(cin, tacGia);
	cout << "So luong sach cua tac gia " << tacGia << " la: " << solveb(head, tacGia) << endl;
	
	cout << "\n-------Nhung cuon sach da phat hanh-----\n";
	cout << "Nhap nha xuat ban: ";
	string nxb;
	getline(cin, nxb);
	cout << "Nhap nam xuat ban: ";
	int namXb;
	cin >> namXb;
	solvec(head, nxb, namXb);
	return 0;
}