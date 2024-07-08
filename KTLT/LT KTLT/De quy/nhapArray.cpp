#include <bits/stdc++.h>
using namespace std;
void NhapMang(int *&a, int &n){
	cout << "Nhap so luong phan tu: ";
	cin >> n;
	a = new int[n];
	for(int i = 0; i < n ; i++){
		cout << "Nhap a[" << i << "] = ";
		cin >> a[i];
	}
}
bool sorted(int *&a, int n, int idx){
	if(idx == n - 1){
		return true;
	}
	return a[idx] < a[idx+1] && sorted(a, n, idx + 1);
}
int main(){
	int *a;
	int n;
	NhapMang(a, n);
	sorted(a, n, 0);
	for(int i = 0; i < n; i++){
		cout << a[i] << " ";
	}
	return 0;
}