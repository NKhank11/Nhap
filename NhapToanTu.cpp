// //Bai 1 k dung nhap xuat
// #include <iostream>
// using namespace std;
// class CThoiGian{
//     private:
//         int h, m, s;
//     public:
//         CThoiGian(){
//             h = 0;
//             m = 0;
//             s = 0;
//         }
//         void nhap();
//         void xuat();
//         bool operator >= (const CThoiGian &tg);
//         CThoiGian operator + (const CThoiGian &tg);
//         CThoiGian operator - (const CThoiGian &tg);
//         CThoiGian operator ++ ();
//         CThoiGian operator -- ();
// };
// void CThoiGian::nhap(){
//     cout << "Nhap gio: ";
//     cin >> this->h;
//     cout << "Nhap phut: ";
//     cin >> this->m;
//     cout << "Nhap giay: ";
//     cin >> this->s;
//     cout << endl;
// }
// void CThoiGian::xuat(){
//     cout << this->h << "h:" << this->m << "m:" << this->s << "s" << endl;
// }
// bool CThoiGian::operator >= (const CThoiGian &tg){
//     if(this->h > tg.h) return true;
//     if(this->h == tg.h && this->m > tg.m) return true;
//     if(this->h == tg.h && this->m == tg.m && this->s >= tg.s) return true;
//     return false;
// }
// CThoiGian CThoiGian::operator + (const CThoiGian &tg){
//     CThoiGian kq;
//     kq.h = this->h + tg.h;
//     kq.m = this->m + tg.m;
//     kq.s = this->s + tg.s;
//     if(kq.s >= 60){
//         kq.s -= 60;
//         kq.m++;
//     }
//     if(kq.m >= 60){
//         kq.m -= 60;
//         kq.h++;
//     }
//     return kq;
// }
// CThoiGian CThoiGian::operator - (const CThoiGian &tg){
//     CThoiGian kq;
//     kq.h = this->h - tg.h;
//     kq.m = this->m - tg.m;
//     kq.s = this->s - tg.s;
//     if(kq.s < 0){
//         kq.s += 60;
//         kq.m--;
//     }
//     if(kq.m < 0){
//         kq.m += 60;
//         kq.h--;
//     }
//     return kq;
// }
// CThoiGian CThoiGian::operator++(){
//     this->s++;
//     if(this->s >= 60){
//         this->s -= 60;
//         this->m++;
//     }
//     if(this->m >= 60){
//         this->m -= 60;
//         this->h++;
//     }
// }
// CThoiGian CThoiGian::operator--(){
//     this->s--;
//     if(this->s < 0){
//         this->s += 60;
//         this->m--;
//     }
//     if(this->m < 0){
//         this->m += 60;
//         this->h--;
//     }
// }
// int main(){
//     CThoiGian tg1, tg2;
//     cout << "Nhap thoi gian 1: ";
//     tg1.nhap();
//     cout << "Nhap thoi gian 2: ";
//     tg2.nhap();

//     if(tg1 >= tg2) cout << "Thoi gian 1 lon hon hoac bang thoi gian 2" << endl;
//     else cout << "Thoi gian 1 nho hon thoi gian 2" << endl;

//     CThoiGian kq = tg1 + tg2;
//     cout << "Tong thoi gian 1 va thoi gian 2 la: ";
//     kq.xuat();

//     CThoiGian kq2 = tg1 - tg2;
//     cout << "\nHieu thoi gian 1 va thoi gian 2 la: ";
//     kq2.xuat();

//     cout << "\nThoi gian 1 sau khi tang 1 giay la: ";
//     ++tg1;
//     tg1.xuat();

//     cout << "\nThoi gian 2 sau khi giam 1 giay la: ";
//     --tg2;
//     tg2.xuat();
//     return 0;
// }

