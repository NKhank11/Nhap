#include <iostream>
#include <stack>
#include <fstream>
#include <string>
#include <cstdlib>
using namespace std;
void printReverse(stack<double> st){ // In stack từ đáy lên đỉnh
	stack<double> temp;
	while(!st.empty()){
		temp.push(st.top());
		st.pop();
	}
	while(!temp.empty()){
		double t = temp.top();
		cout << t << " ";
		temp.pop();
	}
}
void solve(string a[], int n){
	stack<double> st;
	for(int i = 0; i < n; i++){
		
		system("cls");
		cout << "Day lenh dang xu ly: ";
		for(int j = 0 ; j <= i; j++){
			cout << a[j] << " ";
		}
		cout << "\nDang xu ly: " << a[i] << endl;
		cout << "Lenh xu ly: ";
		
		if(isdigit(a[i][0])){
			cout << "Them so vao stack";
			st.push(stof(a[i]));
		}
		else if(a[i] == "+"){
			cout << "Cong hai so truoc do trong stack";
			if(st.size() >= 2){	// Đảm bảo stack có 2 phần tử trở lên thì mới thực hiện
				double res = 0;
				int times = 2;
				while(times--){	// Truy cập đến 2 phần tử trên cùng của stack
					res += st.top();
					st.pop();
				}
				st.push(res);
			}
		}
		else if(a[i] == "-"){
			cout << "Tru hai so truoc do trong stack";
			if(st.size() >= 2){
				int j = 0;
				int times = 2;
				double mangPhu[2] = {};	// Lưu giá trị 2 phần tử ở trên cùng của stack
				while(times--){
					mangPhu[j] = st.top();
					st.pop();
					j++;
				}
				st.push(mangPhu[1] - mangPhu[0]);
			}
		}
		else if(a[i] == "*"){
			cout << "Nhan hai so truoc do trong stack";
			if(st.size() >= 2){
				double res = 1;
				int times = 2;
				while(times--){
					res *= st.top();
					st.pop();
				}
				st.push(res);
			}			
		}
		else if(a[i] == "/"){
			cout << "Chia hai so truoc do trong stack";
			if(st.size() >= 2){
				int j = 0;
				int times = 2;
				double mangPhu[2] = {};
				while(times--){
					mangPhu[j] = st.top();
					st.pop();
					j++;
				}
				st.push(1.0 * mangPhu[1] / mangPhu[0]);
			}		
		}
		else if(a[i] == "A"){
			cout << "Xoa phan tu o dinh stack";	
			st.pop();	// Xóa phần tử ở đỉnh stack
		}
		else if(a[i] == "B"){
			cout << "Nhan doi phan tu o dinh stack";
			int x = st.top();
			st.pop();
			st.push(x * 2);	
		}				
		else if(a[i] == "C"){
			cout << "Xoa het cac phan tu trong stack";
			while(!st.empty()){
				st.pop();
			}
		}
		cout << "\nTinh trang stack: " << endl;
		stack<double> temp = st;
		while(!temp.empty()){
			cout << "\t| " << temp.top() << " |" << endl;
			temp.pop();
		}
		system("pause");
	}
	// In kết quả ra màn hình
	cout << "Ket qua cuoi cung: ";
	printReverse(st);		
}
int main(){
	// Đọc file và lưu các thao tác vào mảng
	string a[100];
	ifstream in;
	in.open("bai4.txt");
	int n = 0;
	if(in.is_open()){
		while(in >> a[n]){
			n++;
		}
	}
	else{
		cout << "Khong the mo file, vui long kiem tra lai !" << endl;
	}
	solve(a, n);
	return 0;
}