#include <iostream>
using namespace std;

int solve1(int n) {
	if (n == 0) {
		return 0;
	}
	return 1 + solve1(n / 10);
}

int solve2(int n) {
	if (n % 2 == 1) {
		return false;
	}
	if (n == 0) {
		return true;
	}
	return solve2(n / 10);
}

int solve3(int n) {
	if (n < 10) {
		return n;
	}
	int max =  n % 10;
	int k = solve3(n / 10); 
	if (k > max ) {
		max = k;
	}
	return max;
}

int main(){
	int t; cin >> t;
	while(t--) {
		int n; cin >> n;
		int res1 = solve1(n);
		cout << res1 << endl;
		int res2 = solve2(n);
		if (res2 == 0) {
			cout << "No\n";
		}
		else {
			cout << "yes\n";
		}
		int res3 = solve3(n);
		cout << res3 << endl;
	}
	return 0;
}