// //Bai 1 dung nhap xuat
// #include <iostream>
// using namespace std;
// class CThoiGian{
//     private:
//         int h, m, s;
//     public:
//         CThoiGian(){
//             h = 0;
//             m = 0;
//             s = 0;
//         }
//         friend istream &operator >> (istream &is, CThoiGian &tg);
//         friend ostream &operator << (ostream &os, CThoiGian tg);
//         bool operator >= (const CThoiGian &tg);
//         bool operator != (const CThoiGian &tg);
//         CThoiGian operator + (const CThoiGian &tg);
//         CThoiGian operator - (const CThoiGian &tg);
//         CThoiGian operator ++ ();
//         CThoiGian operator -- ();
// };
// istream &operator >> (istream &is, CThoiGian &tg){
//     cout << "Nhap gio: ";
//     is >> tg.h;
//     cout << "Nhap phut: ";
//     is >> tg.m;
//     cout << "Nhap giay: ";
//     is >> tg.s;
//     return is;
// }
// ostream &operator << (ostream &os, CThoiGian tg){
//     os << tg.h << "h:" << tg.m << "m:" << tg.s << "s";
//     return os;
// }
// bool CThoiGian::operator >= (const CThoiGian &tg){
//     if(this->h > tg.h) return true;
//     if(this->h == tg.h && this->m > tg.m) return true;
//     if(this->h == tg.h && this->m == tg.m && this->s >= tg.s) return true;
//     return false;
// }
// bool CThoiGian::operator != (const CThoiGian &tg){
//     if(this->h != tg.h || this->m != tg.m || this->s != tg.s) return true;
//     return false;
// }
// CThoiGian CThoiGian::operator + (const CThoiGian &tg){
//     CThoiGian kq;
//     kq.h = this->h + tg.h;
//     kq.m = this->m + tg.m;
//     kq.s = this->s + tg.s;
//     if(kq.s >= 60){
//         kq.s -= 60;
//         kq.m++;
//     }
//     if(kq.m >= 60){
//         kq.m -= 60;
//         kq.h++;
//     }
//     return kq;
// }
// CThoiGian CThoiGian::operator - (const CThoiGian &tg){
//     CThoiGian kq;
//     kq.h = this->h - tg.h;
//     kq.m = this->m - tg.m;
//     kq.s = this->s - tg.s;
//     if(kq.s < 0){
//         kq.s += 60;
//         kq.m--;
//     }
//     if(kq.m < 0){
//         kq.m += 60;
//         kq.h--;
//     }
//     return kq;
// }
// CThoiGian CThoiGian::operator++(){
//     this->s++;
//     if(this->s >= 60){
//         this->s -= 60;
//         this->m++;
//     }
//     if(this->m >= 60){
//         this->m -= 60;
//         this->h++;
//     }
// }
// CThoiGian CThoiGian::operator--(){
//     this->s--;
//     if(this->s < 0){
//         this->s += 60;
//         this->m--;
//     }
//     if(this->m < 0){
//         this->m += 60;
//         this->h--;
//     }
// }
// int main(){
//     CThoiGian tg1, tg2;
//     cout << "Nhap thoi gian 1: ";
//     cin >> tg1;
//     cout << "Nhap thoi gian 2: ";
//     cin >> tg2;

//     if(tg1 >= tg2) cout << "Thoi gian 1 lon hon hoac bang thoi gian 2" << endl;
//     else cout << "Thoi gian 1 nho hon thoi gian 2" << endl;

//     CThoiGian kq = tg1 + tg2;
//     cout << "Tong thoi gian 1 va thoi gian 2 la: ";
//     cout << kq;

//     CThoiGian kq2 = tg1 - tg2;
//     cout << "\nHieu thoi gian 1 va thoi gian 2 la: ";
//     cout << kq2;

//     cout << "\nThoi gian 1 sau khi tang 1 giay la: ";
//     ++tg1;
//     cout << tg1;

//     cout << "\nThoi gian 2 sau khi giam 1 giay la: ";
//     --tg2;
//     cout << tg2;
//     return 0;
// }



