#include <iostream>
using namespace std;
void ThayDoi(int *p){
	*p = 30;
}
int main(){
	int y = 20;
	int *p = new int;
	p = &y;
	ThayDoi(&y);
	int z = y++;
	cout << "1. " << y << endl;
	cout << "2. " << *p << endl;
	cout << "3. " << p << endl;
	cout << "4. " << z << endl;	
	return 0;
}