--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2

use master

--Tạo database
create database DB_QLChuyenBay_22120157 on
(
	Name = DB_QLChuyenBay_22120157_data,
	FileName = 'D:\2024-22120157-QLChuyenBay\DB_QLChuyenBay_22120157_data.mdf'
)
log on
(
	Name = DB_QLChuyenBay_22120157_log,
	FileName = 'D:\2024-22120157-QLChuyenBay\DB_QLChuyenBay_22120157_log.ldf'
)
go

--Kích hoạt database
use DB_QLChuyenBay_22120157

--Tạo table và PK
create table KhachHang
(
	MaKH varchar(15),
	Ten nvarchar(15),
	DChi nvarchar(50),
	DThoai char(12),
	constraint PK_KhachHang primary key (MaKH)
);

create table NhanVien
(
	MaNV varchar(15),
	Ten nvarchar(15),
	DChi nvarchar(50),
	DThoai char(10),
	Luong decimal(10, 2),
	LoaiNV bit,
	constraint PK_NhanVien primary key (MaNV)
);

create table LoaiMB
(
	MaLoai varchar(15),
	HangSX nvarchar(15),
	constraint PK_LoaiMB primary key (MaLoai)
);

create table MayBay
(
	SoHieu int,
	MaLoai varchar(15),
	constraint PK_MayBay primary key (SoHieu, MaLoai)
);

create table ChuyenBay
(
	MaCB varchar(4),
	SBDi varchar(3),	
	SBDen varchar(3),
	GioDi time,
	GioDen time,
	constraint PK_ChuyenBay primary key (MaCB)
);

create table LichBay
(
	NgayDi date,
	MaCB varchar(4),
	SoHieu int,
	MaLoai varchar(15),
	constraint PK_LichBay primary key (NgayDi, MaCB)
);

create table DatCho
(
	MaKH varchar(15),
	NgayDi date,
	MaCB varchar(4),
	constraint PK_DatCho primary key (MaKH, NgayDi, MaCB)
);

create table KhaNang
(
	MaNV varchar(15),
	MaLoai varchar(15),
	constraint PK_KhaNang primary key (MaNV, MaLoai)
);

create table PhanCong 
(
	MaNV varchar(15),
	NgayDi date,
	MaCB varchar(4),
	constraint PK_PhanCong primary key (MaNV, NgayDi, MaCB)
);

--Tạo FK
alter table DatCho
	add constraint FK_DatCho_MaKH
	foreign key (MaKH)
	references KhachHang(MaKH);

alter table DatCho
	add constraint FK_DatCho_NgayDi_MaCB
	foreign key (NgayDi, MaCB)
	references LichBay(NgayDi, MaCB);

alter table LichBay
	add constraint FK_LichBay_SoHieu_MaLoai
	foreign key (SoHieu, MaLoai)
	references MayBay(SoHieu, MaLoai);

alter table LichBay
	add constraint FK_LichBay_MaCB
	foreign key (MaCB)
	references ChuyenBay(MaCB);

alter table MayBay
	add constraint FK_MayBay_MaLoai
	foreign key (MaLoai)
	references LoaiMB(MaLoai);

alter table KhaNang
	add constraint FK_KhaNang_MaLoai
	foreign key (MaLoai)
	references LoaiMB(MaLoai);

alter table KhaNang
	add constraint FK_KhaNang_MaNV
	foreign key (MaNV)
	references NhanVien(MaNV);

alter table PhanCong
	add constraint FK_PhanCong_MaNV
	foreign key (MaNV)
	references NhanVien(MaNV);

alter table PhanCong
	add constraint FK_PhanCong_MgayDi_MaCB
	foreign key (NgayDi, MaCB)
	references LichBay(NgayDi, MaCB);

