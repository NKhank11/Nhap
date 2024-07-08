#include <bits/stdc++.h>
using namespace std;

int solve1(int* a, int i){
	if (i == 0) {
		return 0;
	}
	else if (a[i] > a[i - 1]) {
		return a[i] + solve1(a, i - 1);
	}
	return solve1(a, i - 1);
}

int solve2(int *a, int i) {
	if (i == 0) {
		return 1;
	}
	if (a[i - 1] != a[i] ) {
		return 1 + solve2(a, i - 1);
	}
	return solve2(a, i - 1);
}


void solve3(int* a, int &n, int i = 0) {
	 if (i == n - 1) {
	 	return;
	 }
	 for (int j = i + 1; j < n; j++) {
	 	if (a[i] == a[j]) {
	 		for (int k = j; k < n - 1; k++){
	 			a[k] = a[k + 1];
			 }
			 n--;
		 }
		 else{
		 	j++;
		 }
	 }
	 return solve3(a, n, i + 1);
	 
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
	int res1 = solve1(a, n - 2);
	cout << "Ket qua 1: " << res1 << endl;
	sort(a, a + n - 1);
	int res2 = solve2(a, n -2);
	cout << "Ket qua 2: "<< res2 << endl;
	int k = n -1;
	solve3(a, k, 0);
	cout << "Ket qua 3: ";
	for (int i = 0; i < k ; i++) {
		cout << a[i] << " ";
	}

	return 0;
}