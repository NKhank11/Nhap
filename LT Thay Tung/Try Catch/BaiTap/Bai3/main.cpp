#include <iostream>
using namespace std;

class ATM {
  private:
    int fiveHundred;
    int twoHundred;
    int oneHundred;
    int fifty;
    int totalAmount;

  public:
    ATM() : fiveHundred(10), twoHundred(20), oneHundred(10), fifty(2) {
      totalAmount = fiveHundred * 500000 + twoHundred * 200000 + oneHundred * 100000 + fifty * 50000;
    }

    void withdraw(int amount) {
      if (amount % 50000 != 0) {
        cout << "The amount must be a multiple of 50,000 VND." << endl;
        return;
      }

      if (amount > totalAmount) {
        cout << "Insufficient funds in the ATM." << endl;
        return;
      }

      int num500 = min(amount / 500000, fiveHundred);
      amount -= num500 * 500000;

      int num200 = min(amount / 200000, twoHundred);
      amount -= num200 * 200000;

      int num100 = min(amount / 100000, oneHundred);
      amount -= num100 * 100000;

      int num50 = min(amount / 50000, fifty);
      amount -= num50 * 50000;

      if (amount > 0) {
        cout << "Sorry, unable to dispense the exact amount with available denominations." << endl;
        return;
      }

      if (num500 == 0 || num200 == 0 || num100 == 0 || num50 == 0) {
        cout << "Sorry, unable to dispense the exact amount with available denominations." << endl;
        return;
      }

      fiveHundred -= num500;
      twoHundred -= num200;
      oneHundred -= num100;
      fifty -= num50;
      totalAmount -= (num500 * 500000 + num200 * 200000 + num100 * 100000 + num50 * 50000);

      cout << "Withdrawal successful: " << endl;
      cout << "500,000 VND: " << num500 << " notes" << endl;
      cout << "200,000 VND: " << num200 << " notes" << endl;
      cout << "100,000 VND: " << num100 << " notes" << endl;
      cout << "50,000 VND: " << num50 << " notes" << endl;
    }

    void display() {
      cout << "Remaining funds in the ATM:" << endl;
      cout << "500,000 VND: " << fiveHundred << " notes" << endl;
      cout << "200,000 VND: " << twoHundred << " notes" << endl;
      cout << "100,000 VND: " << oneHundred << " notes" << endl;
      cout << "50,000 VND: " << fifty << " notes" << endl;
      cout << "Total amount: " << totalAmount << " VND" << endl;
    }
};

int main() {
  ATM atm;
  int amount;

  while (true) {
    cout << "Enter the amount to withdraw (0 to exit): ";
    cin >> amount;

    if (amount == 0) break;

    atm.withdraw(amount);
    atm.display();
  }

  return 0;
}
