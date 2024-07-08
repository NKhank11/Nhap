/*#include <bits/stdc++.h>
using namespace std;
struct Stack{
	char *list;
	int max;
	int size;
};
bool khoiTao(Stack &s, int);
bool isEmpty(Stack );
bool isFull(Stack );
void push(Stack &, char );
void pop(Stack &);
int top(Stack );
void in(Stack );
int pre(char c){
	if(c == '(') return 0;
	if(c == '+' || c == '-') return 1;
	if(c == '*' || c == '/') return 2;
	return -1;
}
void solve(string s){
	string res = "";
	Stack st;
	int n = 100;
	khoiTao(st, n);
	for(int i = 0; i < s.size(); i++){
		if(isalpha(s[i])){
			res += s[i];
		}
		else if(s[i] == '('){
			push(st, s[i]);
		}
		else if(s[i] == ')'){
			while(!isEmpty(st) && top(st) != '('){
				res += top(st);
				pop(st);
			}
			pop(st);
		}
		else{
			while(!isEmpty(st) && pre(top(st)) > pre(s[i])){
				res += top(st);
				pop(st);
			}
			push(st, s[i]);
		}
	}
	cout << res;
}
int main(){
	string s;
	getline(cin, s);
	solve(s);
	return 0;
}
bool khoiTao(Stack &s, int n){
	s.list = new char[n];
	if(s.list == NULL) return false;
	s.max = n;
	s.size = 0;
	return true;
}
bool isEmpty(Stack s){
	return s.size == 0;
}
bool isFull(Stack s){
	return s.size == s.max;
}
void push(Stack &s, char value){
	if(isFull(s)) return;
	s.list[s.size] = value;
	s.size++;
}
void pop(Stack &s){
	if(isEmpty(s)) return;
	s.size--;
}
int top(Stack s){
	if(isEmpty(s)) return INT_MIN;
	return s.list[s.size - 1];
}
void in(Stack s){
	for(int i = s.size - 1; i >= 0; i --){
		cout << s.list[i] << " ";
	}
	cout << endl;
}
*/


/*#include <iostream>
using namespace std;
struct Node{
	string data;
	Node *next;
};
struct Stack{
	Node *head;
	Node *tail;
	int max;
	int size;
};
Node *taoNode(string x){
	Node *newNode = new Node;
	newNode->data = x;
	newNode->next = NULL;
	return newNode;
}
bool khoiTao(Stack &, int );
bool isEmpty(Stack );
bool isFull(Stack );
void push(Stack &, string );
void pop(Stack & );
string top(Stack );
void in(Stack );
void solve(string );
int main(){
	string s;
	getline(cin, s);
	solve(s);
	return 0;
}
bool khoiTao(Stack &s, int n){
	s.head = NULL;
	s.tail = NULL;
	s.max = n;
	s.size = 0;
	return true;
}
bool isEmpty(Stack s){
	return s.size == 0;
}
bool isFull(Stack s){
	return s.size == s.max;
}
void push(Stack &s, string value){
	Node *newNode = taoNode(value);
	if(isFull(s)) return;
	if(isEmpty(s)){
		s.head = s.tail = newNode;
		s.size++;
		return;
	}
	s.tail->next = newNode;
	s.tail = newNode;
	s.size++;
}
void pop(Stack &s){
	if(isEmpty(s)) return;
	if(s.head == s.tail){
		s.head = s.tail = NULL;
		s.size--;
	}
	Node *del = s.tail;
	Node *cur = s.head;
	while(cur->next != s.tail){
		cur = cur->next;
	}
	cur->next = NULL;
	delete del;
	s.size--;
}
string top(Stack s){
	return s.tail->data;
}
void in(Stack s){
	Node *cur = s.head;
	while(cur != NULL){
		cout << cur->data << " ";
		cur = cur->next;
	}
	cout << endl;
}
void solve(string s){
	Stack st;
	int n = 100;
	khoiTao(st, n);
	for(int i = s.size() - 1; i >= 0; i --){
		if(isalpha(s[i])){
			push(st, string(1, s[i]));
		}
		else{
			string o1 = top(st);
			pop(st);
			string o2 = top(st);
			pop(st);
			string res = "(" + o1 + s[i] + o2 + ")";
			push(st, res);
		}
	}
	cout << top(st);
}*/


