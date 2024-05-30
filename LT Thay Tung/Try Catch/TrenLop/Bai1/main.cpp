#include <iostream>
#include <vector>
#include <string>
#include <stdexcept>

using namespace std;

// Định nghĩa lớp Ghế
class Seat {
private:
    char row; // Hàng ghế
    int number; // Số ghế
    bool isVIP; // Ghế VIP hay không
    bool isBooked; // Ghế đã được đặt hay chưa
public:
    // Constructor mặc định
    Seat() : row('A'), number(1), isVIP(false), isBooked(false) {}

    // Constructor
    Seat(char r, int num, bool vip) : row(r), number(num), isVIP(vip), isBooked(false) {}

    // Phương thức để lấy giá của ghế
    int getPrice() const {
        return isVIP ? 150000 : 80000;
    }

    // Phương thức để lấy thông tin của ghế
    string getInfo() const {
        return (isVIP ? "V" : "T") + string("-") + row + to_string(number) + (isBooked ? "(B)" : "");
    }

    // Phương thức để đặt ghế
    void book() {
        if (isBooked) {
            throw invalid_argument("Da mua");
        }
        isBooked = true;
    }
};

// Định nghĩa lớp Rạp Chiếu Phim
class Cinema {
private:
    int rows; // Số hàng ghế
    int cols; // Số ghế trong mỗi hàng
    vector<vector<Seat>> seats; // Ma trận ghế

public:
    // Constructor
    Cinema(int m, int n) : rows(m), cols(n) {
       
        if (m < 0 || n < 0 || m > 50 || n > 50) {
            throw invalid_argument("Khong ton tai");
        }
        
       
        seats.resize(rows);
        for (int i = 0; i < rows; ++i) {
            seats[i].resize(cols);
            for (int j = 0; j < cols; ++j) {
                bool isVIP = (i >= 3 && i < rows - 3 && j >= 2 && j < cols - 2);
                seats[i][j] = Seat('A' + i, j + 1, isVIP);
            }
        }
    }

    void printSeats() const {
        for (int i = rows - 1; i >= 0; --i) {
            for (int j = 0; j < cols; ++j) {
                cout << seats[i][j].getInfo() << "\t";
            }
            cout << endl;
        }
    }

    int buyTicket(char rowChar, int col) {
        int row = rowChar - 'A' + 1;
        if (row < 1 || row > rows || col < 1 || col > cols) {
            throw invalid_argument("Invalid seat number");
        }
        Seat& seat = seats[row - 1][col - 1];
        seat.book(); 
        return seat.getPrice();
    }
};

int main() {
    int m, n;
    cout << "Nhap so luong hang ghe (M): ";
    cin >> m;
    cout << "Nhap so luong ghe moi hang (N): ";
    cin >> n;

    try {
        Cinema cinema(m, n);
        cinema.printSeats();
        
        int k;
        cout << "Nhap so luong ghe muon mua: ";
        cin >> k;

        vector<pair<char, int>> seatsToBuy;
        cin.ignore(); 

        for (int i = 0; i < k; ++i) {
            string seatPosition;
            cin >> seatPosition;

            if (seatPosition.size() < 2) {
                cout << "Loi: Khong ton tai" << endl;
                --i;
                continue;
            }

            char rowChar = seatPosition[0];
            int col;
            try {
                col = stoi(seatPosition.substr(1));
            } catch (const invalid_argument&) {
                cout << "Loi: Khong ton tai" << endl;
                --i;
                continue;
            }

            seatsToBuy.push_back(make_pair(rowChar, col));
        }

        int totalSum = 0;
        for (const auto& seat : seatsToBuy) {
            try {
                totalSum += cinema.buyTicket(seat.first, seat.second);
            } catch (const invalid_argument& e) {
                cout << "Loi: " << e.what() << " at seat " << seat.first << seat.second << endl;
            }
        }

        cout << "Tong so tien can tra: " << totalSum << " VND" << endl;
        cinema.printSeats();

    } catch (const invalid_argument& e) {
        cout << "Loi: " << e.what() << endl;
    }

    return 0;
}
