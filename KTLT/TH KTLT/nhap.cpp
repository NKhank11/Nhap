#include <iostream>
#include <math.h>
using namespace std;
int checkPrime(int n){
	for(int i = 2; i <= sqrt(n); i++){
		if(n % i == 0) return 0;
	}
	return n > 1;
}
bool check4Digits(int n){
	int dem = 0;
	while(n){
		dem++;
		n /= 10;
	}
	return dem == 4;
}
bool checkToanChan(int n){
	while(n){
		if((n % 10) % 2 != 0) return 0;
		n /= 10;
	}
	return 1;
}
bool checkToanLe(int n){
	while(n){
		if((n % 10) % 2 == 0) return 0;
		n /= 10;
	}
	return 1;
}
int main(){
	char choice;
	do {
		cout << "-----------MENU CHUC NANG-------------\n";
		cout << "1. Nhap vao 1 so nguyen n. Neu la SNT thi in ra cac gia tri so chan thuoc [0, SNT]\n";
		cout << "   neu khong thi thong bao n khong la SNT\n";
		cout << "2. Nhap vao 1 so co 4 chu so, kiem tra so do la so toan chan hay toan le. Neu khong phai 2TH tren\n ";
		cout << "   thi in ra n binh thuong\n";
		cout << "3. Xuat 15 ket qua voi code co san\n";
		cout << "\nBan muon lua chon chuc nang so may ? ";
		cin >> choice;
		switch(choice){
			case '1':{
				int n;
				cout << "Nhap so nguyen n: ";
				cin >> n;
				if(checkPrime(n)){
					for(int i = 0; i <= n; i++){
						if(i % 2 == 0) cout << i << " ";
					}
					cout << endl;
				}
				else{
					cout << n << " khong phai so nguyen to\n";
				}
				break;
			}
			case '2':{
				int n;
				do{
					cout << "Nhap so nguyen n co 4 chu so: ";
					cin >> n;
				} while(!check4Digits(n));
					if(checkToanChan(n)){
						cout << n << " la so toan chan\n";
					}
					else if(checkToanLe(n)){
						cout << n << " la so toan le\n";
					}
					else{
						cout << n << "\n";
					}
					break;				
				}
			case '3':{
				int x, y;
				// int *x = y;	Dong nay loi
				int z;
				// int z = &x;	Dong nay loi
				int *p = &x;
				*p = 5;
				
				cout << "\nKet qua 1: " << x << "\n";
				cout << "Ket qua 2: " << *p << "\n";
				cout << "Ket qua 3: " << &p << "\n";
				cout << "Ket qua 4: " << x << "\n";
				cout << "Ket qua 5: " << &x << "\n";
				// cout << "Ket qua 6: " << *y << "\n";		Dong nay loi
				cout << "Ket qua 7: " << &y << "\n";
				
				y = x;
				*p = 9;
				x++;
				z = x + 3;
				
				cout << "Ket qua 8: " << y << "\n";
				cout << "Ket qua 9: " << *p << "\n";
				cout << "Ket qua 10: " << x << "\n";
				// cout << "Ket qua 11: " << *x << "\n";	Dong nay loi
				cout << "Ket qua 12: " << &x << "\n";
				cout << "Ket qua 13: " << z << "\n";
				
				*p = z;
				cout << "Ket qua 14: " << *p << "\n";
				cout << "Ket qua 15: " << z + 1 << "\n\n";
				break;
			}
			default:
				cout << "Du lieu khong hop le. Vui long nhap lai !\n";	
				break;	
		}
		cout << "Ban muon tiep tuc (Y/N) ? ";
		cin >> choice;
	} while(choice == 'Y' || choice == 'y' );
	return 0;
}