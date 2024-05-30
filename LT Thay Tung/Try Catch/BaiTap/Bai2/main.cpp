#include <iostream>
using namespace std;

class Speedometer {
  private:
    int speed;

  public:
    Speedometer() : speed(0) {}

    void increaseSpeed() {
      if (speed >= 60) {
        throw "Qua toc do";
      }
      speed++;
      cout << "Toc do hien tai: " << speed << " km/h" << endl;
    }

    void decreaseSpeed() {
      while (speed > 50) {
        speed--;
        cout << "Giam toc do: " << speed << " km/h" << endl;
      }
      cout << "Toc do hien tai: " << speed << " km/h" << endl;
    }

    int getSpeed() const {
      return speed;
    }
};

int main() {
  Speedometer speedometer;
  char key;

  while (true) {
    cout << "Nhan r de tang toc do ";
    cin >> key;

    if (key == 'r') {
      try {
        speedometer.increaseSpeed();
      } catch (const char* msg) {
        cout << msg << endl;
        speedometer.decreaseSpeed();
      }
    } else {
      cout << "Nhap sai phim vui long tu lai" << endl;
    }
  }

  return 0;
}
