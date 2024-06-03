--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Email: namkhanhto23@gmail.com hoặc 22120157@student.hcmus.edu.vn
--Ngày làm bài: 24/03/2024

use master

--Tạo database
create database DB_QLDA_22120157 on
(
	Name = DB_QLDA_22120157_data,
	FileName = 'D:\2024-22120157-QLDeAn\DB_QLDA_22120157_data.mdf'
)
log on
(
	Name = DB_QLDA_22120157_log,
	FileName = 'D:\2024-22120157-QLDeAn\DB_QLDA_22120157_log.ldf'
)
go

--Kích hoạt database
use DB_QLDA_22120157
go

--Tạo PK và Check
create table NHANVIEN
(
	HoNV nvarchar(15),
	TenLot nvarchar(15),
	TenNV nvarchar(15),
	MaNV char(9),
	NgSinh date,
	DChi nvarchar(30),
	Phai nvarchar(3),
	Luong float,
	Ma_NQL char(9),
	PHG smallint,
	constraint PK_NHANVIEN primary key (MaNV)
);

create table PHONGBAN
(
	TenPHG nvarchar(15),
	MaPHG smallint,
	TrPHG char(9),
	Ng_NhanChuc date,
	constraint PK_PHONGBAN primary key (MaPHG)
);

create table DIADIEM_PHG
(
	MaPHG smallint,
	DiaDiem nvarchar(15),
	constraint PK_DIADIEM_PHG primary key (MaPHG, DiaDiem)
);
go

create table DEAN
(
	TenDA nvarchar(15),
	MaDA smallint,
	Ddiem_DA nvarchar(15),
	Phong smallint,
	constraint PK_DEAN primary key (MaDA)
);

create table CONGVIEC
(
	MaDA smallint,
	STT smallint,
	Ten_Cong_Viec nvarchar(50),
	constraint PK_CONGVIEC primary key (MaDA, STT)
);

create table PHANCONG
(
	MaNVien char(9),
	MaDA smallint,
	STT smallint,
	ThoiGian decimal(5,1),
	constraint PK_PHANCONG primary key (MaNVien, MaDA, STT)
);

create table THANNHAN
(
	MaNVien char(9),
	TenTN nvarchar(15),
	Phai nvarchar(3),
	NgSinh date,
	QuanHe nvarchar(15),
	constraint PK_THANNHAN primary key (MaNVien, TenTN)
);

go

--Tạo FK
alter table NHANVIEN
	add constraint FK_NHANVIEN_Ma_NQL 
	foreign key (Ma_NQL)
	references NHANVIEN(MaNV);

alter table NHANVIEN
	add constraint FK_NHANVIEN_PHG
	foreign key (PHG)
	references PHONGBAN(MaPHG);

alter table PHONGBAN
	add constraint FK_PHONGBAN_TrPHG
	foreign key (TrPHG)
	references NHANVIEN(MaNV);

alter table DIADIEM_PHG
	add constraint FK_DIADIEM_PHG_MaPHG
	foreign key (MaPHG)
	references PHONGBAN(MaPHG);

alter table DEAN
	add constraint FK_DEAN_Phong
	foreign key (Phong)
	references PHONGBAN(MaPHG);

alter table CONGVIEC
	add constraint FK_CONGVIEC_MaDA
	foreign key (MaDA)
	references DEAN(MaDA);

alter table PHANCONG
	add constraint FK_PHANCONG_MaNVien
	foreign key (MaNVien)
	references NHANVIEN(MaNV);

alter table PHANCONG
	add constraint FK_PHANCONG_MaDA_STT
	foreign key (MaDA, STT)
	references CONGVIEC(MaDA, STT);

alter table THANNHAN
	add constraint FK_THANNHAN_MaNVien
	foreign key (MaNVien)
	references NHANVIEN(MaNV);

--Nhập dữ liệu

--Nhập bảng NHANVIEN
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Đinh', N'Bá', N'Tiến', '009', '11/02/1960', N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Nguyễn', N'Thanh', N'Tùng', '005', '08/20/1962', N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Bùi', N'Ngọc', N'Hằng', '007', '03/11/1954', N'332 Nguyễn Thái Học, Tp HCM', N'Nam', 25000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Lê', N'Quỳnh', N'Như', '001', '02/01/1967', N'291 Hồ Văn Huê, Tp HCM', N'Nữ', 43000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Nguyễn', N'Mạnh', N'Hùng', '004', '03/04/1967', N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Trần', N'Thanh', N'Tâm', '003', '05/04/1957', N'34 Mai Thị Lư, Tp HCM', N'Nam', 25000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Trần', N'Hồng', N'Quang', '008', '09/01/1967', N'80 Lê Hồng Phong, Tp HCM', N'Nam', 25000, null , null);
insert into NHANVIEN (HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, Ma_NQL, PHG)
	values (N'Phạm', N'Văn', N'Vinh', '006', '01/01/1965', N'45 Trưng Vương, Hà Nội', N'Nữ', 55000, null , null);

	--Xem, xóa dữ liệu bảng NHANVIEN
	--select * from NHANVIEN
	--delete from NHANVIEN


--Nhập bảng PHONGBAN
insert into PHONGBAN (TenPHG, MaPHG, TrPHG, Ng_NhanChuc)
	values (N'Nghiên cứu', 5, '005', '05/22/1967');
