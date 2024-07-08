#include <bits/stdc++.h>
using namespace std;
struct node{
	int data;
	struct node *next;
};
struct linkedList{
	node *head;
	node *tail;
};
void khoiTao(linkedList &list){
	list.head = list.tail = NULL;
}
bool kiemTraRong(linkedList list){
	if(list.head == NULL && list.tail == NULL){
		return true;
	}
	return false;
}
node *taoNode(int x){
	node *newNode = new node;
	if(newNode == NULL){
		cout << "Khong du vung nho" << endl;
		return NULL;
	}
	newNode->data = x;
	newNode->next = NULL;
	return newNode;
}
void themVaoRong(linkedList &list, int x){
	node *newNode = taoNode(x);
	list.head = list.tail = newNode;
}
void themVaoDau(linkedList &list, int x){
	if(kiemTraRong(list) == true){
		themVaoRong(list, x);
		return;
	}
	node *newNode = taoNode(x);
	newNode->next = list.head;
	list.head = newNode;
}
void themVaoCuoi(linkedList &list, int x){
	node *newNode = taoNode(x);
	if(kiemTraRong(list) == true){
		themVaoRong(list, x);
		return;
	}
	list.tail->next = newNode;
	list.tail = newNode;
}
int SZ(linkedList list){
	int cnt = 0;
	while(list.head != NULL){
		cnt++;
		list.head = list.head->next;
	}
	return cnt;
}
//Them vao giua o vi tri k
void themVaoGiua(linkedList &list, int x, int k){
	if(kiemTraRong(list) == true){
		themVaoRong(list, x);
		return;
	}
	if(k < 1 || k > SZ(list) + 1){
		return;
	}
	if(k == 1){
		themVaoDau(list, x);
		return;
	}
	node *newNode = taoNode(x);
	node *temp = list.head;
	for(int i = 1; i <= k - 2; i++){
		temp = temp->next;
	}
	newNode->next = temp->next;
	temp->next = newNode;
}
//Them vao sau gia tri value
void themVaoSauGiaTri(linkedList &list, int x, int value){
	if(kiemTraRong(list) == true){
		return;
	}
	node *newNode = taoNode(x);
	node *temp = list.head;
	while(temp != NULL && temp->data != value){
		temp = temp->next;
	}
	if(temp == NULL){
		cout << "Khong ton tai gia tri " << value << endl;
		return;
	}
	newNode->next = temp->next;
	temp->next = newNode;
	if(temp == list.tail){
		list.tail = newNode;
	}
}
void xoaDau(linkedList &list){
	if(kiemTraRong(list) == true){
		return;
	}
	node *nodeXoa = list.head;
	list.head = list.head->next;
	delete nodeXoa;
}
void xoaCuoi(linkedList &list){
	if(kiemTraRong(list) == true){
		return;
	}
	if(list.head == list.tail){
		delete list.head;
		list.head = list.tail = NULL;
		return;
	}
	node *temp1 = list.head;
	node *temp2 = list.tail;
	while(temp1->next->next != NULL){
		temp1 = temp1->next;
	}
	temp1->next = NULL;
	list.tail = temp1;
	delete temp2;
}
//Xoa o vi tri thu k
void xoaGiua(linkedList &list, int k){
	if(kiemTraRong(list) == true){
		return;
	}
	if(k < 1 || k > SZ(list) + 1){
		return;
	}
	if(k == 1){
		xoaDau(list);
		return;
	}
	node *temp = list.head;
	for(int i = 1; i <= k - 2; i++){
		temp = temp->next;
	}
	node *knode = temp->next;
	temp->next = knode->next;
	delete knode;
}
//Xoa gia tri value
void xoaGiaTri(linkedList &list, int value){
	if(kiemTraRong(list) == true){
		return;
	}
	node *temp = list.head;
	node *prev = NULL;
	while(temp != NULL && temp->data != value){
		prev = temp;
		temp = temp->next;
	}
	if(temp == NULL){
		cout << "Khong ton tai gia tri " << value << endl;
		return;
	}
	if(prev == NULL){
		list.head = temp->next;
	}
	else{
		prev->next = temp->next;
	}
	delete temp;
}
void inDanhSach(linkedList list){
	node *temp = list.head;
	while(temp != NULL){
		cout << temp->data << " ";
		temp = temp->next;
	}
	cout << endl;
}
node *timMax(linkedList list){
	if(kiemTraRong(list) == true){
		cout << "Danh sach rong";
		return NULL;
	}
	node *max = list.head;
	for(node *i = list.head->next; i != NULL ; i = i->next){
		if(i->data > max->data){
			max = i;
		}
	}
	return max;
}
node *timChanDauTien(linkedList list){
	if(kiemTraRong(list) == true){
		return NULL;
	}
	node *temp = list.head;
	while(temp != NULL){
		if(temp->data % 2 == 0){
			return temp;
		}
		temp = temp->next;
	}
	return temp;
}
void solve12(linkedList list){
	if(kiemTraRong(list) == true){
		return;
	}
	if(list.head->next == NULL){
		cout << list.head->data << endl;
		return;
	}
	node *temp = list.head;
	node *tempPrev = NULL;
	while(temp != NULL){
		if(tempPrev == NULL){
			if(temp->data > temp->next->data){
				cout << temp->data << " ";
			}
		}
		else if(temp == list.tail){
			if(temp->data > tempPrev->data){
				cout << temp->data << " ";
			}
		}
		else{
			if(temp->data > temp->next->data 
			&& temp->data > tempPrev->data){
				cout << temp->data << " ";
			}	
		}
		tempPrev = temp;
		temp = temp->next;		
	}
	cout << endl;
}
//Tao dlks moi bang cach lay phan tu lon hon gan nhat
// phan tu hien tai(phia ben phai), neu k co thi de nguyen
linkedList solve13(linkedList list){
	linkedList newList;
	khoiTao(newList);
	newList = list;
	node *temp = newList.head;
	while(temp != NULL){
		int max = temp->data;
		for(node *i = temp; i != NULL; i = i->next){
			if(i->data > max){
				max = i->data;
				break;
			}
		}
		temp->data = max;
		temp = temp->next;
	}
	return newList;
}
//Nhap vi tri k bat ky, kiem tra phan tu tai vi tri k do
//co lon hon toan bo 4 gia tri xung quanh, 2 trai, 2 phai k, neu
// co thi dua ve cuoi dslk
void solve14(linkedList &list, int k){
	if(k < 0 || k  > SZ(list) - 1){
		cout << "Vi tri khong hop le !\n";
		return;
	}
	if(k == SZ(list) - 1){
		inDanhSach(list);
		return;
	}
	node *prev2 = NULL;
	node *prev1 = NULL;
	node *temp = list.head;
	if(k == 0){
		if(kiemTraRong(list) == false && temp->data > temp->next->data 
		&& temp->data > temp->next->next->data){
			list.head = temp->next;
			temp->next = NULL;
			list.tail->next = temp;
			list.tail = temp;
		}
		inDanhSach(list);
		return;
	}
	for(int i = 0; i <= k - 1; i++){
		prev2 = prev1;
		prev1 = temp;
		temp = temp->next;
		if(temp == NULL){
			return;
		}
	}
	if(k == 1){
		if(kiemTraRong(list) == false && temp->data > prev1->data
		&& temp->data > temp->next->data && temp->data > temp->next->next->data){
			list.head->next = temp->next;
			temp->next = NULL;
			list.tail->next = temp;
			list.tail = temp;
		}
		inDanhSach(list);
		return;
	}
	node *next1 = temp->next;
	node *next2 = next1->next;
	if(k == SZ(list) - 2){
		if(temp->data > prev1->data && temp->data > prev2->data &&
		temp->data > next1->data){
			prev1->next = next1;
			temp->next = NULL;
			list.tail->next = temp;
			list.tail = temp;
		}
		inDanhSach(list);
		return;
	}
	if(temp->data > next1->data && temp->data > next2->data && temp->data > prev1->data
	&& temp->data > prev2->data){
	  	if(prev1 == NULL){
	  		list.head == temp->next;
		}
		else{
			prev1->next = temp->next;
		}
		if(next2 == NULL){
			list.tail = prev1;
		}
	  	temp->next = NULL;
	  	list.tail->next = temp;
	  	prev1->next = next1;	
	  	list.tail = temp;
	}		
	inDanhSach(list);
}
// Xoa bot phan tu trong dslk neu phan tu do lon hon 4 phan tu xung quanh no
void solve15(linkedList &list){
	
}
int main(){
	linkedList list;
	khoiTao(list);
	bool ok = true;
	while(ok){
//		system("cls");
		cout << "------------------\n";
		cout << "1. Them dau\n";
		cout << "2. Them giua\n";
		cout << "3. Them vao sau gia tri\n";
		cout << "4. Them cuoi\n";
		cout << "5. Xoa dau\n";
		cout << "6. Xoa giua\n";
		cout << "7. Xoa cuoi\n";
		cout << "8. Xoa gia tri\n";
		cout << "9. Duyet\n";
		cout << "10. Phan tu lon nhat\n";
		cout << "11. Phan tu chan dau tien\n";
		cout << "12. Phan tu lon hon cac phan tu xung quanh\n";
		cout << "13. DSLK moi\n";
		cout << "14. 2 trai, 2 phai\n";
		cout << "0. Thoat\n";
		int a;
		cout << "Nhap lua chon: ";
		cin >> a;
		switch(a){
			case 1:{
				int x;
				cout << "Nhap gia tri can them: ";
				cin >> x;
				themVaoDau(list, x);
				break;
			}
			case 2:{
				int x, k;
				cout << "Nhap gia tri can them: ";
				cin >> x;
				cout << "Nhap vi tri can them: ";
				cin >> k;
				themVaoGiua(list, x, k);
				break;
			}
			case 3:{
				int x, value;
				cout << "Nhap gia tri can them: ";
				cin >> x;
				cout << "Nhap gia tri can them vao sau no: ";
				cin >> value;
				themVaoSauGiaTri(list, x , value);
				break;
			}
			case 4:{
				int x;
				cout << "Nhap gia tri can them: ";
				cin >> x;
				themVaoCuoi(list, x);
				break;
			}
			case 5:{
				xoaDau(list);
				break;
			}
			case 6:{
				int k;
				cout << "Nhap vi tri can xoa: ";
				cin >> k;
				xoaGiua(list, k);
				break;
			}
			case 7:{
				xoaCuoi(list);
				break;
			}
			case 8:{
				int value;
				cout << "Nhap gia tri can xoa: ";
				cin >> value;
				xoaGiaTri(list, value);
				break;
			}
			case 9:{
				inDanhSach(list);
				system("pause");
				break;
			}
			case 10:{
				node *res = timMax(list);
				cout << "Phan tu lon nhat trong dslk: " << res->data << endl;
				break;
			}
			case 11:{
				node *res = timChanDauTien(list);
				cout << "Phan tu chan dau tien: " << res->data << endl;
				break;
			}
			case 12:{
				cout << "Phan tu lon hon cac phan tu xung quanh: ";
				solve12(list);
				break;
			}
			case 13:{
				linkedList newList = solve13(list);
				inDanhSach(newList);
				break;
			}
			case 14:{
				int k;
				cout << "Nhap vi tri bat ky: ";
				cin >> k;
				solve14(list, k);
				break;
			}
			case 15:{
				solve15(list);
				inDanhSach(list);
				break;
			}
			case 0:{
				cout << "Da thoat chuong trinh !";
				ok = false;
				break;
			}
			default:{
				cout << "Du lieu khong hop le, vui long nhap lai !\n";
				break;
			}
		}
	}
	return 0;
}