#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <sstream>
#include <algorithm>
using namespace std;
//Tao lop CaSi
class CaSi{
  protected:
    string ngheDanh;
    string maSo;
    int soBuoi;
  public:
    CaSi();
    CaSi(string, string, int);
    CaSi(const CaSi&);
    virtual int luong() const = 0;
    string getMaSo();
    string getNgheDanh();
    int getSoBuoi();
    friend istream& operator>>(istream&, CaSi&);
    friend ostream& operator<<(ostream&, const CaSi&);
};
CaSi::CaSi(){
  ngheDanh = "";
  maSo = "";
  soBuoi = 0;
}
CaSi::CaSi(string ngheDanh, string maSo, int soBuoi){
  this->ngheDanh = ngheDanh;
  this->maSo = maSo;
  this->soBuoi = soBuoi;
}
CaSi::CaSi(const CaSi& cs){
  this->ngheDanh = cs.ngheDanh;
  this->maSo = cs.maSo;
  this->soBuoi = cs.soBuoi;
}
string CaSi::getMaSo(){
  return maSo;
}
string CaSi::getNgheDanh(){
  return ngheDanh;
}
int CaSi::getSoBuoi(){
  return soBuoi;
}
istream& operator>>(istream& is, CaSi& cs) {
    is >> cs.ngheDanh >> cs.maSo >> cs.soBuoi;
    return is;
}

ostream& operator<<(ostream& os, const CaSi& cs) {
    os << cs.ngheDanh << " " << cs.maSo << " " << cs.soBuoi;
    return os;
}

//Tao lop CaSiHatBe
class CaSiHatBe : public CaSi{
  public:
    CaSiHatBe();
    CaSiHatBe(string, string, int);
    CaSiHatBe(const CaSiHatBe&);
    int luong() const;
    friend ostream& operator<<(ostream&, const CaSiHatBe&);
};
CaSiHatBe::CaSiHatBe() : CaSi(){
}
CaSiHatBe::CaSiHatBe(string ngheDanh, string maSo, int soBuoi) : CaSi(ngheDanh, maSo, soBuoi){
}
CaSiHatBe::CaSiHatBe(const CaSiHatBe& cs) : CaSi(cs){
}
int CaSiHatBe::luong() const{
  return soBuoi * 500000;
}
ostream& operator<<(ostream& os, const CaSiHatBe& cs) {
    os << static_cast<const CaSi&>(cs) << " " << cs.luong();
    return os;
}
//Tao lop CaSiTiemNang
class CaSiTiemNang : public CaSi{
  private:
    int soDia;
    float rating;
  public:
    CaSiTiemNang();
    CaSiTiemNang(string, string, int, int, float);
    CaSiTiemNang(const CaSiTiemNang&);
    float getRating();
    friend istream& operator>>(istream&, CaSiTiemNang&);
    friend ostream& operator<<(ostream&, const CaSiTiemNang&);
    int luong() const;
};
CaSiTiemNang::CaSiTiemNang() : CaSi(){
}
CaSiTiemNang::CaSiTiemNang(string ngheDanh, string maSo, int soBuoi, int soDia, float rating) : CaSi(ngheDanh, maSo, soBuoi){
  this->soDia = soDia;
  this->rating = rating;
}
CaSiTiemNang::CaSiTiemNang(const CaSiTiemNang& cs) : CaSi(cs){
  this->soDia = cs.soDia;
  this->rating = cs.rating;
}
float CaSiTiemNang::getRating(){
  return rating;
}
istream& operator>>(istream& is, CaSiTiemNang& cs) {
    is >> cs.ngheDanh >> cs.maSo >> cs.soBuoi >> cs.soDia >> cs.rating;
    return is;
}

ostream& operator<<(ostream& os, const CaSiTiemNang& cs) {
    os << static_cast<const CaSi&>(cs) << " " << cs.soDia << " " << cs.rating << " " << cs.luong();
    return os;
}
int CaSiTiemNang::luong() const{
  return 3000000 + 1000*soDia + 500000*soBuoi;
}

