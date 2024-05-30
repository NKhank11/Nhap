#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <sstream>
using namespace std;
class Time{
	public:
		int h, m, s;
		bool operator < (Time t){
			if(this->h < t.h) return true;
			if(this->h == t.h && this->m < t.m) return true;
			if(this->h == t.h && this->m == t.m && this->s < t.s) return true;
			return false;
		}
};
class VanDongVien{
	public:
		vector<string> ten;
		Time t;
};
int main(){
	freopen("input.txt", "rt", stdin);
	freopen("output.txt", "wt", stdout);
	string line;
	vector<VanDongVien> vdv;
	while(getline(cin, line)){
		stringstream ss(line);
		string tmp;
		vector<string> tokens;
		while(ss >> tmp){
			tokens.push_back(tmp);
		}
		vector<string> ten;
		for(int i = 0; i < tokens.size() - 1; i++){
			ten.push_back(tokens[i]);
		}
		string time;
		Time t;
		time = tokens[tokens.size() - 1];
		for(int i = 0; i < time.size(); i++){
			if(time[i] == ':'){
				time[i] = ' ';
			}
		}
		stringstream ss2(time);
		string tmp2;
		ss2 >> tmp2;
		t.h = stoi(tmp2);
		ss2 >> tmp2;
		t.m = stoi(tmp2);
		ss2 >> tmp2;
		t.s = stoi(tmp2);
		
		VanDongVien tmpVDV;
		tmpVDV.ten = ten;
		tmpVDV.t = t;
		vdv.push_back(tmpVDV);
	}
	int minTime = 0;
	for(int i = 0; i < vdv.size(); i++){
		if(vdv[i].t < vdv[minTime].t){
			minTime = i;
		}
	}
	VanDongVien minVDV = vdv[minTime];
	for(int i = 0; i < minVDV.ten.size(); i++){
		cout << minVDV.ten[i] << " ";
	}
	cout << setw(2) << setfill('0') << minVDV.t.h << ":";
	cout << setw(2) << setfill('0') << minVDV.t.m << ":";
	cout << setw(2) << setfill('0') << minVDV.t.s;	
	return 0;
}