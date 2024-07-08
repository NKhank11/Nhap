#include <iostream>
using namespace std;
int main(){
	int a = 5, b = 10, c = 15;
	int *x = &a;
	int *y;
	*x = 11;
	y = &c;
	(*y) + 5;
	c++;
	++a;
	x = &b;
	b + 5;
	cout << "1. Gia tri a: " << a << endl;
	cout << "2. Gia tri b: " << b << endl;
	cout << "3. x: " << *x << endl;
	cout << "4. y: " << &y << endl;
	return 0;
}