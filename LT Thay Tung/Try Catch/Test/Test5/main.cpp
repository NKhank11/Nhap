#include <iostream>
#include <string>
#include <exception>
using namespace std;
class MyException : public exception{
  public:
    const char* what() const throw(){
      return "Pass khong hop le";
    }
};

int main(){ 
  string pass;
  cout << "Nhap pass: ";
  cin >> pass; 
  try{
    if(pass.length() < 8){
      throw MyException();
    }
    else{
      cout << "Pass hop le" << endl;
    }
  }
    catch(MyException e){
    cout << e.what() << endl;
  }
  return 0;
}