#include <iostream>
using namespace std;

int solve1(int n, int i){
	if(i == 0) return 0;
	if(n % i == 0 && i % 2 == 0 && i != n) return i;
	return solve1(n, i - 1);
}

double solve2(int n, int i = 1) {
	if(i == n){
		return 1.0 / (i*(i+1)/2);
	}
	return 1.0 / (i*(i+1)/2) + solve2(n, i + 1);
}

int solve3(int n) {
	if(n == 0){
		return 0;
	}
	return  n % 10 + solve3(n / 10);
}
int main(){
	int t; cin >> t;
	while (t--) {
		int n;
		cin >> n;
		int res1 = solve1(n, n);
		if(res1 > 0){
			cout << "Ket qua 1: " << res1 << endl;
		}
		else{
			cout << "Khong co uoc chan lon nhat" << endl;
		}
		double res2 = solve2(n, 1);
		cout << "Ket qua 2: " << res2 << endl;
		int res3 = solve3(n);
		cout << "Ket qua 3: " << res3 << endl;
	}
	return 0;
}