// //Bai 2
// #include <iostream>
// using namespace std;
// class CNgay{
//     private:
//         int d, m, y;
//     public:
//         CNgay(){
//             d = 1;
//             m = 1;
//             y = 1;
//         }
//         bool operator < (const CNgay &date);
//         bool operator == (const CNgay &date);
//         CNgay operator ++ ();
//         CNgay operator -- ();
//         friend istream &operator >> (istream &is, CNgay &date);
//         friend ostream &operator << (ostream &os, CNgay date);
// };
// bool CNgay::operator < (const CNgay &date){
//     if(this->y < date.y) return true;
//     if(this->y == date.y && this->m < date.m) return true;
//     if(this->y == date.y && this->m == date.m && this->d < date.d) return true;
//     return false;
// }
// bool CNgay::operator == (const CNgay &date){
//     if(this->y == date.y && this->m == date.m && this->d == date.d) return true;
//     return false;
// }
// CNgay CNgay::operator ++ (){
//     this->d++;
//     if(this->d > 31){
//         this->d = 1;
//         this->m++;
//     }
//     if(this->m > 12){
//         this->m = 1;
//         this->y++;
//     }
// }
// CNgay CNgay::operator -- (){
//     this->d--;
//     if(this->d < 1){
//         this->d = 31;
//         this->m--;
//     }
//     if(this->m < 1){
//         this->m = 12;
//         this->y--;
//     }
// }
// istream &operator >> (istream &is, CNgay &date){
//     cout << "Nhap ngay: ";
//     is >> date.d;
//     cout << "Nhap thang: ";
//     is >> date.m;
//     cout << "Nhap nam: ";
//     is >> date.y;
//     return is;
// }
// ostream &operator << (ostream &os, CNgay date){
//     os << date.d << "/" << date.m << "/" << date.y;
//     return os;
// }
// int main(){
//     CNgay date1, date2;
//     cin >> date1;
//     cin >> date2;
//     cout << "Ngay 1: " << date1 << endl;
//     cout << "Ngay 2: " << date2 << endl;
//     if(date1 < date2) cout << "Ngay 1 nho hon ngay 2" << endl;
//     else if(date1 == date2) cout << "Ngay 1 bang ngay 2" << endl;
//     else cout << "Ngay 1 lon hon ngay 2" << endl;
//     return 0;
// }



// // Bai 2, co long 2 class
// #include <iostream>
// #include <string>
// using namespace std;
// class Ngay{
//     private:
//         int d, m, y;
//     public:
//         Ngay(){
//             d = 1;
//             m = 1;
//             y = 1;
//         }
//         friend class Nguoi;
//         friend istream &operator >> (istream &is, Ngay &date);
//         friend ostream &operator << (ostream &os, Ngay date);
// };
// class Nguoi{
//     private:
//         string ten;
//         Ngay ns;
//     public:
//         friend istream &operator >> (istream &is, Nguoi &ng);
//         friend ostream &operator << (ostream &os, Nguoi ng);
//         bool operator < (const Nguoi &ng);
//         bool operator == (const Nguoi &ng);
// };
// istream &operator >> (istream &is, Ngay &date){
//     cout << "Nhap ngay: ";
//     is >> date.d;
//     cout << "Nhap thang: ";
//     is >> date.m;
//     cout << "Nhap nam: ";
//     is >> date.y;
//     return is;
// }
// ostream &operator << (ostream &os, Ngay date){
//     os << date.d << "/" << date.m << "/" << date.y;
//     return os;
// }
// istream &operator >> (istream &is, Nguoi &ng){
//     cout << "Nhap ten: ";
//     getline(is, ng.ten);
//     cout << "Nhap ngay sinh: ";
//     is >> ng.ns;
//     cin.ignore();
//     return is;
// }
// ostream &operator << (ostream &os, Nguoi ng){
//     os << "Ten: " << ng.ten << endl;
//     os << "Ngay sinh: " << ng.ns;
//     return os;
// }
// bool Nguoi::operator < (const Nguoi &ng){
//     if(this->ns.y < ng.ns.y) return true;
//     if(this->ns.y == ng.ns.y && this->ns.m > ng.ns.m) return true;
//     if(this->ns.y == ng.ns.y && this->ns.m == ng.ns.m && this->ns.d > ng.ns.d) return true;
//     return false;
// }
// bool Nguoi::operator == (const Nguoi &ng){
//     if(this->ns.y == ng.ns.y && this->ns.m == ng.ns.m && this->ns.d == ng.ns.d) return true;
//     return false;
// }
// int main(){
//     Nguoi ng1, ng2;
//     cout << "Nhap nguoi 1: " << endl;
//     cin >> ng1;
//     cout << "Nhap nguoi 2: " << endl;
//     cin >> ng2;
//     cout << "Nguoi 1: " << ng1 << endl;
//     cout << "Nguoi 2: " << ng2 << endl;
//     if(ng1 < ng2) cout << "Nguoi 1 nho tuoi hon nguoi 2" << endl;
//     else if(ng1 == ng2) cout << "Nguoi 1 bang tuoi nguoi 2" << endl;
//     else cout << "Nguoi 1 lon tuoihon nguoi 2" << endl;
//     return 0;
// }