insert into PHONGBAN (TenPHG, MaPHG, TrPHG, Ng_NhanChuc)
	values (N'Nghiên cứu', 4, '008', '01/01/1985');
insert into PHONGBAN (TenPHG, MaPHG, TrPHG, Ng_NhanChuc)
	values (N'Nghiên cứu', 1, '006', '06/19/1971');

	--Xem, xóa dữ liệu bảng PHONGBAN
	--select * from PHONGBAN
	--delete from PHONGBAN


--Nhập bảng DIADIEM_PHG
insert into DIADIEM_PHG (MaPHG, DiaDiem)
	values (1, N'TP HCM');
insert into DIADIEM_PHG (MaPHG, DiaDiem)
	values (4, N'Hà Nội');
insert into DIADIEM_PHG (MaPHG, DiaDiem)
	values (5, N'Vũng Tàu');
insert into DIADIEM_PHG (MaPHG, DiaDiem)
	values (5, N'Nha Trang');
insert into DIADIEM_PHG (MaPHG, DiaDiem)
	values (5, N'TP HCM');

	--Xem, xóa dữ liệu bảng DIADIEM_PHG
	--select * from DIADIEM_PHG
	--delete from DIADIEM_PHG


--Nhập bảng DEAN
insert into DEAN(TenDA, MaDA, Ddiem_DA, Phong)
	values (N'Sản phẩm X', 1, N'Vũng Tàu', 5);
insert into DEAN(TenDA, MaDA, Ddiem_DA, Phong)
	values (N'Sản phẩm Y', 2, N'Nha Trang', 5);
insert into DEAN(TenDA, MaDA, Ddiem_DA, Phong)
	values (N'Sản phẩm Z', 3, N'TP HCM', 5);
insert into DEAN(TenDA, MaDA, Ddiem_DA, Phong)
	values (N'Tin học hóa', 10, N'Hà Nội', 4);
insert into DEAN(TenDA, MaDA, Ddiem_DA, Phong)
	values (N'Cáp quang', 20, N'TP HCM', 1);
insert into DEAN(TenDA, MaDA, Ddiem_DA, Phong)
	values (N'Đào tạo', 30, N'Hà Nội', 4);

	--Xem, xóa dữ liệu bảng DEAN
	--select * from DEAN
	--delete from DEAN


--Nhập bảng CONGVIEC
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (1, 1, N'Thiết kế sản phẩm X');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (1, 2, N'Thử nghiệm sản phẩm X');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (2, 1, N'Sản xuất sản phẩm Y');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (2, 2, N'Quảng cáo sản phẩm Y');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (3, 1, N'Khuyến mãi sản phẩm Z');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (10, 1, N'Tin học hóa nhân sự tiền lương');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (10, 2, N'Tin học hóa phòng kinh doanh');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (20, 1, N'Lắp đặt cáp quang khu B');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (30, 1, N'Đào tạo nhân viên marketing');
insert into CONGVIEC(MaDA, STT, Ten_Cong_Viec)
	values (30, 2, N'Đào tạo chuyên viên thiết kế');

	--Xem, xóa dữ liệu bảng CONGVIEC
	--select * from CONGVIEC
	--delete from CONGVIEC


--Nhập bảng PHANCONG
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('009', 1, 1, 32);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('009', 2, 2, 8);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('004', 3, 1, 40);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('003', 1, 2, 20.0);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('003', 2, 1, 20.0);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('008', 10, 1, 35);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('008', 30, 2, 5);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('001', 30, 1, 20);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('001', 20, 1, 15);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('006', 20, 1, 30);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('005', 3, 1, 10);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('005', 10, 2, 10);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('005', 20, 1, 10);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('007', 30, 2, 30);
insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
	values ('007', 10, 2, 10);

	--Xem, xóa dữ liệu bảng PHANCONG
	--select * from PHANCONG
	--delete from PHANCONG


--Nhập bảng THANNHAN
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái');
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai');
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng');
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('001', N'Minh', N'Nữ', '02/29/1932', N'Vợ chồng');
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('009', N'Tiến', N'Nữ', '01/01/1978', N'Con trai');
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái');
insert into THANNHAN(MaNVien, TenTN, Phai, NgSinh, QuanHe)
	values ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng');
go

	--Xem, xóa dữ liệu bảng THANNHAN
	--select * from THANNHAN
	--delete from THANNHAN


--Update dữ liệu
--Update bảng NHANVIEN
update NHANVIEN
	set Ma_NQL = '005', PHG = 5
	where MaNV = '009';

update NHANVIEN
	set Ma_NQL = '006', PHG = 5
	where MaNV = '005';

update NHANVIEN
	set Ma_NQL = '001', PHG = 4
	where MaNV = '007';

update NHANVIEN
	set Ma_NQL = '006', PHG = 4
	where MaNV = '001';

update NHANVIEN
	set Ma_NQL = '005', PHG = 5
	where MaNV = '004'

update NHANVIEN
	set Ma_NQL = '005', PHG = 5
	where MaNV = '003';

update NHANVIEN
	set Ma_NQL = '001', PHG = 4
	where MaNV = '008';

update NHANVIEN
	set Ma_NQL = '009', PHG = 1
	where MaNV = '006';
go

--Xem dữ liệu tất cả các bảng
select * from NHANVIEN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from DEAN
select * from CONGVIEC
select * from PHANCONG
select * from THANNHAN

--Xóa database
/*
	use master
	drop database DB_QLDA_22120157;
*/
