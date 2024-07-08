#include <bits/stdc++.h>
using namespace std;
//Lua chon 1:
int soNguyenTo(int n){
	for(int i = 2; i <= sqrt(n); i++){
		if(n % i == 0) return 0;
	}
	return n > 1;
}
void khoangGiaTri(int n){
	for(int i = 0; i <= n; i++){
		if(i % 2 == 0) cout << i << " ";
	}
	cout << endl;
}
void luaChon1(){
	int n;
	cout << "Nhap vao n: ";
	cin >> n;
	if(soNguyenTo(n)){
		cout << n << " la so nguyen to\n";
		cout << "Cac so chan nam trong doan [0, " << n << "] la: ";
		khoangGiaTri(n);
	}
	else{
		cout << n << " khong phai so nguyen to\n";
	}
}

//Lua chon 2:
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
void luaChon2(){
	int n;
	cout << "Nhap vao n: ";
	cin >> n;
	while(!check4Digits(n)){
		cout << n << " khong phai so co 4 chu so. Vui long nhap lai !\n";
		cin >> n;
	}
	if(checkToanChan(n)){
		cout << n << " la so toan chan\n";
	}
	else if(checkToanLe(n)){
		cout << n << " la so toan le\n";
	}
	else{
		cout << n << " la so binh thuong\n";
	}
}

//Lua chon 3:
void luaChon3(){
    int x,y;
    int z;
    //int z = &x;
    
	int* p = &x;
    *p = 5;

    cout << "KQ1:" <<  x << endl;
    cout << "KQ2:" << *p << endl;
    cout << "KQ3:" << &p << endl;
    cout << "KQ4:" << x << endl;
    cout << "KQ5:" << &x << endl;

    //cout << "KQ6:" << *y << endl;
	cout << "KQ6: Ket qua loi. Xem comment de biet la loi gi.\n"; 
    cout << "KQ7:" << &y << endl;
   
    y = x;
    *p = 9;
    x++;
    z = x+3;

    cout << "KQ8:" << y << endl;
    cout << "KQ9:" << *p << endl;
    cout << "KQ10:" << x << endl;

   	// cout << "KQ11:" << *x << endl;
    cout << "KQ11: Ket qua loi. Xem comment de biet la loi gi.\n"; 
	cout << "KQ12:" << &x << endl;
    cout << "KQ13:" << z << endl;

    *p = z;
    cout << "KQ14:" << *p  << endl;
    cout << "KQ15:" << z+1  << endl;
}
//int main(){
//	char choice1 = 'y', choice2;
//	while(choice1 == 'y'){
//		system("cls");
//		cout << "==============MENU==============\n";
//      	cout << "1. So nguyen to.\n";
//        cout << "2. So co bon chu so.\n";
//        cout << "3. Hien 15 ket qua.\n";
//        cout << "--------------------------------------\n";
//		cout << "Nhap vao lua chon lam viec cua ban: ";	
//		cin >> choice2;
//		while(choice2 != '1' && choice2 != '2' && choice2 != '3'){
//			cout << "Lua chon khong hop le, vui long nhap lai !\n ";
//			cin >> choice2;			
//		}
//		if(choice2 == '1'){
//			luaChon1();
//		}
//		else if(choice2 == '2'){
//			luaChon2();
//		}
//		else if(choice2 == '3'){
//			luaChon3();
//		}
//		cout << "\nBan co muon tiep tuc khong (y/n) ? ";
//		cin >> choice1;
//		while(choice1 != 'y' && choice1 != 'n'){
//			cout << "Lua chon khong hop le, vui long nhap lai !\n ";
//			cin >> choice1;
//		}	
//	}
//	cout << "\nDa thoat chuong trinh\n";
//	return 0;
//}
int main() {
    char choice1 = 'y', choice2;
    while(choice1 == 'y') {
        system("cls");
        cout << "==============MENU==============\n";
        cout << "1. So nguyen to.\n";
        cout << "2. So co bon chu so.\n";
        cout << "3. Hien 15 ket qua.\n";
        cout << "--------------------------------------\n";
        cout << "Nhap vao lua chon lam viec cua ban: "; 
        cin >> choice2;

        switch(choice2) {
            case '1':
                luaChon1();
                break;
            case '2':
                luaChon2();
                break;
            case '3':
                luaChon3();
                break;
            default:
                cout << "Lua chon khong hop le, vui long nhap lai !\n";
                continue; 
        }

        cout << "\nBan co muon tiep tuc khong (y/n) ? ";
        cin >> choice1;

        while(choice1 != 'y' && choice1 != 'n'){
            cout << "Lua chon khong hop le, vui long nhap lai !\n ";
            cin >> choice1;
        }   
    }

    cout << "\nDa thoat chuong trinh\n";
    return 0;
}