// Bai 3
// #include <iostream>
// using namespace std;
// class CDonThuc{
//     private:
//         double heSo, soMu;
//     public:
//         CDonThuc(){
//             heSo = 0;
//             soMu = 0;
//         }

//         // Toan tu nhap xuat
//         friend istream &operator >> (istream &is, CDonThuc &dt);
//         friend ostream &operator << (ostream &os, CDonThuc dt);

//         //Toan tu so sanh
//         bool operator > (const CDonThuc &dt);
//         bool operator < (const CDonThuc &dt);
//         bool operator == (const CDonThuc &dt);
//         bool operator != (const CDonThuc &dt);

//         //Toan tu toan hoc
//         CDonThuc operator + (const CDonThuc &dt);
//         CDonThuc operator - (const CDonThuc &dt);
//         CDonThuc operator * (const CDonThuc &dt);
//         CDonThuc operator / (const CDonThuc &dt);

//         // Toan tu 1 ngoi
//         CDonThuc operator ! (); //Dao ham
//         CDonThuc operator ~ (); // Nguyen ham
// };
// istream &operator >> (istream &is, CDonThuc &dt){
//     cout << "Nhap he so: ";
//     is >> dt.heSo;
//     cout << "Nhap so mu: ";
//     is >> dt.soMu;
//     return is;
// }
// ostream &operator << (ostream &os, CDonThuc dt){
//     os << dt.heSo << "x^" << dt.soMu;
//     return os;
// }
// bool CDonThuc::operator > (const CDonThuc &dt){
//     if(this->soMu > dt.soMu) return true;
//     if(this->soMu == dt.soMu && this->heSo > dt.heSo) return true;
//     return false;
// }
// bool CDonThuc::operator < (const CDonThuc &dt){
//     if(this->soMu < dt.soMu) return true;
//     if(this->soMu == dt.soMu && this->heSo < dt.heSo) return true;
//     return false;
// }
// bool CDonThuc::operator == (const CDonThuc &dt){
//     if(this->soMu == dt.soMu && this->heSo == dt.heSo) return true;
//     return false;
// }
// bool CDonThuc::operator != (const CDonThuc &dt){
//     if(this->soMu != dt.soMu || this->heSo != dt.heSo) return true;
//     return false;
// }
// CDonThuc CDonThuc::operator + (const CDonThuc &dt){
//     CDonThuc kq;
//     kq.heSo = this->heSo + dt.heSo;
//     kq.soMu = this->soMu;
//     return kq;
// }
// CDonThuc CDonThuc::operator - (const CDonThuc &dt){
//     CDonThuc kq;
//     kq.heSo = this->heSo - dt.heSo;
//     kq.soMu = this->soMu;
//     return kq;
// }
// CDonThuc CDonThuc::operator * (const CDonThuc &dt){
//     CDonThuc kq;
//     kq.heSo = this->heSo * dt.heSo;
//     kq.soMu = this->soMu + dt.soMu;
//     return kq;
// }
// CDonThuc CDonThuc::operator / (const CDonThuc &dt){
//     CDonThuc kq;
//     kq.heSo = this->heSo / dt.heSo;
//     kq.soMu = this->soMu - dt.soMu;
//     return kq;
// }
// CDonThuc CDonThuc::operator ! (){
//     CDonThuc kq;
//     kq.heSo = this->heSo * this->soMu;
//     kq.soMu = this->soMu - 1;
//     return kq;
// }
// CDonThuc CDonThuc::operator ~ (){
//     CDonThuc kq;
//     kq.heSo = this->heSo / (this->soMu + 1);
//     kq.soMu = this->soMu + 1;
//     return kq;
// }
// int main(){
//     CDonThuc dt1, dt2;
//     cout << "Nhap don thuc 1: ";
//     cin >> dt1;
//     cout << "Nhap don thuc 2: ";
//     cin >> dt2;
//     cout << "Don thuc 1: " << dt1 << endl;
//     cout << "Don thuc 2: " << dt2 << endl;
//     if(dt1 > dt2) cout << "Don thuc 1 lon hon don thuc 2" << endl;
//     else if(dt1 < dt2) cout << "Don thuc 1 nho hon don thuc 2" << endl;
//     else if(dt1 == dt2) cout << "Don thuc 1 bang don thuc 2" << endl;
//     else cout << "Don thuc 1 khac don thuc 2" << endl;
//     CDonThuc kq = dt1 + dt2;
//     cout << "Tong 2 don thuc la: " << kq << endl;
//     CDonThuc kq2 = dt1 - dt2;
//     cout << "Hieu 2 don thuc la: " << kq2 << endl;
//     CDonThuc kq3 = dt1 * dt2;
//     cout << "Tich 2 don thuc la: " << kq3 << endl;
//     CDonThuc kq4 = dt1 / dt2;
//     cout << "Thuong 2 don thuc la: " << kq4 << endl;
//     CDonThuc kq5 = !dt1;
//     cout << "Dao ham cua don thuc 1 la: " << kq5 << endl;
//     CDonThuc kq6 = ~dt1;
//     cout << "Nguyen ham cua don thuc 1 la: " << kq6 << endl;
//     return 0;
// }


