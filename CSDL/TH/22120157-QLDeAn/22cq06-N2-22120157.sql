--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2

use master

--Tạo database
create database DB_QLDeAn_22120157 on
(
	Name = DB_QLDeAn_22120157_data,
	FileName = 'D:\22120157-QLDeAn\DB_QLDeAn_22120157_data.mdf'
)
log on
(
	Name = DB_QLDeAn_22120157_log,
	FileName = 'D:\22120157-QLDeAn\DB_QLDeAn_22120157_log.ldf'	
)
go

--Kích hoạt database
use DB_QLDeAn_22120157

--Tạo table và PK
create table NhanVien
(
	HoNV nvarchar(15),
	TenLot nvarchar(15),
	TenNV nvarchar(15),
	MaNV varchar(9),
	NgSinh date,
	DChi nvarchar(30),
	Phai nvarchar(3),
	Luong float,
	Ma_NQL varchar(9),
	Phg int,
	constraint PK_NhanVien primary key (MaNV)
);

create table PhongBan
(
	TenPhg nvarchar(15),
	MaPhg int,
	TrPhg varchar(9),
	NgNhanChuc date,
	constraint PK_PhongBan primary key (MaPhg)
);

create table DiaDiem_Phg
(
	MaPhg int,
	DiaDiem nvarchar(15),
	constraint PK_DiaDiem_Phg primary key(MaPhg, DiaDiem)
);

create table DeAn
(
	TenDA nvarchar(15),
	MaDA int,
	DDiem_DA nvarchar(15),
	Phong int,
	constraint PK_DeAn primary key(MaDA)
);

create table CongViec
(
	MaDA int,
	STT int,
	TenCongViec nvarchar(50),
	constraint PK_CongViec primary key (MaDA, STT)
);

create table PhanCong
(
	MaNVien varchar(9),
	MaDA int,
	STT int,
	ThoiGian decimal(5,1),
	constraint PK_PhanCong primary key (MaNVien, MaDA, STT)
);

create table ThanNhan
(
	MaNVien varchar(9),
	TenTN nvarchar(15),
	Phai nvarchar(3),
	NgSinh date,
	QuanHe nvarchar(15),
	constraint PK_ThanNhan primary key (MaNVien, TenTN)
);

--Tạo FK
alter table NhanVien
	add constraint FK_NhanVien_Ma_NQL
	foreign key (Ma_NQL)
	references NhanVien(MaNV);

alter table NhanVien
	add constraint FK_NhanVien_Phg
	foreign key (Phg)
	references PhongBan(MaPhg);

alter table PhongBan
	add constraint FK_PhongBan_TrPhg
	foreign key (TrPhg)
	references NhanVien(MaNV);

alter table DiaDiem_Phg
	add constraint FK_DiaDiem_Phg_MaPhg
	foreign key (MaPhg)
	references PhongBan(MaPhg);

alter table DeAn
	add constraint FK_DeAn_Phong
	foreign key (Phong)
	references PhongBan(MaPhg);

alter table CongViec
	add constraint FK_CongViec_MaDA
	foreign key (MaDA)
	references DeAn(MaDA);

alter table PhanCong
	add constraint FK_PhanCong_MaNVien
	foreign key (MaNVien)
	references NhanVien(MaNV);

alter table PhanCong
	add constraint FK_PhanCong_MaDA_STT
	foreign key (MaDA, STT)
	references CongViec(MaDA, STT);

alter table ThanNhan
	add constraint FK_ThanNhan_MaNVien
	foreign key (MaNVien)
	references NhanVien(MaNV);

go

--Thêm dữ liệu
--Thêm dữ liệu cho bảng NhanVien
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Đinh', N'Bá', N'Tiên', '009', '02/11/1960', N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Nguyễn', N'Thanh', N'Tùng', '005', '08/20/1962', N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Bùi', N'Ngọc', N'Hằng', '007', '03/11/1954', N'332 Nguyễn Thái Học, Tp HCM', N'Nam', 25000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Lê', N'Quỳnh', N'Như', '001', '02/01/1967', N'291 Hồ Văn Huê, Tp HCM', N'Nữ', 43000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Nguyễn', N'Mạnh', N'Hùng', '004', '03/04/1967', N'93 Bà Rịa, Vũng Tàu', N'Nam', 38000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Trần', N'Thanh', N'Tâm', '003', '05/04/1957', N'34 Mai Thị Lự, Tp HCM', N'Nam', 25000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Trần', N'Hồng', N'Quang', '008', '09/01/1967', N'80 Lê Hồng Phong, Tp HCM', N'Nam', 25000, null, null);
insert into NhanVien(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, Phg)
	values(N'Phạm', N'Vân', N'Vinh', '006', '01/01/1965', N'45 Trưng Vương, Hà Nội', N'Nữ', 55000, null, null);

--Thêm dữ liệu cho bảng PhongBan
insert into PhongBan(TenPhg, MaPhg, TrPhg, NgNhanChuc)
	values(N'Nghiên cứu', 5, '005', '05/22/1978');
insert into PhongBan(TenPhg, MaPhg, TrPhg, NgNhanChuc)
	values(N'Điều hành', 4, '008', '01/01/1985');
