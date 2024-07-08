#include <bits/stdc++.h>
using namespace std;
int sum(int *a, int i){
	if(i == 0) return 0;
	else if(a[i] > a[i-1]) return a[i] + sum(a, i - 1);
	return sum(a, i - 1);
}
int dem(int *a, int i){
	if(i == 0) return 1;
	if(a[i] != a[i-1]) return 1 + dem(a, i - 1);
	return dem(a, i - 1);
}
void NhapMang(int *&a, int &n){
	cout << "Nhap so luong phan tu: ";
	cin >> n;
	a = new int[n];
	for(int i = 0; i < n; i++){
		cout << "Nhap a[" << i << "] = ";
		cin >> a[i];
	}
}
int demCp(int *a, int i, int n){
	if(i >= n) return 0;
	int res = sqrt(a[i]);
	if(res * res == a[i]) return 1 + demCp(a, i + 1, n);
	return demCp(a, i + 1, n);
}
int main(){
	int *a = NULL;
	int n;
	NhapMang(a, n);
	int tong = sum(a, n - 1);
	cout << tong << endl;
	sort(a, a + n);
	int res2 = dem(a, n - 1);
	cout << res2 << endl;
	int res3 = demCp(a, 0 , n);
	cout << res3 << endl;
	return 0;
}