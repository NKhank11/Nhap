#include <iostream>
using namespace std;
int main(){
	int *p1 = new int;
	*p1 = 5;
	
	cout << "1. Dia chi cua con tro p1: " << &p1 << endl;
	cout << "2. Gia tri cua con tro p1: " << p1 << endl;
	cout << "3. Noi dung cua bien ma con tro, tro toi: " << *p1 << endl;
	
	int *p2 = p1;
	cout << "4. Dia chi cua con tro p2: " << &p2 << endl;
	cout << "5. Gia tri cua con tro p2: " << p2 << endl;
	cout << "6. Noi dung cua bien ma con tro, tro toi: " << *p2 << endl;	
	
	int a = 8;
	p1--;
	p1 = &a;
	p2++;
	cout << "7. Dia chi cua con tro p1: " << &p1 << endl;
	cout << "8. Gia tri cua con tro p1: " << p1 << endl;	
	cout << "9. Noi dung cua bien ma con tro, tro toi: " << *p1 << endl;	
	
	cout << "10. Dia chi cua con tro p2: " << &p2 << endl;
	cout << "11. Gia tri cua con tro p2: " << p2 << endl;
	cout << "12. Noi dung cua bien ma con tro, tro toi: " << *p2 << endl;
	
	return 0;
}