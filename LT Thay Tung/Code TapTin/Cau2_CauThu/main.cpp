#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
using namespace std;
class Date{
    public:
        int d, m, y;
        bool operator > (Date d){
            if(this->y > d.y) return true;
            if(this->y == d.y && this->m > d.m) return true;
            if(this->y == d.y && this->m == d.m && this->d > d.d) return true;
            return false;
        }
};
class CauThu{
    public:
        vector<string> ten;
        Date ngaySinh;
        string gioiTinh;
};
int main(){
    freopen("input.txt", "rt", stdin);
    freopen("output.txt", "wt", stdout);
    vector<CauThu> ct;
    string line;
    while(getline(cin, line)){
        stringstream ss(line);
        vector<string> tokens;
        string tmp;
        while(ss >> tmp){
            tokens.push_back(tmp);
        }
        vector<string> ten;
        for(int i = 1; i < tokens.size() - 2; i++){
            ten.push_back(tokens[i]);
        }
        string date;
        Date ngaySinh;
        date = tokens[tokens.size() - 2];
        for(int i = 0; i < date.size(); i++){
            if(date[i] == '/'){
                date[i] = ' ';
            }
        }
        stringstream ss2(date);
        string tmp2;
        ss2 >> tmp2;
        ngaySinh.d = stoi(tmp2);
        ss2 >> tmp2;
        ngaySinh.m = stoi(tmp2);
        ss2 >> tmp2;
        ngaySinh.y = stoi(tmp2);

        string gioiTinh = tokens[tokens.size() - 1];
        
        CauThu tmpCauThu;
        tmpCauThu.ten = ten;
        tmpCauThu.ngaySinh = ngaySinh;
        tmpCauThu.gioiTinh = gioiTinh;
        ct.push_back(tmpCauThu);
    }
    int minAge = 0;
    for(int i = 0; i < ct.size(); i++){
        if(ct[i].ngaySinh > ct[minAge].ngaySinh && ct[i].gioiTinh == "M"){
            minAge = i;
        }
    }
    CauThu treNhat = ct[minAge];
    for(int i = 0; i < treNhat.ten.size(); i++){
        cout << treNhat.ten[i] << " ";
    }

    int nam = 2024, thang = 4, ngay = 30;
    int tuoi = nam - treNhat.ngaySinh.y;
    if(treNhat.ngaySinh.m > thang){
        tuoi--;
    }
    if(treNhat.ngaySinh.m == thang && treNhat.ngaySinh.d > ngay){
        tuoi--;
    }
    cout << tuoi;
    return 0;
}