--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2

use master

--Tạo database
create database DB_QLPhim_22120157 on
(
	Name = DB_QLPhim_22120157_data,
	FileName = 'D:\2024-22120157-QLPhim\DB_QLPhim_22120157_data.mdf'
)
log on
(
	Name = DB_QLPhim_22120157_log,
	FileName = 'D:\2024-22120157-QLPhim\DB_QLPhim_22120157_log.ldf'
)
go

--Kích hoạt database
use DB_QLPhim_22120157

--Tạo table và FK
create table Phim
(
	MaPhim varchar(9),
	TenPhim nvarchar(50),
	DoDai int,
	NamSanXuat int,
	MaTheLoai varchar(9),
	MaDaoDien varchar(9),
	constraint PK_Phim primary key (MaPhim)
);

create table TheLoai
(
	MaTheLoai varchar(9),
	TenTheloai nvarchar(50),
	constraint PK_TheLoai primary key (MaTheLoai)
);

create table DaoDien
(
	MaDaoDien varchar(9),
	HoTen nvarchar(50),
	NamSinh int,
	DiaChi nvarchar(50),
	Phai nvarchar(3),
	constraint PK_DaoDien primary key (MaDaoDien)
);

create table DienVien
(
	MaDienVien varchar(9),
	HoTen nvarchar(50),
	NamSinh int,
	DiaChi nvarchar(50),
	Phai nvarchar(3),
	TheLoaiSoTruong varchar(9),
	constraint PK_DienVien primary key (MaDienVien)
);

create table DongPhim
(
	MaPhim varchar(9),
	MaDienVien varchar(9),
	NhanVat nvarchar(50),
	VaiTro	nvarchar(50),
	SoGio int,
	DonGia int,
	constraint PK_DongPhim primary key (MaPhim, MaDienVien)
);

go

--Tạo FK
alter table Phim
	add constraint FK_Phim_MaTheLoai
	foreign key (MaTheLoai)
	references TheLoai(MaTheLoai);

alter table Phim
	add constraint FK_Phim_MaDaoDien
	foreign key (MaDaoDien)
	references DaoDien(MaDaoDien);

alter table DienVien
	add constraint FK_DienVien_TheLoaiSoTruong
	foreign key (TheLoaiSoTruong)
	references TheLoai(MaTheLoai);

alter table DongPhim
	add constraint FK_DongPhim_MaPhim
	foreign key (MaPhim)
	references Phim(MaPhim);

alter table DongPhim
	add constraint FK_DongPhim_MaDienVien
	foreign key (MaDienVien)
	references DienVien(MaDienVien);

go

--Thêm dữ liệu
--Thêm dữ liệu cho bảng TheLoai
insert into TheLoai(MaTheLoai, TenTheloai)
	values ('X', N'Phim truyền hình');
insert into TheLoai(MaTheLoai, TenTheloai)
	values ('Y', N'Phim hoạt hình');
insert into TheLoai(MaTheLoai, TenTheloai)
	values ('Z', N'Phim hành động');
insert into TheLoai(MaTheLoai, TenTheloai)
	values ('T', N'Phim tình cảm');
insert into TheLoai(MaTheLoai, TenTheloai)
	values ('U', N'Phim trinh thám');

--Thêm dữ liệu cho bảng DaoDien
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D01', N'Nguyễn Thanh Tùng', 1974, N'Hồ Chí Minh', N'Nam');
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D02', N'Lê Nhật Nam', 1962, N'Hồ Chí Minh', N'Nữ');
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D03', N'Nguyễn Thị Thanh', 1977, N'Cà Mau', N'Nữ');
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D04', N'Lê Thị Lan', 1984, N'Bình Dương', N'Nữ');
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D05', N'Trần Minh Quang', 1984, N'Đồng Nai', N'Nam');
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D06', N'Lê Văn Hải', 1970, N'Hồ Chí Minh', N'Nam');
insert into DaoDien(MaDaoDien, HoTen, NamSinh, DiaChi, Phai)
	values('D07', N'Dương Văn Hai', 1988, N'Đồng Nai', N'Nam');

--Thêm dữ liệu cho bảng DienVien
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV01', N'Nguyễn Thị Lan Hương', 1988, N'Hà Nội', N'Nữ', 'X');
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV02', N'Trần Nguyễn Thu Hà', 1992, N'Hồ Chí Minh', N'Nữ', 'T');
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV03', N'Lý Nhược Đồng', 1978, N'Hồ Chí Minh', N'Nữ', 'T');
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV04', N'Lý Mạnh Hùng', 1984, N'Bình Dương', N'Nam', 'Y');
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV05', N'Trần Văn Hoàng', 1977, N'Đà Nẵng', N'Nam', 'Z');
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV06', N'Phạm Thu Hiền', 1989, N'Đồng Tháp', N'Nữ', 'T');
insert into DienVien(MaDienVien, HoTen, NamSinh, DiaChi, Phai, TheLoaiSoTruong)
	values('DV07', N'Trần Băng Băng', 1991, N'Cà Mau', N'Nữ', 'T');

--Thêm dữ liệu cho bảng Phim
insert into Phim(MaPhim, TenPhim, DoDai, NamSanXuat, MaTheLoai, MaDaoDien)
	values('P01', N'Bình minh trên biển', 180, 2008, 'X', 'D03');
insert into Phim(MaPhim, TenPhim, DoDai, NamSanXuat, MaTheLoai, MaDaoDien)
	values('P02', N'Anh hùng xa lộ', 120, 2009, 'Z', 'D03');
insert into Phim(MaPhim, TenPhim, DoDai, NamSanXuat, MaTheLoai, MaDaoDien)
	values('P03', N'Cuộc phiêu lưu trong rừng', 150, 2007, 'U', 'D05');
insert into Phim(MaPhim, TenPhim, DoDai, NamSanXuat, MaTheLoai, MaDaoDien)
	values('P04', N'Ở cuối chân trời', 160, 2010, 'X', 'D05');
insert into Phim(MaPhim, TenPhim, DoDai, NamSanXuat, MaTheLoai, MaDaoDien)
	values('P05', N'Chú thỏ ham ăn', 60, 2009, 'Y', 'D06');

--Nhập dữ liệu cho bảng DongPhim
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P01', 'DV01', N'Tuyết', N'Nữ chính', 50, 120);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P01', 'DV04', N'Nam', N'Nam chính', 50, 100);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P01', 'DV06', N'Lan', N'Phụ', 20, 60);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P02', 'DV04', N'Mạnh', N'Nam chính', 40, 150);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P02', 'DV05', N'Hồ', N'Nam chính', 60, 110);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P03', 'DV05', N'Dũng', N'Nam chính', 60, 120);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P04', 'DV06', N'Nga', N'Nữ chính', 50, 110);
insert into DongPhim(MaPhim, MaDienVien, NhanVat, VaiTro, SoGio, DonGia)
	values ('P04', 'DV05', N'Hoàng', N'Nam chính', 45, 140);

/*Xem dữ liệu các bảng
	select * from Phim
	select * from TheLoai
	select * from DaoDien
	select * from DienVien
	select * from DongPhim
*/

/* Xóa database
	use master
	drop database DB_QLPhim_22120157
*/