// QLy sinh vien dung 2 class, k dung istream, ostream
// #include <iostream>
// #include <string>
// #include <istream>
// using namespace std;
// class SinhVien{
//     private:
//         string hoTen, maSV;
//         float gpa;
//     public:
//         SinhVien(){
//             hoTen = "";
//             maSV = "";
//             gpa = 0;
//         }
//         friend istream &operator >> (istream &is, SinhVien &sv);
//         friend ostream &operator << (ostream &os, SinhVien sv);
//         bool operator > (const SinhVien &sv);
//         bool operator < (const SinhVien &sv);
//         bool operator == (const SinhVien &sv);
//         friend class LopHoc;
// };
// istream &operator >> (istream &is, SinhVien &sv){
//     cout << "Nhap ho ten: ";
//     getline(is, sv.hoTen);
//     cout << "Nhap ma sinh vien: ";
//     is >> sv.maSV;
//     cout << "Nhap diem trung binh: ";
//     is >> sv.gpa;
//     cin.ignore();
//     return is;
// }
// ostream &operator << (ostream &os, SinhVien sv){
//     os << "Ho ten: " << sv.hoTen << endl;
//     os << "Ma sinh vien: " << sv.maSV << endl;
//     os << "Diem trung binh: " << sv.gpa << endl;
//     return os;
// }
// bool SinhVien::operator > (const SinhVien &sv){
//     if(this->gpa > sv.gpa) return true;
//     return false;
// }
// bool SinhVien::operator < (const SinhVien &sv){
//     if(this->gpa < sv.gpa) return true;
//     return false;
// }
// bool SinhVien::operator == (const SinhVien &sv){
//     if(this->gpa == sv.gpa) return true;
//     return false;
// }
// class LopHoc{
//     private:
//         string tenLop;
//         SinhVien *sv;
//         int n;
//     public:
//         LopHoc(){
//             tenLop = "";
//             sv = NULL;
//             n = 0;
//         }
//         void nhap();
//         void xuat();
//         void sapXepTheoGPA();
// };
// void LopHoc::nhap(){
//     cout << "Nhap ten lop: ";
//     getline(cin, this->tenLop);
//     cout << "Nhap so sinh vien: ";
//     cin >> this->n;
//     cin.ignore();
//     this->sv = new SinhVien[this->n];
//     for(int i = 0; i < this->n; i++){
//         cout << "Nhap sinh vien thu " << i + 1 << ": " << endl;
//         cin >> this->sv[i];
//     }
// }
// void LopHoc::xuat(){
//     cout << "Ten lop: " << this->tenLop << endl;
//     for(int i = 0; i < this->n; i++){
//         cout << "Sinh vien thu " << i + 1 << ": " << endl;
//         cout << this->sv[i];
//     }
// }
// void LopHoc::sapXepTheoGPA(){
//     for(int i = 0; i < this->n - 1; i++){
//         for(int j = i + 1; j < this->n; j++){
//             if(this->sv[i] > this->sv[j]){
//                 SinhVien temp = this->sv[i];
//                 this->sv[i] = this->sv[j];
//                 this->sv[j] = temp;
//             }
//         }
//     }
// }