--Thêm dữ liệu cho các bảng
--Thêm dữ liệu cho bảng KhachHang
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0009', N'Nga', '223 Nguyen Trai', '8932320');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0101', N'Anh', '567 Tran Phu', '8826729');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0045', N'Thu', ' 285 Le Loi ', '8932203');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0012', N'Ha', '435 Quang Trung ', '8933232');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0238', N'Hung ', '456 Pasteur', '9812101');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0397', N'Thanh', '234 Le Van Si ', '8952943');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0582', N'Mai', '789 Nguyen Du', '');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0934', N'Minh', '678 Le Lai', '');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0091', N'Hai', '345 Hung Vuong', '8893223');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0314', N'Phuong', '395 Vo Van Tan  ', '8232320');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0613', N'Vu', '348 CMT8', '8343232');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0586', N'Son', '123 Bach Dang', '8556223');
insert into KhachHang(MaKH, Ten, DChi, DThoai)
	values('0422', N'Tien', '75 Nguyen Thong', '8332222');

--Thêm dữ liệu cho bảng NhanVien
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1006', N'Chi', N'12/6 Nguyen Kiem', '8120012', 150000, 0);
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1005', N'Giao', N'65 Nguyen Thai Son', '8324467', 500000, 0);
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1001', N'Huong', N'18 Dien Bien Phu', '8330733', 500000, 1);
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1002', N'Phong', N'1 Ly Thuong Kiet', '8308117', 450000, 1);
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1004', N'Phuong', N'351 Lac Long Quan', '8308155', 250000, 0);
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1003', N'Quang', N'78 Truong Dinh', '8324461', 350000, 1);
insert into NhanVien(MaNV, Ten, DChi, DThoai, Luong, LoaiNV)
	values('1007', N'Tam', N'136 Nguyen Van Cu', '8458188', 500000, 0);

--Thêm dữ liệu cho bảng LoaiMB
insert into LoaiMB(HangSX, MaLoai)
	values('Airbus', 'A310');
insert into LoaiMB(HangSX, MaLoai)
	values('Airbus', 'A320');
insert into LoaiMB(HangSX, MaLoai)
	values('Airbus', 'A330');
insert into LoaiMB(HangSX, MaLoai)
	values('Airbus', 'A340');
insert into LoaiMB(HangSX, MaLoai)
	values('Boeing', 'B727');
insert into LoaiMB(HangSX, MaLoai)
	values('Boeing', 'B747');
insert into LoaiMB(HangSX, MaLoai)
	values('Boeing', 'B757');
insert into LoaiMB(HangSX, MaLoai)
	values('MD', 'DC10');
insert into LoaiMB(HangSX, MaLoai)
	values('MD', 'DC9');

--Thêm dữ liệu cho bảng MayBay
insert into MayBay(SoHieu, MaLoai)
	values('10', 'B747');
insert into MayBay(SoHieu, MaLoai)
	values('11', 'B727');
insert into MayBay(SoHieu, MaLoai)
	values('13', 'B727');
insert into MayBay(SoHieu, MaLoai)
	values('13', 'B747');
insert into MayBay(SoHieu, MaLoai)
	values('21', 'DC10');
insert into MayBay(SoHieu, MaLoai)
	values('21', 'DC9');
insert into MayBay(SoHieu, MaLoai)
	values('22', 'B757');
insert into MayBay(SoHieu, MaLoai)
	values('22', 'DC9');
insert into MayBay(SoHieu, MaLoai)
	values('23', 'DC9');
insert into MayBay(SoHieu, MaLoai)
	values('24', 'DC9');
insert into MayBay(SoHieu, MaLoai)
	values('70', 'A310');
insert into MayBay(SoHieu, MaLoai)
	values('80', 'A310');
insert into MayBay(SoHieu, MaLoai)
	values('93', 'B757');

