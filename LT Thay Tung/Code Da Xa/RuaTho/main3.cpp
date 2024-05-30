#include <iostream>
#include <vector>
#include <string>
#include <sstream>
using namespace std;
class Animal{
  protected:
    string code;
    int speed;
    int equipment;
  public:
    Animal(string, int, int);
    string getCode(){
      return code;
    }
    virtual float timeStart() = 0;
    virtual float distance() = 0;
    virtual float timeEnd() = 0;
    virtual int realSpeed() = 0;
    virtual void show();
};
Animal::Animal(string code, int speed, int equipment){
  this->code = code;
  this->speed = speed;
  this->equipment = equipment;
}
void Animal::show(){
  // cout << code << " " << speed << " " << equipment << " " << distance() << " " << 
  // realSpeed() << " " << timeStart() << " " << timeEnd() << endl;
  cout << code << " " << speed << " " << equipment << endl;
}

class Lion: public Animal {
  public:
    Lion(string, int, int);

    float timeStart();
    float distance();
    float timeEnd();
    int realSpeed();
};
Lion::Lion(string code, int speed, int equipment):Animal(code, speed, equipment){
}
float Lion::timeStart(){
  return 9;
}
float Lion::distance(){
  return 210;
}
float Lion::timeEnd(){
  return Lion::timeStart() + Lion::distance() / Lion::realSpeed();
}
int Lion::realSpeed(){
  if(equipment == 1){
    return speed * 2;
  }
  return speed;
}

class Rabbit: public Animal {
  public:
    Rabbit(string, int, int);
    float timeStart();
    float distance();
    float timeEnd();
    int realSpeed();
};
Rabbit::Rabbit(string code, int speed, int equipment):Animal(code, speed, equipment){
}
float Rabbit::timeStart(){
  return 8;
}
float Rabbit::distance(){
  return 210;
}
float Rabbit::timeEnd(){
  return Rabbit::timeStart() + Rabbit::distance() / Rabbit::realSpeed();
}
int Rabbit::realSpeed(){
  if(equipment == 1){
    return speed + 30;
  }
  return speed;
}

class Tortoise: public Animal {
  public:
    Tortoise(string, int, int);
    float timeStart();
    float distance();
    float timeEnd();
    int realSpeed();
};
Tortoise::Tortoise(string code, int speed, int equipment):Animal(code, speed, equipment){
}
float Tortoise::timeStart(){
  return 7;
}
float Tortoise::distance(){
  return 210 - 75;
}
float Tortoise::timeEnd(){
  return Tortoise::timeStart() + Tortoise::distance() / Tortoise::realSpeed();
}
int Tortoise::realSpeed(){
  if(equipment == 1){
    return speed * 5;
  }
  return speed;
}



int main(){
  freopen("input.txt", "r", stdin);
  freopen("output3.txt", "w", stdout);

  int n;
  cin >> n;
  cin.ignore();
  vector<Animal*> animals;
  string line;
  for(int i = 0; i < n; i++){
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
      animals.push_back(new Lion(code, speed, equipment));
    }
    if(code[0] == 'R'){
      animals.push_back(new Rabbit(code, speed, equipment));
    }
    if(code[0] == 'T'){
      animals.push_back(new Tortoise(code, speed, equipment));
    }
  }
  for(int i = 0; i < animals.size(); i++){
    animals[i]->show();
  }
  cout << endl;


  vector<Animal*> winners;
  int timesUp = 12;
  for(int i = 0; i < animals.size(); i++){
    if(animals[i]->timeEnd() <= timesUp){
      winners.push_back(animals[i]);
    }
  }
  //Sap xep theo thoi gian ve dich, neu bang nhau thi xep theo alphabet cua ma so
  for(int i = 0; i < winners.size() - 1; i++){
    for(int j = i + 1; j < winners.size(); j++){
      if(winners[i]->timeEnd() > winners[j]->timeEnd()){
        swap(winners[i], winners[j]);
      }
      if(winners[i]->timeEnd() == winners[j]->timeEnd()){
        if(winners[i]->getCode() > winners[j]->getCode()){
          swap(winners[i], winners[j]);
        }
      }
    }
  }

  cout << winners.size() << endl;
  //In them so thu tu o truoc
  for(int i = 0; i < winners.size(); i++){
    cout << i + 1 << ". ";
    winners[i]->show();
  }
  return 0;
}