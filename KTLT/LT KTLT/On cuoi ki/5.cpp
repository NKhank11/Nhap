#include <bits/stdc++.h>
using namespace std;
int main(){
	int a[][3] = {1, 2, 3, 4, 5, 6};
	int (*p)[3] = a;
	cout << "1. " << (*p)[1] << "\n2. " << (*p)[2] << endl;
	++p;
	cout << "3. " << (*p)[1] << "\n4. " << (*p)[2];
	return 0;
}