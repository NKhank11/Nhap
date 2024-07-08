#include <bits/stdc++.h>
using namespace std;
int main(){
	int x, y;
	int z;
	int *p = &x;
	
	*p = 5;
	cout << "1. " << x << endl;
	cout << "2. " << *p << endl;
	cout << "3. " << &p << endl;
	cout << "4. " << x << endl;
	cout << "5. " << &x << endl;
//	cout << "6. " << *y << endl;
	cout << "7. " << &y << endl;
	
	y = x;
	*p = 9;
	x++;
	z = x + 3;
	
	cout << "8. " << y << endl;
	cout << "9. " << *p << endl;
	cout << "10. " << x << endl;
//	cout << "11. " << *x << endl;
	cout << "12. " << &x << endl;
	cout << "13. " << z << endl;
	
	*p = z;
	cout << "14. " << *p << endl;
	cout << "15. " << z + 1 << endl;
	return 0;
}