#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <iomanip>
#include <fstream>
using namespace std;
class Animal{
  protected:
    string code;
    int speed;
    int equipment;
    int timeStart;
  public:
    Animal(string, int, int);
    string getCode(){
      return code;
    }
    virtual void print();
    virtual int tocDo() = 0; 
    virtual int getTimeStart() = 0;
};
Animal::Animal(string code, int speed, int equipment){
  this->code = code;
  this->speed = speed;
  this->equipment = equipment;
}
void Animal::print(){ 
  cout << code << " " << speed << " " << equipment << endl;
}


class Lion: public Animal {
  private:
    int timeStart;
  public:
    Lion(string, int, int, int);
    int getTimeStart();
    int tocDo();
};
Lion::Lion(string code, int speed, int equipment, int timeStart):Animal(code, speed, equipment){
  this->timeStart = timeStart;
}
int Lion::getTimeStart(){
  return timeStart;
}
int Lion::tocDo(){
  if(equipment == 1){
    return speed * 2;
  }
  return speed;
}


class Rabbit: public Animal {
  private:
    int timeStart;
  public:
    Rabbit(string, int, int, int);
    int getTimeStart();
    int tocDo();
};
Rabbit::Rabbit(string code, int speed, int equipment, int timeStart) : Animal(code, speed, equipment){
  this->timeStart = timeStart;
}
int Rabbit::getTimeStart(){
  return timeStart;
}
int Rabbit::tocDo(){
  if(equipment == 1){
    return speed + 30;
  }
  return speed;
}


class Tortoise: public Animal {
  private:
    int timeStart;
  public:
    Tortoise(string, int, int, int);
    int getTimeStart();
    int tocDo();
};
Tortoise::Tortoise(string code, int speed, int equipment, int timeStart) : Animal(code, speed, equipment){
  this->timeStart = timeStart;
}
int Tortoise::getTimeStart(){
  return timeStart;
}
int Tortoise::tocDo(){
  if(equipment == 1){
    return speed * 5;
  }
  return speed;
}


int main(){
  freopen("input.txt", "rt", stdin);
  freopen("output.txt", "wt", stdout);

  int n;
  cin >> n;
  cin.ignore();
  vector<Animal*> animals;
  int distance = 210;
  int timeStartOfLion = 9;
  int timeStartOfRabbit = 8;
  int timeStartOfTortoise = 7;
  int timeEnd = 12;  
  for(int i = 0; i < n; i++){
    string line;
    getline(cin, line);
    stringstream ss(line);
    string temp;
    vector<string> v;
    while(ss >> temp){
      v.push_back(temp);
    }
    string code = v[0];
    int speed = stoi(v[1]);
    int equipment = stoi(v[2]);

    if(code[0] == 'L'){
      animals.push_back(new Lion(code, speed, equipment, timeStartOfLion));
    }
    else if(code[0] == 'R'){
      animals.push_back(new Rabbit(code, speed, equipment, timeStartOfRabbit));
    }
    else if(code[0] == 'T'){
      animals.push_back(new Tortoise(code, speed, equipment, timeStartOfTortoise));
    }
  }

  vector<Animal*> res;
  timeEnd = 12;
  for(int i = 0; i < n; i++){
    distance = 210;
    if(animals[i]->getCode()[0] == 'T'){
      distance -= 75;
    }
    if(distance / animals[i]->tocDo() + animals[i]->getTimeStart() < timeEnd){
      res.push_back(animals[i]);
    }
  }

  //Sap xep theo thoi gian ve dich
  for(int i = 0; i < res.size(); i++){
    for(int j = i + 1; j < res.size(); j++){
      distance = 210;
      if(animals[i]->getCode()[0] == 'T'){
        distance -= 75;
      }
      if(1.0*distance / res[i]->tocDo() + res[i]->getTimeStart() > 1.0*distance / res[j]->tocDo() + res[j]->getTimeStart()){
        swap(res[i], res[j]);
      }
    }
  }

  for(Animal* a : res){
    distance = 210;
    if(a->getCode()[0] == 'T'){
      distance -= 75;
    }
    cout << a->getCode() << " " << a->getTimeStart() << " " << a->tocDo() << " " << 1.0*distance / a->tocDo() + a->getTimeStart() << endl;
  }



  // Clean up memory
  for(Animal* a : animals){
      delete a;
  }
  return 0;
}