#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <sstream>
#include <iomanip>
using namespace std;
class Animal{
  public:
    string code;
    int speed;
    bool equipment;
  public:
    Animal(string, int, bool);
    virtual int timeStart() = 0;
    virtual void print();
    virtual int tocDo() = 0;
    virtual int timeEndOfRace();
    virtual int distance();
    virtual int timeEndOfAnimal() = 0;
};
Animal::Animal(string code, int speed, bool equipment){
  this->code = code;
  this->speed = speed;
  this->equipment = equipment;
}
void Animal::print(){
  cout << code << " " << speed << " " << equipment << endl;
}
int Animal::timeEndOfRace(){
  return 12;
}
int Animal::distance(){
  return 210;
}


class Lion : public Animal {
  public:
    Lion(string, int, bool);
    int timeStart();
    int tocDo();
    int timeEndOfAnimal();
};
Lion::Lion(string code, int speed, bool equipment) : Animal(code, speed, equipment){
}
int Lion::timeStart(){
  return 9;
}
int Lion::tocDo(){
  if(equipment){
    return speed * 2;
  }
  return speed;
}
int Lion::timeEndOfAnimal(){
  return timeStart() + distance() / tocDo();
}

class Rabbit: public Animal {
  public:
    Rabbit(string, int, bool);
    int timeStart();
    int tocDo();
    int timeEndOfAnimal();
};
Rabbit::Rabbit(string code, int speed, bool equipment) : Animal(code, speed, equipment){
}
int Rabbit::timeStart(){
  return 8;
}
int Rabbit::tocDo(){
  if(equipment){
    return speed + 30;
  }
  return speed;
}
int Rabbit::timeEndOfAnimal(){
  return timeStart() + distance() / tocDo();
}

class Tortoise: public Animal {
  public:
    Tortoise(string, int, bool);
    int timeStart();
    int tocDo();
    int distance();
    int timeEndOfAnimal();
};

Tortoise::Tortoise(string code, int speed, bool equipment) : Animal(code, speed, equipment){
}
int Tortoise::timeStart(){
  return 7;
}
int Tortoise::tocDo(){
  if(equipment){
    return speed * 5;
  }
  return speed;
}
int Tortoise::distance(){
  return 210 - 75;
}
int Tortoise::timeEndOfAnimal(){
  return timeStart() + distance() / tocDo();
}
int main(){
  freopen("input.txt", "r", stdin);
  vector<Animal*> animals;
  int n;
  cin >> n;
  cin.ignore();
  for(int i = 0; i < n; i++){
    string line;
    getline(cin, line);
    stringstream ss(line);
    vector<string> v;
    string temp;
    while(ss >> temp){
      v.push_back(temp);
    }
    string code = v[0];
    int speed = stoi(v[1]);
    bool equipment = stoi(v[2]);
    if(code[0] == 'L'){
      animals.push_back(new Lion(code, speed, equipment));
    } else if(code[0] == 'R'){
      animals.push_back(new Rabbit(code, speed, equipment));
    } else if(code[0] == 'T') {
      animals.push_back(new Tortoise(code, speed, equipment));
    }
  }

  vector<Animal*> winners;
  for(int i = 0; i < animals.size(); i++){
    if(animals[i]->timeEndOfAnimal() <= animals[i]->timeEndOfRace()){
      winners.push_back(animals[i]);
    }
  }

    //Sap xep theo thoi gian ve dich, neu bang nhau thi xep theo alphabet cua ma so
  for(int i = 0; i < winners.size() - 1; i++){
    for(int j = i + 1; j < winners.size(); j++){
      if(winners[i]->timeEndOfAnimal() > winners[j]->timeEndOfAnimal()){
        swap(winners[i], winners[j]);
      }
      if(winners[i]->timeEndOfAnimal() == winners[j]->timeEndOfAnimal()){
        if(winners[i]->code > winners[j]->code){
          swap(winners[i], winners[j]);
        }
      }
    }
  }



  cout << winners.size() << endl;
  //In them so thu tu o truoc
  for(int i = 0; i < winners.size(); i++){
    cout << i + 1 << ". ";
    winners[i]->print();
  }
  return 0;
}