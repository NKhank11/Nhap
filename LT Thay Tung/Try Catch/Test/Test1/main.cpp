#include <iostream>
#include <cmath>
using namespace std;
int main(){
  float x;
  cin >> x;
  try{
    if(x < 0){
      throw 1;
    }
    cout << "Ket qua can bac hai cua " << x << " la: " << sqrt(x) << endl;
  }
  catch(int e){
    cout << "Khong the tinh can bac hai cua so am" << endl;
  }
  return 0;
}