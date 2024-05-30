#include <iostream>
using namespace std;
int main(){
  try{
    string s;
    s.resize(-1);
  }
  catch(exception& e){
    cout << "Loi: " << e.what() << endl;
  }
  return 0;
}