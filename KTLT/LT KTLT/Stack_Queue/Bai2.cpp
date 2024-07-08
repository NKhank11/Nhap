//#include <iostream>
//#include <string>
//#include <stack>
//using namespace std;
//void solve(string s){
//	stack<string> st;
//	string res = "";
//	for(int i = 0; i < s.size(); i++){
//		if((char)s[i] != '(' && (char)s[i] != ')'){
//			st.push(string(1, s[i]));
//		}
//		else{	
//				while(st.size() >= 3){
//					string o1 = st.top(); st.pop();
//					string o2 = st.top(); st.pop();
//					string o3 = st.top(); st.pop();
//					if(o3[0] == '(' && o3[o3.size()-1] == ')' && (o2 == "*" || o2 == "/")){
//						o3 = o3.substr(1, o3.size() - 2);
//					}
//					res = "(" + o3 + o2 + o1 + ")";
//					st.push(res);					
//				}			
//			}
//	}
//	cout << st.top() << endl;
//}
//int main(){
//	string s;
//	cin >> s;
//	solve(s);
//	return 0;
//}
#include <iostream>
#include <stack>
#include <string>
using namespace std;
void solve1(string s){
	stack<int> st;
	bool posXoa[100] = {};
	int dem = 0;
	for(int i = 0; i < s.size(); i++){
		if(s[i] == '('){
			st.push(i);
		}
		else if(s[i] != '(' && s[i] != ')'){
			if(st.top() != -1){
				st.push(-1);
			}
		}
		else if(s[i] == ')'){
			if(st.top() == -1){
				st.pop();
				st.pop();
			}
			else{
				posXoa[st.top()] = true;
				posXoa[i] = true;
				dem++;
				st.pop();
			}
		}
		if(st.empty()) break;
	}
	for(int i = 0; i < s.size(); i++){
		if(posXoa[i] == false){
			cout << s[i];
		}
	}
}
int main(){
	string s;
	cin >> s;
	solve1(s);
	
	return 0;
}