/*#include <bits/stdc++.h>
using namespace std;
int pre(char c){
	if(c == '(') return 0;
	if(c == '+' || c == '-') return 1;
	if(c == '*' || c == '/') return 2;
}
int tinhToan(int a, int b, char c){
	if(c == '+') return a + b;
	else if(c == '-') return a - b;
	else if(c == '*') return a * b;
	else return a / b;
}
void solve(string s){
	stack<char> st1;
	stack<int> st2;
	for(int i = 0; i < s.size(); i++){
		if(s[i] == '('){
			st1.push(s[i]);
		}
		else if(isdigit(s[i])){
			int temp = 0 ;
			while(i < s.size() && isdigit(s[i])){
				temp = temp * 10  + s[i] - '0';
				i++;
			}
			st2.push(temp);
			i--;
		}
		else if(s[i] == ')'){
			while(!st1.empty() && st1.top() != '('){
				int o1 = st2.top();
				st2.pop();
				int o2 = st2.top();
				st2.pop();
				st2.push(tinhToan(o2, o1, st1.top()));
				st1.pop();
			}
			st1.pop();
		}
		else{
			while(!st1.empty() && pre(st1.top()) >= pre(s[i])){
				int o1 = st2.top();
				st2.pop();
				int o2 = st2.top();
				st2.push(tinhToan(o2, o1, st1.top()));
				st1.pop();
			}
			st1.push(s[i]);
		}
	}
	while(!st1.empty()){
		int o1 = st2.top(); st2.pop();
		int o2 = st2.top(); st2.pop();
		st2.push(tinhToan(o2, o1, st1.top()));
		st1.pop();		
	}
	cout << st2.top() << endl;
}
int main(){
	string s;
	getline(cin, s);
	solve(s);
	return 0;
}*/


#include <bits/stdc++.h>
using namespace std;
struct Node{
	int data;
	Node *next;
};
struct Stack{
	Node *head;
	Node *tail;
	int max;
	int size;
};
Node *taoNode(int x){
	Node *newNode = new Node;
	newNode->data = x;
	newNode->next = NULL;
	return newNode;
}
bool khoiTao(Stack &, int );
bool isEmpty(Stack );
bool isFull(Stack );
void push(Stack &, int );
void pop(Stack & );
int top(Stack );
void in(Stack );
int main(){
	Stack s;
	int n = 100;
	khoiTao(s, n);
	int ok = 1;
	while(ok){
		cout << "1.Push\n2.Pop\n3.Top\n4.In\n5.Thoat\n";
		int choice;
		cout << "Nhap lua chon: ";
		cin >> choice;
		switch(choice){
			case 1:{
				int value;
				cin >> value;
				push(s, value);
				break;
			}
			case 2:{
				pop(s);
				break;
			}
			case 3:{
				cout << top(s) << endl;
				break;
			}
			case 4:{
				in(s);
				break;
			}
			case 0:{
				ok = 0;
				cout << "Thoat chuong trinh !";
				break;
			}
			default:{
				cout << "Cu phap khong hop le !";
				break;
			}
		}
	}
	return 0;
}
bool khoiTao(Stack &s, int n){
	s.head = NULL;
	s.tail = NULL;
	s.max = n;
	s.size = 0;
	return true;
}
bool isEmpty(Stack s){
	return s.size == 0;
}
bool isFull(Stack s){
	return s.size == s.max;
}
void push(Stack &s, int value){
	Node *newNode = taoNode(value);
	if(isFull(s)) return;
	if(isEmpty(s)){
		s.head = s.tail = newNode;
		s.size++;
		return;
	}
	s.tail->next = newNode;
	s.tail = newNode;
	s.size++;
}
void pop(Stack &s){
	if(isEmpty(s)) return;
	if(s.head == s.tail){
		s.head = s.tail = NULL;
		s.size--;
	}
	Node *del = s.tail;
	Node *cur = s.head;
	while(cur->next != s.tail){
		cur = cur->next;
	}
	cur->next = NULL;
	delete del;
	s.size--;
}
int top(Stack s){
	if(isEmpty(s)) return INT_MIN;
	return s.tail->data;
}
void in(Stack s){
	Node *cur = s.head;
	while(cur != NULL){
		cout << cur->data << " ";
		cur = cur->next;
	}
	cout << endl;
}