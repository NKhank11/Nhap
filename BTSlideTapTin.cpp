// //Bai 1
// #include <iostream>
// #include <fstream>
// using namespace std;
// class PhanSo{
//     private:
//         int tuSo;
//         int mauSo;
//     public:
//         PhanSo(){
//             tuSo = 0;
//             mauSo = 1;
//         }
//         friend ifstream& operator>>(ifstream& in, PhanSo& ps){
//             in >> ps.tuSo >> ps.mauSo;
//             return in;
//         }
//         friend ostream& operator<<(ostream& out, PhanSo ps){
//             out << ps.tuSo << " " << ps.mauSo;
//             return out;
//         }
//         PhanSo operator+(PhanSo ps){
//             PhanSo tong;
//             if(mauSo == ps.mauSo){
//                 tong.tuSo = tuSo + ps.tuSo;
//                 tong.mauSo = mauSo;
//                 return tong;
//             }
//             else{
//                 tong.tuSo = tuSo * ps.mauSo + mauSo * ps.tuSo;
//                 tong.mauSo = mauSo * ps.mauSo;
//                 return tong;
            
//             }
//             return tong;
//         }
// };
// int main(){
//     ifstream in("input.txt");
//     ofstream out("output.txt");
//     PhanSo ps1, ps2;
//     in >> ps1 >> ps2;
//     PhanSo tong = ps1 + ps2;
//     out << tong;
//     in.close();
//     out.close();

//     return 0;
// }   

// // Bai 2
// #include <iostream>
// #include <fstream>
// using namespace std;
// class PhanSo{
//     private:
//         int tuSo;
//         int mauSo;
//     public:
//         PhanSo(){
//             tuSo = 0;
//             mauSo = 1;
//         }
//         friend ifstream& operator>>(ifstream& in, PhanSo& ps){
//             in >> ps.tuSo >> ps.mauSo;
//             return in;
//         }
//         friend ostream& operator<<(ostream& out, PhanSo ps){
//             out << ps.tuSo << " " << ps.mauSo;
//             return out;
//         }
//         PhanSo operator+(PhanSo ps){
//             PhanSo tong;
//             if(mauSo == ps.mauSo){
//                 tong.tuSo = tuSo + ps.tuSo;
//                 tong.mauSo = mauSo;
//                 return tong;
//             }
//             else{
//                 tong.tuSo = tuSo * ps.mauSo + mauSo * ps.tuSo;
//                 tong.mauSo = mauSo * ps.mauSo;
//                 return tong;
            
//             }
//             return tong;
//         }
// };
// int main(){
//     ifstream in("input2.txt");
//     ofstream out("output2.txt");
//     int n;
//     in >> n;
//     PhanSo *ps = new PhanSo[n];
//     for(int i = 0; i < n; i++){
//         in >> ps[i];
//     }
//     PhanSo tong;
//     for(int i = 0; i < n; i++){
//         tong = tong + ps[i];
//     }
//     out << tong;
//     in.close();
//     out.close();

//     return 0;
// }   

// // Bai 3
// #include <iostream>
// #include <fstream>
// #include <string>
// using namespace std;
// class PhanSo{
//     private:
//         int tuSo;
//         int mauSo;
//     public:
//         PhanSo(){
//             tuSo = 0;
//             mauSo = 1;
//         }
//         friend ifstream& operator>>(ifstream& in, PhanSo& ps){
//             in >> ps.tuSo >> ps.mauSo;
//             return in;
//         }
//         friend ostream& operator<<(ostream& out, PhanSo ps){
//             out << ps.tuSo << " " << ps.mauSo;
//             return out;
//         }
//         PhanSo operator+(PhanSo ps){
//             PhanSo tong;
//             if(mauSo == ps.mauSo){
//                 tong.tuSo = tuSo + ps.tuSo;
//                 tong.mauSo = mauSo;
//             }
//             else{
//                 tong.tuSo = tuSo * ps.mauSo + mauSo * ps.tuSo;
//                 tong.mauSo = mauSo * ps.mauSo;
//             }
//             return tong;
//         }
// };
// int main(){
//     ifstream in("input3.txt");
//     ofstream out("output3.txt");
//     PhanSo ps;
//     PhanSo tong;
//     while(in >> ps){
//         tong = tong + ps;
//     }
//     out << tong;
//     in.close();
//     out.close();

//     return 0;
// }   