// int main(){
//     LopHoc lh;
//     lh.nhap();
//     lh.xuat();
//     lh.sapXepTheoGPA();
//     cout << "Danh sach sinh vien sau khi sap xep theo GPA: " << endl;
//     lh.xuat();
//     return 0;
// }


// Co dung istream, ostream
// #include <iostream>
// #include <string>
// #include <istream>
// using namespace std;
// class SinhVien{
//     private:
//         string hoTen, maSV;
//         float gpa;
//     public:
//         SinhVien(){
//             hoTen = "";
//             maSV = "";
//             gpa = 0;
//         }
//         friend istream &operator >> (istream &is, SinhVien &sv);
//         friend ostream &operator << (ostream &os, SinhVien sv);
//         bool operator > (const SinhVien &sv);
//         bool operator < (const SinhVien &sv);
//         bool operator == (const SinhVien &sv);
//         friend class LopHoc;
// };
// istream &operator >> (istream &is, SinhVien &sv){
//     cout << "Nhap ho ten: ";
//     getline(is, sv.hoTen);
//     cout << "Nhap ma sinh vien: ";
//     is >> sv.maSV;
//     cout << "Nhap diem trung binh: ";
//     is >> sv.gpa;
//     cin.ignore();
//     return is;
// }
// ostream &operator << (ostream &os, SinhVien sv){
//     os << "Ho ten: " << sv.hoTen << endl;
//     os << "Ma sinh vien: " << sv.maSV << endl;
//     os << "Diem trung binh: " << sv.gpa << endl;
//     return os;
// }
// bool SinhVien::operator > (const SinhVien &sv){
//     if(this->gpa > sv.gpa) return true;
//     return false;
// }
// bool SinhVien::operator < (const SinhVien &sv){
//     if(this->gpa < sv.gpa) return true;
//     return false;
// }
// bool SinhVien::operator == (const SinhVien &sv){
//     if(this->gpa == sv.gpa) return true;
//     return false;
// }
// class LopHoc{
//     private:
//         string tenLop;
//         SinhVien *sv;
//         int n;
//     public:
//         LopHoc(){
//             tenLop = "";
//             sv = NULL;
//             n = 0;
//         }
//         friend istream &operator >> (istream &is, LopHoc &lh);
//         friend ostream &operator << (ostream &os, LopHoc lh);
//         void sapXepTheoGPA();
// };
// istream &operator >> (istream &is, LopHoc &lh){
//     cout << "Nhap ten lop: ";
//     getline(is, lh.tenLop);
//     cout << "Nhap so sinh vien: ";
//     is >> lh.n;
//     is.ignore();
//     lh.sv = new SinhVien[lh.n];
//     for(int i = 0; i < lh.n; i++){
//         cout << "Nhap sinh vien thu " << i + 1 << ": " << endl;
//         is >> lh.sv[i];
//     }
//     return is;
// }
// ostream &operator << (ostream &os, LopHoc lh){
//     os << "Ten lop: " << lh.tenLop << endl;
//     for(int i = 0; i < lh.n; i++){
//         os << "Sinh vien thu " << i + 1 << ": " << endl;
//         os << lh.sv[i];
//     }
//     return os;
// }
// void LopHoc::sapXepTheoGPA(){
//     for(int i = 0; i < this->n - 1; i++){
//         for(int j = i + 1; j < this->n; j++){
//             if(this->sv[i] > this->sv[j]){
//                 SinhVien temp = this->sv[i];
//                 this->sv[i] = this->sv[j];
//                 this->sv[j] = temp;
//             }
//         }
//     }
// }
// int main(){
//     LopHoc lh;
//     cin >> lh;
//     cout << lh;
//     lh.sapXepTheoGPA();
//     cout << "Danh sach sinh vien sau khi sap xep theo GPA: " << endl;
//     cout << lh;
//     return 0;
// }


