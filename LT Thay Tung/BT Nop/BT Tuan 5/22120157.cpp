#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <iomanip>
using namespace std;
// Khởi tạo lớp Date
class Date{
    public:
        int d, m, y;
        Date();
        Date(int d, int m, int y);
};
Date::Date(){
    d = 1;
    m = 1;
    y = 2000;
}
Date::Date(int d, int m, int y){
    this->d = d;
    this->m = m;
    this->y = y;
}

//Khởi tạo lớp KhachHang
class KhachHang{
    protected:
        string maKH, cmnd, hoTen;
        Date ngayDangKy;
        float diemTichLuy;
    public:
        KhachHang(string maKH, string cmnd, string hoTen, Date ngayDangKy, float diemTichLuy);
        string getMaKH();
        void inThongTin();
        float tongTien(string maKH, int soTien);
};

//Cài đặt các phương thức của lớp KhachHang
KhachHang::KhachHang(string maKH, string cmnd, string hoTen, Date ngayDangKy, float diemTichLuy){
    this->maKH = maKH;
    this->cmnd = cmnd;
    this->hoTen = hoTen;
    this->ngayDangKy = ngayDangKy;
    this->diemTichLuy = diemTichLuy;
}
string KhachHang::getMaKH(){
    return maKH;
}
void KhachHang::inThongTin(){
    cout << maKH << " " << cmnd << " " << hoTen << ngayDangKy.d << "/" << ngayDangKy.m << "/" << ngayDangKy.y << " " << diemTichLuy << endl;
}
float KhachHang::tongTien(string maKH, int soTien){
    float tienThucTra = 0;
    float discount = 0;
    if(diemTichLuy > 1000 && soTien > 5000000){
        discount = 0.02;
    }
    tienThucTra = soTien - soTien * discount;
    return tienThucTra;
}

//Khởi tạo lớp KhacHangThanThiet là lớp con của lớp KhachHang
class KhachHangThanThiet: public KhachHang{
    private:
        int capDoThanThiet;
    public:
        KhachHangThanThiet(string maKH, string cmnd, string hoTen, Date ngayDangKy, float diemTichLuy, int capDoThanThiet);
        void inThongTin();
        float tongTien(string maKH, int soTien);
};

//Cài đặt các phương thức của lớp KhachHangThanThiet
KhachHangThanThiet::KhachHangThanThiet(string maKH, string cmnd, string hoTen, Date ngayDangKy, float diemTichLuy, int capDoThanThiet):
KhachHang(maKH, cmnd, hoTen, ngayDangKy, diemTichLuy){
    this->capDoThanThiet = capDoThanThiet;
}
void KhachHangThanThiet::inThongTin(){
    cout << maKH << " " << cmnd << " " << hoTen << ngayDangKy.d << "/" << ngayDangKy.m << "/" << ngayDangKy.y << " " << diemTichLuy << " " << capDoThanThiet << endl;
}
float KhachHangThanThiet::tongTien(string maKH, int soTien){
    float tienThucTra = 0;
    float tongTien = KhachHang::tongTien(maKH, soTien);
    float discount = 0;
    if(this->capDoThanThiet == 1){
        discount = 0.05;
    }
    else if(this->capDoThanThiet == 2){
        discount = 0.07;
    }
    else if(this->capDoThanThiet == 3){
        discount = 0.1;
    }
    tienThucTra = tongTien - soTien * discount;
    return tienThucTra;
}

//Hàm main
int main(){
    // Đọc file và xuất ra file output
    freopen("input.txt", "rt", stdin);
    freopen("output.txt", "wt", stdout);
    vector<KhachHang> kh;
    vector<KhachHangThanThiet> khtt;
    string line;
    while(getline(cin, line)){
        stringstream ss(line);
        string tmp;
        vector<string> data;
        while(ss >> tmp){
            data.push_back(tmp);
        }

        string maKH = data[0];
        string cmnd = data[1];
        string hoTen = "";
        Date ngayDangKy;
        float diemTichLuy = stof(data[3]);

        string ngay = data[2];
        for(int i = 0; i < ngay.size(); i++){
            if(ngay[i] == '/'){
                ngay[i] = ' ';
            }
        }
        stringstream ss2(ngay);
        string tmp2;
        ss2 >> tmp2;
        ngayDangKy.d = stoi(tmp2);
        ss2 >> tmp2;
        ngayDangKy.m = stoi(tmp2);
        ss2 >> tmp2;
        ngayDangKy.y = stoi(tmp2);


        if(maKH[0] == 'N'){
            kh.push_back(KhachHang(maKH, cmnd, hoTen, ngayDangKy, diemTichLuy));
        }
        else if(maKH[0] == 'V'){
            int capDoThanThiet = stoi(data[4]);
            khtt.push_back(KhachHangThanThiet(maKH, cmnd, hoTen, ngayDangKy, diemTichLuy, capDoThanThiet));
        }
    }

    // In ra file output
    cout << "Danh sach khach hang thuong: \n";
    for(int i = 0; i < kh.size(); i++){
        kh[i].inThongTin();
    }
    cout << "\nDanh sach khach hang than thiet: \n";
    for(int i = 0; i < khtt.size(); i++){
        khtt[i].inThongTin();
    }

    // Đọc từ bàn phím và xuất ra màn hình
    freopen("CON", "r", stdin);
    freopen("CON", "w", stdout);
    cin.clear();
    string maKH;
    float tienMua;
    cout << "Nhap ma khach hang: ";
    cin >> maKH;
    cout << "Nhap so tien mua hang: ";
    cin >> tienMua;
    bool found = false;
    if(maKH[0] == 'N'){
        for(int i = 0; i < kh.size(); i++){
            string ma = kh[i].getMaKH();
            if(ma == maKH){
                found = true;
                cout << "Tong tien khach co ma " << ma << " phai tra la: " << fixed << setprecision(0) << kh[i].tongTien(maKH, tienMua) << endl;
            }
        }
    }
    else if(maKH[0] == 'V'){
        for(int i = 0; i < khtt.size(); i++){
            string ma = khtt[i].getMaKH();
            if(ma == maKH){
                found = true;
                cout << "Tong tien khach co ma " << ma << " phai tra la: " << fixed << setprecision(0) << khtt[i].tongTien(maKH, tienMua) << endl;
            }
        }
    }
    if(!found){
        cout << "Khong tim thay khach hang co ma " << maKH << endl;
    }
    return 0;
}