#include <iostream>
using namespace std;
class MyException{
  public:
    string message(){
      return string("Chia cho so 0");
    }
};
class PhanSo{
  int tu, mau;
  public:
  PhanSo(int tu, int mau){
    this->tu = tu;
    this->mau = mau;
  }
  PhanSo operator/(PhanSo ps){
    if(ps.tu == 0){
      throw MyException();
    }
    return PhanSo(this->tu*ps.mau, this->mau*ps.tu);
  }
};
int main(){
  PhanSo ps1(1, 2), ps2(0, 3);
  try{
    PhanSo ps3 = ps1 / ps2;
  }
  catch(MyException e){
    cout << e.message() << endl;
  }
  return 0;
}