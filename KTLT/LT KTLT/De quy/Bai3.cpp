#include <bits/stdc++.h>
using namespace std;

int solve1(int* a, int i){
	if (i == 0) {
		if (a[i] < 0) {
			return 1;
		}
		else {
			return 0;
		}
	}
	if (a[i - 1] < 0) {	
		return solve1(a, i - 1) * a[i -1];
	}
	return solve1(a, i - 1);
}

int solve2(int *a, int n, int min1, int min2) {
	if (n == 0) {
		return min2;
	}
	if (a[n - 1] < min1) {
		min2 = min1;
		min1 = a[n -1];
	}
	else if (a[n -1] < min2 && a[n -1] != min1) {
		min2 = a[n - 1];
	}
	return solve2(a, n -1, min1, min2);
}

int solve3(int* a, int i, int x) {
	if (i < 0) {
		return 0;
	}
	if (a[i] == x) {
		return solve3(a, i - 1, x) + 1;
	}
	return solve3(a, i - 1, x);
}

int main(){
	int a[1000];
	string filename = "data.txt";
	ifstream read;
	read.open(filename);
	int n = 0;
	while (read >> a[n]) {
		n++;
	}
	int x;
	x = a[n - 1];
	int res1 = solve1(a, n - 2);
	cout << "Ket qua 1: " << res1 << endl;
	int res2 = solve2(a, n -2, INT_MAX, INT_MAX);
	if (res2 == INT_MAX) {
		cout << "Khong co phan tu nho nhi\n";
	} 
	else {
		cout << "Ket qua 2: "<< res2 << endl;
	}
	int res3 = solve3(a, n - 2, x);
	cout << "Ket qua 3: " << res3 << endl;
	read.close();
	return 0;
}