// Phan so
// #include <iostream>
// using namespace std;
// class PhanSo{
//     private:
//         int tu, mau;
//     public:
//         PhanSo(){
//             tu = 0;
//             mau = 1;
//         }
//         friend istream &operator >> (istream &is, PhanSo &ps);
//         friend ostream &operator << (ostream &os, PhanSo ps);
//         PhanSo operator + (const PhanSo &ps); // hoac friend PhanSo operator + (const PhanSo &ps1, const PhanSo &ps2);
//         PhanSo operator - (const PhanSo &ps); // hoac friend PhanSo operator - (const PhanSo &ps1, const PhanSo &ps2);
//         PhanSo operator * (const PhanSo &ps);
//         PhanSo operator / (const PhanSo &ps);
//         PhanSo rutGon();
// };
// istream &operator >> (istream &is, PhanSo &ps){
//     cout << "Nhap tu so: ";
//     is >> ps.tu;
//     cout << "Nhap mau so: ";
//     is >> ps.mau;
//     return is;
// }
// ostream &operator << (ostream &os, PhanSo ps){
//     os << ps.tu << "/" << ps.mau;
//     return os;
// }
// PhanSo PhanSo::operator + (const PhanSo &ps){
//     PhanSo kq;
//     kq.tu = this->tu * ps.mau + this->mau * ps.tu;
//     kq.mau = this->mau * ps.mau;
//     return kq;
// }
// PhanSo PhanSo::operator - (const PhanSo &ps){
//     PhanSo kq;
//     kq.tu = this->tu * ps.mau - this->mau * ps.tu;
//     kq.mau = this->mau * ps.mau;
//     return kq;
// }
// PhanSo PhanSo::operator * (const PhanSo &ps){
//     PhanSo kq;
//     kq.tu = this->tu * ps.tu;
//     kq.mau = this->mau * ps.mau;
//     return kq;
// }
// PhanSo PhanSo::operator / (const PhanSo &ps){
//     PhanSo kq;
//     kq.tu = this->tu * ps.mau;
//     kq.mau = this->mau * ps.tu;
//     return kq;
// }
// PhanSo PhanSo::rutGon(){
//     int a = this->tu, b = this->mau;
//     while(a * b != 0){
//         if(a > b) a = a % b;
//         else b = b % a;
//     }
//     int ucln = a + b;
//     this->tu /= ucln;
//     this->mau /= ucln;
//     return *this;
// }
// int main(){
//     PhanSo ps1, ps2;
//     cout << "Nhap phan so 1: ";
//     cin >> ps1;
//     cout << "Nhap phan so 2: ";
//     cin >> ps2;
//     cout << "Phan so 1: " << ps1 << endl;
//     cout << "Phan so 2: " << ps2 << endl;
//     PhanSo kq = ps1 + ps2;
//     cout << "Tong 2 phan so la: " << kq.rutGon() << endl;
//     PhanSo kq2 = ps1 - ps2;
//     cout << "Hieu 2 phan so la: " << kq2.rutGon() << endl;
//     PhanSo kq3 = ps1 * ps2;
//     cout << "Tich 2 phan so la: " << kq3.rutGon() << endl;
//     PhanSo kq4 = ps1 / ps2;
//     return 0;
// }