--Thêm dữ liệu cho bảng ChuyenBay
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('100', 'SLC', 'BOS', '08:00 ', '17:50');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('112', 'DCA', 'DEN', '14:00 ', '18:07');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('121', 'STL', 'YYV', '07:00', '09:13');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('122', 'STL', 'YYV', '08:30', '10:19');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('206', 'DFW', 'STL', '09:00', '11:40');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('330', 'JFK', 'YYV', '16:00 ', '18:53');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('334', 'ORD', 'MIA', '12:00', '14:14');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('335', 'MIA', 'ORD', '15:00', '17:14');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('336', 'ORD', 'MIA', '18:00', '20:14');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('337', 'MIA', 'ORD', '20:30', '23:53');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('394', 'DFW', 'MIA', '19:00', '21:30');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('395', 'MIA', 'DFW', '21:00 ', '23:43');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('449', 'CDG', 'DEN', '10:00', '19:29');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('930', 'YYV', 'DCA', '13:00', '16:10');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('931', 'DCA', 'YYV', '17:00', '18:10');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('932', 'DCA', 'YYV', '18:00', '19:10');
insert into ChuyenBay(MaCB, SBDi, SBDen, GioDi, GioDen)
	values('991', 'BOS', 'ORD', '17:00', '18:22');

--Thêm dữ liệu cho bảng LichBay
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/1/2000', '100', '80', 'A310');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/1/2000', '112', '21', 'DC10');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/1/2000', '206', '22', 'DC9');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/1/2000', '334', '10', 'B747');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/1/2000', '395', '23', 'DC9');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/1/2000', '991', '22', 'B757');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('11/01/2000', '337', '10', 'B747');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '100', '11', 'B727');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '112', '11', 'B727');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '206', '13', 'B727');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '334', '10', 'B747');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '335', '10', 'B747');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '337', '24', 'DC9');
insert into LichBay(NgayDi, MaCB, SoHieu, MaLoai)
	values('10/31/2000', '449', '70', 'A310');

--Thêm dữ liệu cho bảng DatCho
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0009', '11/01/2000', '100');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0009', '10/31/2000', '449');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0045', '11/01/2000', '991');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0012', '10/31/2000', '206');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0238', '10/31/2000', '334');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0582', '11/01/2000', '991');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0091', '11/01/2000', '100');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0314', '10/31/2000', '449');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0613', '11/01/2000', '100');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0586', '11/01/2000', '991');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0586', '10/31/2000', '100');
insert into DatCho(MaKH, NgayDi, MaCB)
	values('0422', '10/31/2000', '449');

--Thêm dữ liệu cho bảng KhaNang
insert into KhaNang(MaNV, MaLoai)
	values('1001', 'B727');
insert into KhaNang(MaNV, MaLoai)
	values('1001', 'B747');
insert into KhaNang(MaNV, MaLoai)
	values('1001', 'DC10');
insert into KhaNang(MaNV, MaLoai)
	values('1001', 'DC9');
insert into KhaNang(MaNV, MaLoai)
	values('1002', 'A320');
insert into KhaNang(MaNV, MaLoai)
	values('1002', 'A340');
insert into KhaNang(MaNV, MaLoai)
	values('1002', 'B757');
insert into KhaNang(MaNV, MaLoai)
	values('1002', 'DC9');
insert into KhaNang(MaNV, MaLoai)
	values('1003', 'A310');
insert into KhaNang(MaNV, MaLoai)
	values('1003', 'DC9');
	
--Thêm dữ liệu cho bảng PhanCong
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1001', '11/01/2000', '100');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1001', '10/31/2000', '100');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1002', '11/01/2000', '100');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1002', '10/31/2000', '100');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1003', '10/31/2000', '100');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1003', '10/31/2000', '337');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1004', '10/31/2000', '100');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1004', '10/31/2000', '337');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1005', '10/31/2000', '337');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1006', '11/01/2000', '991');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1006', '10/31/2000', '337');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1007', '11/01/2000', '112');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1007', '11/01/2000', '991');
insert into PhanCong(MaNV, NgayDi, MaCB)
	values('1007', '10/31/2000', '206');


/*Xem dữ liêu các bảng
select * from KhachHang
select * from NhanVien
select * from LoaiMB
select * from MayBay
select * from ChuyenBay
select * from LichBay
select * from DatCho
select * from KhaNang
select * from PhanCong
*/

/*Xóa database
	use master
	drop database DB_QLChuyenBay_22120157;
*/