//Tao lop CaSiNgoiSao
class CaSiNgoiSao : public CaSi{
  private:
    int soDia;
    float rating;
    int soGameShow;
  public:
    CaSiNgoiSao();
    CaSiNgoiSao(string, string, int, int, float, int);
    CaSiNgoiSao(const CaSiNgoiSao&);
    friend istream& operator>>(istream&, CaSiNgoiSao&);
    friend ostream& operator<<(ostream&, const CaSiNgoiSao&);
    int luong() const;
    float getRating();
};
CaSiNgoiSao::CaSiNgoiSao() : CaSi(){
}
CaSiNgoiSao::CaSiNgoiSao(string ngheDanh, string maSo, int soBuoi, int soDia, float rating, int soGameShow) : CaSi(ngheDanh, maSo, soBuoi){
  this->soDia = soDia;
  this->rating = rating;
  this->soGameShow = soGameShow;
}
CaSiNgoiSao::CaSiNgoiSao(const CaSiNgoiSao& cs) : CaSi(cs){
  this->soDia = cs.soDia;
  this->rating = cs.rating;
  this->soGameShow = cs.soGameShow;
}
istream& operator>>(istream& is, CaSiNgoiSao& cs) {
    is >> cs.ngheDanh >> cs.maSo >> cs.soBuoi >> cs.soDia >> cs.rating >> cs.soGameShow;
    return is;
}

ostream& operator<<(ostream& os, const CaSiNgoiSao& cs) {
    os << static_cast<const CaSi&>(cs) << " " << cs.soDia << " " << cs.rating << " " << cs.soGameShow << " " << cs.luong();
    return os;
}
int CaSiNgoiSao::luong() const{
  return 3000000 + 5000*soDia + 3000000*soBuoi + 5000000*soGameShow;
}

//Tao lop danh sach ca si
class DSCaSi{
  public:
    vector<CaSi*> ds;
    void luongCaoNhat(); //Hien thi danh sach ca si co luong cao nhat
    void sapXep();
    void xoa(string);
};
void DSCaSi::xoa(string maSo){
  for(int i = 0; i < ds.size(); i++){
    if(ds[i]->getMaSo() == maSo){
      ds.erase(ds.begin() + i);
      return;
    }
  }
}
void DSCaSi::luongCaoNhat(){
  float maxLuong = 0;
  for(int i = 0; i < ds.size(); i++){
    if(ds[i]->luong() > maxLuong){
      maxLuong = ds[i]->luong();
    }
  }
  for(int i = 0; i < ds.size(); i++){
    if(ds[i]->luong() == maxLuong){
      cout << *ds[i] << endl;
    }
  }
}
void DSCaSi::sapXep(){
  for(int i = 0; i < ds.size() - 1; i++){
    for(int j = i + 1; j < ds.size(); j++){
      if(ds[i]->luong() < ds[j]->luong()){
        swap(ds[i], ds[j]);
      }
    }
  }
}
#include <sstream>

int main(){
  freopen("input.txt", "rt", stdin);
  freopen("output.txt", "wt", stdout);
  DSCaSi dsCaSi;
  int n;
  cin >> n;
  cin.ignore();

  for(int i = 0; i < n; i++){
    string line;
    getline(cin, line);
    stringstream ss(line);
    string temp;
    vector<string> v;
    while(ss >> temp){
      v.push_back(temp);
    }
    string ngheDanh = v[0];
    string maSo = v[1];
    int soBuoi = stoi(v[2]);
    if(v.size() == 3){
      dsCaSi.ds.push_back(new CaSiHatBe(ngheDanh, maSo, soBuoi));
    }
    else if(v.size() == 5){
      int soDia = stoi(v[3]);
      float rating = stof(v[4]);
      dsCaSi.ds.push_back(new CaSiTiemNang(ngheDanh, maSo, soBuoi, soDia, rating));
    }
    else if(v.size() == 6){
      int soDia = stoi(v[3]);
      float rating = stof(v[4]);
      int soGameShow = stoi(v[5]);
      dsCaSi.ds.push_back(new CaSiNgoiSao(ngheDanh, maSo, soBuoi, soDia, rating, soGameShow));
    }
  }
  //Hien thi thong tin ca si
  cout << "Danh sach ca si: " << endl;
  cout << dsCaSi.ds.size() << endl;
  for(int i = 0; i < dsCaSi.ds.size(); i++){
    cout << *(dsCaSi.ds[i]) << endl;
  }
  cout << endl;

  //Hien thi danh sach ca si co luong cao nhat
  cout << "Ca si co luong cao nhat: " << endl;
  dsCaSi.luongCaoNhat();
  cout << endl;

  //Sap xep danh sach ca si theo luong giam dan
  cout << "Danh sach ca si sau khi sap xep: " << endl;
  dsCaSi.sapXep();

  for(int i = 0; i < dsCaSi.ds.size(); i++){
    cout << *dsCaSi.ds[i] << endl;
  }
  
  return 0;
}