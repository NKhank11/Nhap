#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <sstream>
using namespace std;
class ThoiGian{
    public:
        int h, m, s;
        bool operator > (ThoiGian t){
            if(this->h > t.h) return true;
            if(this->h == t.h && this->m > t.m) return true;
            if(this->h == t.h && this->m == t.m && this->s > t.s) return true;
            return false;
        }
        bool operator < (ThoiGian t){
            if(this->h < t.h) return true;
            if(this->h == t.h && this->m < t.m) return true;
            if(this->h == t.h && this->m == t.m && this->s < t.s) return true;
            return false;
        }
};
class BinhChon{
    public:
        vector<string> tenCaSi;
        ThoiGian tg;
};
ThoiGian stoTime(string s) {
    ThoiGian t;
    t.h = stoi(s.substr(0, 2));
    t.m = stoi(s.substr(3, 5));
    t.s = stoi(s.substr(6, 8));
    return t;
}
int main(){
    freopen("input.txt", "rt", stdin);
    freopen("output.txt", "wt", stdout);
    string firstLine;
    getline(cin, firstLine);
    stringstream fss(firstLine);
    string start, end;
    fss >> start >> end;

    ThoiGian startT, endT;
    startT.h = stoi(start.substr(0, 2));
    startT.m = stoi(start.substr(3, 5));
    startT.s = 0;
    endT.h = stoi(end.substr(0, 2));
    endT.m = stoi(end.substr(3, 5));
    endT.s = 0;

    map<vector<string>, int> binhChon;
    vector<vector<string>> dsach;
    string line;
    while(getline(cin, line)){
        for(int i = 0; i < line.size(); i++){
            if(line[i] == '-'){
                line[i] = ' ';
            }
        }
        stringstream ss(line);
        string tmp;
        vector<string> tokens;
        while(ss >> tmp){
            tokens.push_back(tmp);
        }
        vector<string> ten;
        for(int i = 0; i < tokens.size() - 2; i++){
            ten.push_back(tokens[i]);
        }
        string thoiGianBinhChon = tokens[tokens.size() - 1];
        ThoiGian tg = stoTime(thoiGianBinhChon);


        BinhChon tmpBinhChon;
        tmpBinhChon.tenCaSi = ten;
        dsach.push_back(ten);
        tmpBinhChon.tg = tg;
        if (tg > startT && tg < endT) {
            binhChon[ten]++;
        }
    }
    for (auto name : dsach) {
        auto it = binhChon.find(name);
        if (it == binhChon.end()) {
            binhChon[name] = 0;
        } 
    }
    for (auto pair : binhChon) {
        vector<string> ten = pair.first;
        int soPhieu = pair.second;
        for (int i = 0; i< ten.size(); i++) {
            cout << ten[i] << " ";
        }
        cout << soPhieu << endl;
    }
    return 0;
}