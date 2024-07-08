#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;
struct SoPhuc{
	int thuc;
	int ao;
	void nhap(){
		cin >> thuc >> ao;
	}
	void xuat(){
		if(ao > 0){
			cout << "{" << thuc << "+" << ao << "i}" << " ";		
		}
		else if(ao < 0){
			cout << "{" << thuc << "-" << -1*ao << "i}" << " ";	
		}
	}
};
SoPhuc Tong(SoPhuc *a, int n){
	int res1 = 0, res2 = 0;
	for(int i = 0; i < n; i++){
		res1 += a[i].thuc;
		res2 += a[i].ao;
	}
	SoPhuc p;
	p.thuc = res1;
	p.ao = res2;
	return p;
}
SoPhuc Hieu(SoPhuc *a, int n){
	int res1 = 0, res2 = 0;
	for(int i = 0; i < n; i++){
		res1 -= a[i].thuc;
		res2 -= a[i].ao;
	}
	SoPhuc p;
	p.thuc = res1;
	p.ao = res2;
	return p;
}
void module(SoPhuc p){
	double res = 0;
	res = sqrt(p.thuc * p.thuc + p.ao * p.ao);
	cout << fixed << setprecision(2) << res << " ";
}
int main(){
	int n = 3;
	SoPhuc *a = new SoPhuc[n];
	for(int i = 0; i < n; i++){
		a[i].nhap();
	}
	for(int i = 0; i < n; i++){
		a[i].xuat();
	}
	cout << endl;
	for(int i = 0; i < n; i++){
		module(a[i]);
	}
	cout << endl;
	SoPhuc tong = Tong(a, n);
	tong.xuat();
	cout << endl;
	
	delete [] a;
	
	return 0;
}