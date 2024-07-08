#include <iostream>
using namespace std;
void solve(int *a, int n, int *kqMongMuon, int m){
	int j = 0;
	string res = "";
	for(int i = 0; i < n; i++){
		if(j == m) break;
		if(a[i] == kqMongMuon[j]){
			res += "push ";
			j++;
		}
		else{
			res += "push pop ";
		}
	}
	if(j < m) cout << "Khong thao tac duoc stack !";
	else cout << res;
}
int main() {
	int n;
	cout << "Nhap n: ";
	cin >> n;
	
	int *a = new int [n];
	for(int i = 0; i < n; i++){
		a[i] = i + 1;
	}	
	
	int m;
	cout << "Nhap so stack mong muon: ";
	cin >> m;
	
	int *kqMongMuon = new int[m];
	for(int i = 0; i < m; i++){
		cin >> kqMongMuon[i];
	}
	solve(a, n, kqMongMuon, m);
	
	return 0;
}