// // Bai 4
// #include <iostream>
// #include <fstream>
// #include <sstream>
// using namespace std;
// class NhanVat{
//     private:
//         string ten;
//     public:
//         NhanVat(){
//             ten = "";
//         }
//         // C1: ten co 1 tu
//         // friend ifstream& operator>>(ifstream& in, NhanVat& nv){
//         //     getline(in, nv.ten);
//         //     return in;
//         // }
//         // friend ostream& operator<<(ostream& out, NhanVat nv){
//         //     out << nv.ten << " " << nv.ten.length();
//         //     return out;
//         // }
//         // bool operator < (NhanVat& nv) {
//         //     return this->ten.length() < nv.ten.length();
//         // }
        
//         // C2: ten co nhieu tu
//         friend ifstream& operator>>(ifstream& in, NhanVat& nv){
//             getline(in, nv.ten);
//             return in;
//         }     
//         int sizeOfTen(){
//             stringstream ss(this->ten);
//             string temp;
//             string res;
//             while(ss >> temp){
//                 res += temp;
//             }
//             return res.length();
//         }        
//         friend ostream& operator<<(ostream& out, NhanVat nv){
//             out << nv.ten << " " << nv.sizeOfTen();
//             return out;
//         }
//         bool operator < (NhanVat& nv) {
//             return this->sizeOfTen() < nv.sizeOfTen();
//         }

// };
// int main(){
//     ifstream in("input4.txt");
//     ofstream out("output4.txt");
//     NhanVat nv, longest;
//     while(in >> nv){
//         if(longest < nv){
//             longest = nv;
//         }
//     }
//     out << longest;
//     return 0;
// }


// // Bai 5
// #include <iostream>
// #include <fstream>
// #include <sstream>
// using namespace std;
// class NgaySinh{
//     private:
//         int d;
//         int m;
//         int y;
//     public:
//         NgaySinh(){
//             d = 1;
//             m = 1;
//             y = 1;
//         }
//         int getterY(){
//             return y;
//         }
//         friend istream& operator>>(istream& in, NgaySinh& n){
//             char slash;
//             in >> n.d >> slash >> n.m >> slash >> n.y;
//             return in;
//         }
//         friend ofstream& operator<<(ofstream& out, NgaySinh date){
//             out << date.d << "/" << date.m << "/" << date.y;
//             return out;
//         }
//         bool operator < (NgaySinh& date) {
//             if(this->y < date.y){
//                 return true;
//             }
//             else if(this->y == date.y){
//                 if(this->m < date.m){
//                     return true;
//                 }
//                 else if(this->m == date.m){
//                     if(this->d < date.d){
//                         return true;
//                     }
//                 }
//             }
//             return false;
//         }
        
// };
// class CauThu {
//     private:
//         string name;
//         NgaySinh date;
//     public:
//         CauThu(){
//             name = "";
//         }
//         friend istream& operator>>(istream& in, CauThu& ct){
//             getline(in, ct.name, ' ');
//             in >> ct.date;
//             return in;
//         }
//         friend ostream& operator<<(ostream& out, CauThu ct){
//             out << ct.name << " " << 2024 - ct.date.getterY();
//             return out;
//         }
//         bool operator < (CauThu& ct) {
//             return this->date < ct.date;
//         }
// };
// int main(){
//     ifstream in("input5.txt");
//     ofstream out("output5.txt");
//     CauThu ct, oldest;
//     while(in >> ct){
//         if(oldest < ct){
//             oldest = ct;
//         }
//     }
//     out << oldest;
//     in.close();
//     out.close();
//     return 0;
// }


// Bai 6
#include <iostream>
#include <fstream>
#include <string>
#include <map>
using namespace std;

class Vote {
    string voteCode;
    string singer;
    string voteTime;
public:
    friend istream& operator>>(istream& in, Vote& v){
        getline(in, v.voteCode, ',');
        getline(in, v.singer, ',');
        getline(in, v.voteTime);
        return in;
    }
    string getSinger() const {
        return singer;
    }
};

int main(){
    ifstream in("input6.txt");
    ofstream out("output6.txt");
    map<string, int> voteCount;
    Vote v;
    while(in >> v){
        voteCount[v.getSinger()]++;
    }
    string mostVotedSinger;
    int maxVotes = 0;
    for(auto& pair : voteCount){
        if(pair.second > maxVotes){
            maxVotes = pair.second;
            mostVotedSinger = pair.first;
        }
    }
    out << mostVotedSinger;
    in.close();
    out.close();
    return 0;
}