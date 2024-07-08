#include <bits/stdc++.h>
using namespace std;
/*int main(){
	int a[5] = {1, 2, 3, 4, 5};
	int *p = a + 3;
	cout << "1. " << p[-2] << "\n2. " << a[*p];
	return 0;
}*/
int main(){
	int a[5] = {1, 2, 3, 4, 5};
	int *p = (int*)(&a + 1);
	cout << "3. " << *(a + 1) << "\n4. " << *(p - 1);
	return 0;
}