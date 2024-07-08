#include <iostream>
using namespace std;
void NhapMang(int *&a , int &n, int &sum){
	cout << "Nhap n: ";
	cin >> n;
	a = new int [n];
	for(int i = 0; i < n; i++){
		cout << "Nhap a[" << i << "] = ";
		cin >> a[i];
		sum += a[i];
	}
}
void XuatMang(int *a, int n){
	cout << "Noi dung cua mang: ";
	for(int i = 0; i < n ; i++){
		cout << a[i] << " ";
	}
	cout << endl;
}
void NhapMaTran(int **&b, int &n, int &m){
	cout << "Nhap so hang: ";
	cin >> n;
	cout << "Nhap so cot: ";
	cin >> m;
	b = new int*[n];
	for(int i = 0; i < n; i++){
		b[i] = new int [m];
	}
	for(int i = 0; i < n; i++){
		for(int j = 0; j < m ; j++){
			cout << "Nhap b[" << i << "][" << j << "] = ";
			cin >> b[i][j];
		}
	}
}
void XuatMaTran(int **b, int n, int m){
	cout << "Noi dung ma tran: " << endl;
	for(int i = 0; i < n; i++){
		for(int j = 0; j < m ; j++){
			cout << b[i][j] << " ";
		}
		cout << endl;
	}
}
int main(){
	int *a = NULL;
	int n, m;
	int sum = 0;
	NhapMang(a, n, sum);
	XuatMang(a, n);
	cout << "Tong: " << sum << endl;
	int **b = NULL;
	NhapMaTran(b, n , m);
	XuatMaTran(b, n, m);
	delete [] a;
	for(int i = 0; i < n; i++){
		delete [] b[i];
	}
	delete [] b;
	return 0;
}
