#include <bits/stdc++.h>
using namespace std;
struct Diem{
	int x, y;
};
void TruyenThamTri(int a){
	a = a * 10;
}
void TruyenThamBien(int &a){
	a = a * 10;
}
void ThamTriConTro(Diem *d){
	d->x = d->x * 10;
	d->y = d->y * 10;
}
void ThamBienConTro(Diem* &d, Diem *p){
	d->x = d->x * 10;
	d->y = d->y * 10;
	d = p;
}
int main(){
	int a = 1, b = 10;
	cout << "a = " << a << endl;
	TruyenThamTri(a);
	cout << "a sau truyen tham tri = " << a << endl;
	TruyenThamBien(a);
	cout << "a sau truyen tham bien = " << a << endl;
	
	Diem* d2 = new Diem;
	d2->x = 5, d2->y = 5;
	cout << "Diem d2: (" << d2->x << ", " << d2->y << ")" << endl;
	ThamTriConTro(d2);
	cout << "Diem d2 sau khi truyen tham tri con tro: (" << d2->x << ", " << d2->y << ")" << endl;
	
	Diem* d1 = new Diem;
	d1->x = 5, d1->y = 5;
	d2->x = 5, d2->y = 5;
	cout << "Diem d2: (" << d2->x << ", " << d2->y << ")" << endl;
	ThamBienConTro(d2, d1);
	cout << "d2 sau khi goi ham tham bien con tro: ";
	cout << "Diem d2: (" << d2->x << ", " << d2->y << ")" << endl;
	return 0;
}