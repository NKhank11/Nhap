#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <algorithm>
using namespace std;
class VatNuoi{
  protected:
    string maSo;
    float canNang, tuoi;
  public:
    float getTuoi(){
      return tuoi;
    }
    VatNuoi(string, float, float);
    virtual float luongSua() = 0;
    virtual void xuat();
};
VatNuoi::VatNuoi(string maSo, float canNang, float tuoi){
  this->maSo = maSo;
  this->canNang = canNang;
  this->tuoi = tuoi;
}
void VatNuoi::xuat(){
  cout << maSo << " " << canNang << " " << tuoi << " " << luongSua() << " " << endl;
}

class Bo: public VatNuoi {
  public:
    Bo(string, float, float);
    float luongSua();
};

Bo::Bo(string maSo, float canNang, float tuoi):VatNuoi(maSo, canNang, tuoi){
}

float Bo::luongSua(){
  float luongSua = 0;
  if(tuoi >= 2 && tuoi <= 5){
    luongSua = max(0.0f, (canNang - tuoi) / 10);
  }
  return luongSua;
}

class De: public VatNuoi {
  public:
    De(string, float, float);
    float luongSua();
};

De::De(string maSo, float canNang, float tuoi):VatNuoi(maSo, canNang, tuoi){
}

float De::luongSua(){
  float luongSua = 0;
  if(tuoi >= 1 && tuoi <= 2){
    luongSua = canNang / 10;
  }
  if(tuoi > 2 && tuoi <= 4){
    luongSua = canNang / 15;
  }
  if(tuoi < 1 || tuoi > 4){
    luongSua = 0;
  }
  return luongSua;
}
int main(){
  freopen("input.txt", "r", stdin);
  freopen("output.txt", "w", stdout);

  vector<VatNuoi*> dsVatNuoi;
  string line;
  while(getline(cin, line)){
    for(int i = 0; i < line.size(); i++){
      if(line[i] == ','){
        line[i] = ' ';
      }
    }
    stringstream ss(line);
    string temp;
    vector<string> v;
    while(ss >> temp){
      v.push_back(temp);
    }
    string maSo = v[0];
    float canNang = stof(v[1]);
    float tuoi = stof(v[2]);
    if(maSo[0] == 'B'){
      dsVatNuoi.push_back(new Bo(maSo, canNang, tuoi));
    }
    else if (maSo[0] == 'D'){
      dsVatNuoi.push_back(new De(maSo, canNang, tuoi));
    }
  }

  //Sap xep theo luong sua, neu luong sua bang nhau thi sap con it tuoi len tren
  for(int i = 0; i < dsVatNuoi.size() - 1; i++){
    for(int j = i + 1; j < dsVatNuoi.size(); j++){
      if(dsVatNuoi[i]->luongSua() < dsVatNuoi[j]->luongSua()){
        swap(dsVatNuoi[i], dsVatNuoi[j]);
      }
      if(dsVatNuoi[i]->luongSua() == dsVatNuoi[j]->luongSua() && dsVatNuoi[i]->getTuoi() > dsVatNuoi[j]->getTuoi()){
        swap(dsVatNuoi[i], dsVatNuoi[j]);
      }
    }
  }
  for(int i = 0; i < dsVatNuoi.size(); i++){
    dsVatNuoi[i]->xuat();
  }

  //Clean memory
  for(int i = 0; i < dsVatNuoi.size(); i++){
    delete dsVatNuoi[i];
  }
  return 0;
}