// // So Phuc 
// #include <iostream>
// using namespace std;
// class SoPhuc{
//     private:
//         float phanThuc, phanAo;
//     public:
//         SoPhuc(){
//             phanThuc = 0;
//             phanAo = 0;
//         }
//         friend istream &operator >> (istream &is, SoPhuc &sp);
//         friend ostream &operator << (ostream &os, SoPhuc sp);
//         SoPhuc operator + (const SoPhuc &sp);
//         SoPhuc operator - (const SoPhuc &sp);
//         SoPhuc operator * (const SoPhuc &sp);
//         SoPhuc operator / (const SoPhuc &sp);
// };
// istream &operator >> (istream &is, SoPhuc &sp){
//     cout << "Nhap phan thuc: ";
//     is >> sp.phanThuc;
//     cout << "Nhap phan ao: ";
//     is >> sp.phanAo;
//     return is;
// }
// ostream &operator << (ostream &os, SoPhuc sp){
//     os << sp.phanThuc << " + " << sp.phanAo << "i";
//     return os;
// }
// SoPhuc SoPhuc::operator + (const SoPhuc &sp){
//     SoPhuc kq;
//     kq.phanThuc = this->phanThuc + sp.phanThuc;
//     kq.phanAo = this->phanAo + sp.phanAo;
//     return kq;
// }
// SoPhuc SoPhuc::operator - (const SoPhuc &sp){
//     SoPhuc kq;
//     kq.phanThuc = this->phanThuc - sp.phanThuc;
//     kq.phanAo = this->phanAo - sp.phanAo;
//     return kq;
// }
// SoPhuc SoPhuc::operator * (const SoPhuc &sp){
//     SoPhuc kq;
//     kq.phanThuc = this->phanThuc * sp.phanThuc - this->phanAo * sp.phanAo;
//     kq.phanAo = this->phanThuc * sp.phanAo + this->phanAo * sp.phanThuc;
//     return kq;
// }
// SoPhuc SoPhuc::operator / (const SoPhuc &sp){
//     SoPhuc kq;
//     kq.phanThuc = (this->phanThuc * sp.phanThuc + this->phanAo * sp.phanAo) / (sp.phanThuc * sp.phanThuc + sp.phanAo * sp.phanAo);
//     kq.phanAo = (this->phanAo * sp.phanThuc - this->phanThuc * sp.phanAo) / (sp.phanThuc * sp.phanThuc + sp.phanAo * sp.phanAo);
//     return kq;
// }
// int main(){
//     SoPhuc sp1, sp2;
//     cout << "Nhap so phuc 1: ";
//     cin >> sp1;
//     cout << "Nhap so phuc 2: ";
//     cin >> sp2;
//     cout << "So phuc 1: " << sp1 << endl;
//     cout << "So phuc 2: " << sp2 << endl;
//     SoPhuc kq = sp1 + sp2;
//     cout << "Tong 2 so phuc la: " << kq << endl;
//     SoPhuc kq2 = sp1 - sp2;
//     cout << "Hieu 2 so phuc la: " << kq2 << endl;
//     SoPhuc kq3 = sp1 * sp2;
//     cout << "Tich 2 so phuc la: " << kq3 << endl;
//     SoPhuc kq4 = sp1 / sp2;
//     cout << "Thuong 2 so phuc la: " << kq4 << endl;
//     return 0;
// }



// // Bai 1 tap tin
// #include <fstream>
// using namespace std;

// class Fraction {
// public:
//     int numerator;
//     int denominator;

//     Fraction(int num, int denom) : numerator(num), denominator(denom) {}

//     Fraction operator+(const Fraction& other) {
//         int num = this->numerator * other.denominator + this->denominator * other.numerator;
//         int denom = this->denominator * other.denominator;
//         return Fraction(num, denom);
//     }
// };

// int main() {
//     ifstream input("INPUT.TXT");
//     ofstream output("OUTPUT.TXT");

//     int num1, denom1, num2, denom2;
//     input >> num1 >> denom1 >> num2 >> denom2;

//     Fraction frac1(num1, denom1);
//     Fraction frac2(num2, denom2);

//     Fraction result = frac1 + frac2;

//     output << result.numerator << " " << result.denominator << endl;

//     input.close();
//     output.close();

//     return 0;
// }


// // Bai 2 tap tin
// #include <fstream>
// using namespace std;

// class Fraction {
// public:
//     int numerator;
//     int denominator;

//     Fraction(int num, int denom) : numerator(num), denominator(denom) {}

//     Fraction operator+(const Fraction& other) {
//         int num = this->numerator * other.denominator + this->denominator * other.numerator;
//         int denom = this->denominator * other.denominator;
//         return Fraction(num, denom);
//     }
// };

// int main() {
//     ifstream input("INPUT.TXT");
//     ofstream output("OUTPUT.TXT");

//     int n;
//     input >> n;

//     int num, denom;
//     input >> num >> denom;
//     Fraction result(num, denom);

//     for (int i = 1; i < n; i++) {
//         input >> num >> denom;
//         Fraction frac(num, denom);
//         result = result + frac;
//     }

//     output << result.numerator << " " << result.denominator << endl;

//     input.close();
//     output.close();

//     return 0;
// }



