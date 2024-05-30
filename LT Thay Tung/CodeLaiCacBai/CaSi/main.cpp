#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <iomanip>
#include <sstream>
using namespace std;
class CaSi{
  public:
    string ngheDanh;
    string maSo;
    int soBuoi;
  public:
    CaSi();
    CaSi(string, string, int);
    virtual int luong() = 0;
    virtual istream& read(istream& is);
    virtual ostream& write(ostream &os);
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
istream& CaSi::read(istream& is){
  is >> ngheDanh >> maSo >> soBuoi;
  return is;
}
ostream& CaSi::write(ostream& os){
  os << ngheDanh << " " << maSo << " " << soBuoi;
  return os;
}

//Toan cuc
istream& operator>>(istream& is, CaSi& cs){
  return cs.read(is);
}
ostream& operator<<(ostream& os, CaSi& cs){
  return cs.write(os);
}

//Tao lop CaSiHatBe
class CaSiHatBe : public CaSi{
  public:
    CaSiHatBe();
    CaSiHatBe(string, string, int);
    int luong();
};
CaSiHatBe::CaSiHatBe():CaSi(){
}
CaSiHatBe::CaSiHatBe(string ngheDanh, string maSo, int soBuoi) : CaSi(ngheDanh, maSo, soBuoi){
}
int CaSiHatBe::luong(){
  return soBuoi * 500000;
}

//Tao lop CaSiTiemNang
class CaSiTiemNang : public CaSi{
  private:
    int soDia;
    float rating;
  public:
    CaSiTiemNang();
    CaSiTiemNang(string, string, int, int, float);
    int luong();
    istream& read(istream& is);
    ostream& write(ostream &os);
};
CaSiTiemNang::CaSiTiemNang():CaSi(){
  soDia = 0;
  rating = 0.0;
}
CaSiTiemNang::CaSiTiemNang(string ngheDanh, string maSo, int soBuoi, int soDia, float rating) : CaSi(ngheDanh, maSo, soBuoi){
  this->soDia = soDia;
  this->rating = rating;
}
int CaSiTiemNang::luong(){
  return 3000000 + 1000*soDia + 500000*soBuoi;
}
istream& CaSiTiemNang::read(istream& is){
  is >> ngheDanh >> maSo >> soBuoi >> soDia >> rating;
  return is;
}
ostream& CaSiTiemNang::write(ostream& os){
  os << ngheDanh << " " << maSo << " " << soBuoi << " " << soDia << " " << rating;
  return os;
}

//Tao lop CaSiNgoiSao
//Tao lop CaSiNgoiSao
class CaSiNgoiSao : public CaSi{
  private:
    int soDia;
    float rating;
    int soGameShow;
  public:
    CaSiNgoiSao();
    CaSiNgoiSao(string, string, int, int, float, int);
    int luong();
    istream& read(istream& is);
    ostream& write(ostream &os);
};
CaSiNgoiSao::CaSiNgoiSao():CaSi(){
  soDia = 0;
  rating = 0.0;
  soGameShow = 0;
}
CaSiNgoiSao::CaSiNgoiSao(string ngheDanh, string maSo, int soBuoi, int soDia, float rating, int soGameShow) : CaSi(ngheDanh, maSo, soBuoi){
  this->soDia = soDia;
  this->rating = rating;
  this->soGameShow = soGameShow;
}
int CaSiNgoiSao::luong(){
  return 3000000 + 5000*soDia + 3000000*soBuoi + 5000000*soGameShow;
}
istream& CaSiNgoiSao::read(istream& is){
  is >> ngheDanh >> maSo >> soBuoi >> soDia >> rating >> soGameShow;
  return is;
}
ostream& CaSiNgoiSao::write(ostream& os){
  os << ngheDanh << " " << maSo << " " << soBuoi << " " << soDia << " " << rating << " " << soGameShow;
  return os;
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
    if(ds[i]->maSo == maSo){
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
int main(){
  freopen("input.txt", "rt", stdin);
  DSCaSi dsCaSi;
  int n;
  cin >> n;
  cin.ignore();

  for(int i = 0; i < n; i++){
    string line;
    getline(cin, line);
    stringstream ss(line);
    string temp;
    int dem = 0;
    while(ss >> temp){
      dem++;
    }
    ss.clear();
    if(dem == 3){
      CaSiHatBe *cs;
      cin >> *cs;
      dsCaSi.ds.push_back(cs);
    }
    else if(dem == 5){
      CaSiTiemNang *cs;
      cin >> *cs;
      dsCaSi.ds.push_back(cs);
    }
    else if(dem == 6){
      CaSiNgoiSao *cs;
      cin >> *cs;
      dsCaSi.ds.push_back(cs);
    }
  }
  cout << dsCaSi.ds.size() << endl;
  for(int i = 0; i < dsCaSi.ds.size(); i++){
    cout << *dsCaSi.ds[i] << endl;
  }
  return 0;
}