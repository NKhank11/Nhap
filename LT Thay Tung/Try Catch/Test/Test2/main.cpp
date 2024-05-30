#include <iostream>
#include <cmath>
using namespace std;
int division(int a, int b){
  if(b == 0){
    throw 1;
  }
  return a/b;
}
int main(){
  int x = 10, z;
  for(int i = -3; i < 3; i++){
    try{
      z = division(x, i);
      cout << z << endl;
    }
    catch(int e){
      cout << "Khong the chia cho 0 " << endl;
    }
  }
  return 0;
}