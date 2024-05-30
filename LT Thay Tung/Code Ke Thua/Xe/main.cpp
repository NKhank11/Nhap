#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <algorithm>
#include <iomanip>
using namespace std;
//Tạo lớp Xe
class Xe{
    protected:
        string maSo;
        float tocDo;
    public:
        Xe(string maSo, float tocDo);
        virtual void inThongTin() = 0;
        float getTocDo();
        string getMaSo();
};

//Cài đặt phương thức của lớp Xe
Xe::Xe(string maSo, float tocDo){
    this->maSo = maSo;
    this->tocDo = tocDo;
}
float Xe::getTocDo(){
    return tocDo;
}
string Xe::getMaSo(){
    return maSo;
}

//Tạo lớp XeGa kế thừa từ lớp Xe
class XeGa : public Xe{
    private:
        float banKinhXe;
    public:
        XeGa(string maSo, float tocDo, float banKinhXe);
        void inThongTin();
        float tocDoXeGa();
};

//Cài đặt phương thức của lớp XeGa
XeGa::XeGa(string maSo, float tocDo, float banKinhXe) : Xe(maSo, tocDo){
    this->banKinhXe = banKinhXe;
}
void XeGa::inThongTin(){
    cout << maSo << " " << tocDo << " " << banKinhXe << endl;
}
float XeGa::tocDoXeGa(){
    return tocDo * banKinhXe;
}

//Tạo lớp XeMeo kế thừa từ lớp Xe
class XeMeo : public Xe{
    private:
        float taiMeo;
        float duoiMeo;
    public:
        XeMeo(string maSo, float tocDo, float taiMeo, float duoiMeo);  
        void inThongTin();
        float tocDoXeMeo();
};

//Cài đặt phương thức của lớp XeMeo
XeMeo::XeMeo(string maSo, float tocDo, float taiMeo, float duoiMeo) : Xe(maSo, tocDo){
    this->taiMeo = taiMeo;
    this->duoiMeo = duoiMeo;
}
void XeMeo::inThongTin(){
    cout << maSo << " " << tocDo << " " << taiMeo << " " << duoiMeo << endl;
}
float XeMeo::tocDoXeMeo(){
    return tocDo  + taiMeo + duoiMeo;
}

int main(){
    //Đọc ghi file
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
    vector<XeGa> xeGa;
    vector<XeMeo> xeMeo;
    string line;
    while(getline(cin, line)){
        stringstream ss(line);
        string tmp;
        vector<string> data;
        while(ss >> tmp){
            data.push_back(tmp);
        }
        string maSo = data[0];
        float tocDo = stof(data[1]);
        if(maSo[0] == 'G'){
            float banKinhXe = stof(data[2]);
            xeGa.push_back(XeGa(maSo, tocDo, banKinhXe));
        }
        else if(maSo[0] == 'M'){
            float taiMeo = stof(data[2]);
            float duoiMeo = stof(data[3]);
            xeMeo.push_back(XeMeo(maSo, tocDo, taiMeo, duoiMeo));
        }
    }
    cout << "Danh sach xe ga: " << endl;
    for(int i = 0; i < xeGa.size(); i++){
        xeGa[i].inThongTin();
    }
    cout << "Danh sach xe meo: " << endl;
    for(int i = 0; i < xeMeo.size(); i++){
        xeMeo[i].inThongTin();
    }

    // In ra xe chạy nhanh nhất
    XeGa maxXeGa = xeGa[0];
    XeMeo maxXeMeo = xeMeo[0];
    for(int i = 1; i < xeGa.size(); i++){
        if(xeGa[i].tocDoXeGa() > maxXeGa.tocDoXeGa()){
            maxXeGa = xeGa[i];
        }
    }
    for(int i = 1; i < xeMeo.size(); i++){
        if(xeMeo[i].tocDoXeMeo() > maxXeMeo.tocDoXeMeo()){
            maxXeMeo = xeMeo[i];
        }
    }

    //So sánh tốc độ 2 loại xe và tìm ra xe chạy nhanh nhất
    cout << "Xe chay nhanh nhat: \n";
    if(maxXeGa.tocDoXeGa() > maxXeMeo.tocDoXeMeo()){
        maxXeGa.inThongTin();
    }
    else{
        maxXeMeo.inThongTin();
    }

    // Đưa ra bxh các xe từ nhanh đến chậm
    vector<pair<string, float>> rank;
    for(int i = 0; i < xeGa.size(); i++){
        rank.push_back(make_pair(xeGa[i].getMaSo(), xeGa[i].tocDoXeGa()));
    }
    for(int i = 0; i < xeMeo.size(); i++){
        rank.push_back(make_pair(xeMeo[i].getMaSo(), xeMeo[i].tocDoXeMeo()));
    }
    sort(rank.begin(), rank.end(), [](pair<string, float> a, pair<string, float> b){
        return a.second > b.second;
    });
    cout << "\nBang xep hang: \n";
    for(int i = 0; i < rank.size(); i++){
        cout << rank[i].first << " " << fixed << setprecision(1) << rank[i].second << endl;
    }

    return 0;
}