insert into PhongBan(TenPhg, MaPhg, TrPhg, NgNhanChuc)
	values(N'Quản lý', 1, '006', '06/19/1971');


--Thêm dữ liệu cho bảng DiaDiem_Phg
insert into DiaDiem_Phg(MaPhg, DiaDiem)
	values(1, N'TP HCM');
insert into DiaDiem_Phg(MaPhg, DiaDiem)
	values(4, N'Hà Nội');
insert into DiaDiem_Phg(MaPhg, DiaDiem)
	values(5, N'Vũng Tàu');
insert into DiaDiem_Phg(MaPhg, DiaDiem)
	values(5, N'Nha Trang');
insert into DiaDiem_Phg(MaPhg, DiaDiem)
	values(5, N'TP HCM');

--Thêm dữ liệu cho bảng DeAn
insert into DeAn(TenDA, MaDA, DDiem_DA, Phong)
	values(N'Sản phẩm X', 1, N'Vũng Tàu', 5)
insert into DeAn(TenDA, MaDA, DDiem_DA, Phong)
	values(N'Sản phẩm Y', 2, N'Nha Trang', 5);
insert into DeAn(TenDA, MaDA, DDiem_DA, Phong)
	values(N'Sản phẩm Z', 3, N'TP HCM', 5);
insert into DeAn(TenDA, MaDA, DDiem_DA, Phong)
	values(N'Tin học hóa', 10, N'Hà Nội', 4);
insert into DeAn(TenDA, MaDA, DDiem_DA, Phong)
	values(N'Cáp quang', 20, N'TP HCM', 1);
insert into DeAn(TenDA, MaDA, DDiem_DA, Phong)
	values(N'Đào tạo', 30, N'Hà Nội', 4);

--Thêm dữ liệu cho bảng CongViec
insert into CongViec(MaDA, STT, TenCongViec)
	values(1, 1, N'Thiết kế sản phẩm X');
insert into CongViec(MaDA, STT, TenCongViec)
	values(1, 2, N'Thử nghiệm sản phẩm X');
insert into CongViec(MaDA, STT, TenCongViec)
	values(2, 1, N'Sản xuất sản phẩm Y');
insert into CongViec(MaDA, STT, TenCongViec)
	values(2, 2, N'Quảng cáo sản phẩm Y');
insert into CongViec(MaDA, STT, TenCongViec)
	values(3, 1, N'Khuyến mãi sản phẩm Z ');
insert into CongViec(MaDA, STT, TenCongViec)
	values(10, 1, N'Tin học hóa nhân sự tiền lương');
insert into CongViec(MaDA, STT, TenCongViec)
	values(10, 2, N'Tin học hóa phòng kinh doanh');
insert into CongViec(MaDA, STT, TenCongViec)
	values(20, 1, N'Lắp đặt cáp quang cho khu B');
insert into CongViec(MaDA, STT, TenCongViec)
	values(30, 1, N'Đào tạo nhân viên Marketing');
insert into CongViec(MaDA, STT, TenCongViec)
	values(30, 2, N'Đào tạo chuyên viên thiết kế');

--Thêm dữ liệu cho bảng PhanCong
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('009', 1, 1, 32);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('009', 2, 2, 8);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('004', 3, 1, 40);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('003', 1, 2, 20.0);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('003', 2, 1, 20.0);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('008', 10, 1, 35);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('008', 30, 2, 5);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('001', 30, 1, 20);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('001', 20, 1, 15);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('006', 20, 1, 30);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('005', 3, 1, 10);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('005', 10, 2, 10);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('005', 20, 1, 10);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('007', 30, 2, 30);
insert into PhanCong(MaNVien, MaDA, STT, ThoiGian)
	values('007', 10, 2, 10);

--Thêm dữ liệu cho bảng ThanNhan
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái');
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('005', N'Khang', N'Nam', '10/25/1973', N'Con trai');
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng');
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng');
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai');
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái');
insert into ThanNhan(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng');


go 

--Update dữ liệu
--Update dữ liệu cho bảng NhanVien
update NhanVien 
set Ma_NQL = '005', Phg = 5
where MaNV = '009';

update NhanVien 
set Ma_NQL = '006', Phg = 5
where MaNV = '005';

update NhanVien 
set Ma_NQL = '001', Phg = 4
where MaNV = '007';

update NhanVien 
set Ma_NQL = '006', Phg = 4
where MaNV = '001';

update NhanVien 
set Ma_NQL = '005', Phg = 5
where MaNV = '004';

update NhanVien 
set Ma_NQL = '005', Phg = 5
where MaNV = '003';

update NhanVien 
set Ma_NQL = '001', Phg = 4
where MaNV = '008';

update NhanVien 
set Phg = 1
where MaNV = '006';



/* Xem dữ liệu các bảng
	select * from NhanVien
	select * from PhongBan
	select * from DiaDiem_Phg
	select * from DeAn
	select * from CongViec
	select * from PhanCong
	select * from ThanNhan
*/
/*Xóa database
	use master
	drop database DB_QLDeAn_22120157 
*/