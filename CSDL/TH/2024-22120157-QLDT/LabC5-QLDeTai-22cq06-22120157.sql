--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Email: namkhanhto23@gmail.com hoặc 22120157@student.hcmus.edu.vn
--Ngày làm bài: 24/03/2024

use master

--Tạo database
create database DB_QLDeTai_22120157 on
(
	Name = DB_QLDeTai_22120157_data,
	FileName = 'D:\2024-22120157-QLDT\DB_QLDeTai_22120157_data.mdf'
)
log on
(
	Name = DB_QLDeTai_22120157_log,
	FileName = 'D:\2024-22120157-QLDT\DB_QLDeTai_22120157_log.ldf'
)
go

--Kích hoạt database
use DB_QLDeTai_22120157
go

-- Tạo table và PK
create table GiaoVien
(
	MaGV varchar(9),
	HoTen nvarchar(30),
	Luong decimal(10, 1),
	Phai nvarchar(3),
	NgaySinh date,
	DiaChi nvarchar(50),
	GVQLCM varchar(9),
	MaBM nvarchar(9),
	constraint PK_GiaoVien primary key (MaGV)
);

create table GV_DT
(
	MaGV varchar(9),
	DienThoai char(10),
	constraint PK_GV_DT primary key (MaGV, DienThoai)
);

create table BoMon
(
	MaBM nvarchar(9),
	TenBM nvarchar(30),
	Phong varchar(9),
	DienThoai char(10),
	TruongBM varchar(9),
	MaKhoa varchar(9),
	NgayNhanChuc date,
	constraint PK_BoMon primary key (MaBM)
);

create table Khoa
(
	MaKhoa varchar(9),
	TenKhoa nvarchar(30),
	NamTL int,
	Phong varchar(9),
	DienThoai char(10),
	TruongKhoa varchar(9),
	NgayNhanChuc date,
	constraint PK_Khoa primary key (MaKhoa)
);

create table DeTai
(
	MaDT varchar(9),
	TenDT nvarchar(50),
	KinhPhi decimal(10, 1),
	CapQL nvarchar(9),
	NgayBD date,
	NgayKT date,
	MaCD nvarchar(9),
	GVCNDT varchar(9),
	constraint PK_DeTai primary key (MaDT)
);

create table ChuDe
(
	MaCD nvarchar(9),
	TenCD nvarchar(30),
	constraint PK_ChuDe primary key (MaCD)
);

create table CongViec
(
	MaDT varchar(9),
	SoTT varchar(9),
	TenCV nvarchar(30),
	NgayBD date,
	NgayKT date,
	constraint PK_CongViec primary key (MaDT, SoTT)
);

create table ThamGiaDT
(	
	MaGV varchar(9),
	MaDT varchar(9),
	SoTT varchar(9),
	PhuCap decimal(10,1),
	KetQua nvarchar(9),
	constraint PK_ThamGiaDT primary key (MaGV, MaDT, SoTT)
);

create table NguoiThan
(
	MaGV varchar(9),
	Ten nvarchar(30),
	NgaySinh date,
	Phai nvarchar(9),
	QuanHe nvarchar(9),
	constraint PK_NguoiThan primary key (MaGV, Ten)
);

go

--Tạo FK
alter table GiaoVien
	add constraint FK_GiaoVien_GVQLCM
	foreign key (GVQLCM)
	references GiaoVien(MaGV);

alter table GiaoVien
	add constraint FK_GiaoVien_MaBM
	foreign key (MaBM)
	references BoMon(MaBM);

alter table GV_DT
	add constraint FK_GV_DT_MaGV
	foreign key (MaGV)
	references GiaoVien(MaGV);
	
alter table BoMon
	add constraint FK_BoMon_MaKhoa
	foreign key (MaKhoa)
	references Khoa(MaKhoa);

alter table BoMon
	add constraint FK_BoMon_TruongBM
	foreign key (TruongBM)
	references GiaoVien(MaGV);

alter table Khoa
	add constraint FK_Khoa_TruongKhoa
	foreign key (TruongKhoa)
	references GiaoVien(MaGV);

alter table DeTai
	add constraint FK_DeTai_MaCD
	foreign key (MaCD)
	references ChuDe(MaCD);

alter table DeTai
	add constraint FK_DeTai_GVCNDT
	foreign key (GVCNDT)
	references GiaoVien(MaGV);

alter table CongViec
	add constraint FK_CongViec_MaDT
	foreign key (MaDT)
	references DeTai(MaDT);

alter table ThamGiaDT
	add constraint FK_ThamGiaDT_MaD_SoTT
	foreign key (MaDT, SoTT)
	references CongViec(MaDT, SoTT);

alter table ThamGiaDT
	add constraint FK_ThamGiaDT_MaGV
	foreign key (MaGV)
	references GiaoVien(MaGV);

alter table NguoiThan
	add constraint FK_NguoiThan_MaGV
	foreign key (MaGV)
	references GiaoVien(MaGV);

go


--Nhập dữ liệu cho các bảng
--Nhập dữ liệu cho GiaoVien
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('001', N'Nguyễn Hoài An', 2000.0, N'Nam', '02/15/1973', N'25/3 Lạc Long Quân, Q.10, TP HCM', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('002', N'Trần Trà Hương', 2500.0, N'Nữ', '06/20/1960', N'125 Trần Hưng Đạo, Q.1, TP HCM', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('003', N'Nguyễn Ngọc Ánh', 2200.0, N'Nữ', '05/11/1975', N'12/21 Võ Văn Ngân Thủ Đức, TP HCM', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('004', N'Trương Nam Sơn', 2300.0, N'Nam', '06/20/1959', N'215 Lý Thường Kiệt, TP Biên Hòa', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('005', N'Lý Hoàng Hà', 2500.0, N'Nam', '10/23/1954', N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('006', N'Trần Bạch Tuyết', 1500.0, N'Nữ', '05/20/1980', N'127 Hùng Vương, TP Mỹ Tho', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('007', N'Nguyễn An Trung', 2100.0, N'Nam', '06/05/1976', N'234 3/2, TP Biên Hòa', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('008', N'Trần Trung Hiếu', 1800.0, N'Nam', '08/06/1977', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('009', N'Trần Hoàng Nam', 2000.0, N'Nam', '11/22/1975', N'234 Trấn Não, An Phú, TP HCM', null, null);
insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
	values ('010', N'Phạm Nam Thanh', 1500.0, N'Nam', '12/12/1980', N'221 Hùng Vương, Q.5, TP HCM', null, null);

	--Xem, xóa dữ liệu GiaoVien
	--select * from GiaoVien
	--delete from GiaoVien


--Nhập dữ liệu cho GV_DT
insert into GV_DT(MaGV, DienThoai)
	values ('001', '0838912112')
insert into GV_DT(MaGV, DienThoai)
	values ('001', '0903123123')
insert into GV_DT(MaGV, DienThoai)
	values ('002', '0913454545')
insert into GV_DT(MaGV, DienThoai)
	values ('003', '0838121212')
insert into GV_DT(MaGV, DienThoai)
	values ('003', '0903656565')
insert into GV_DT(MaGV, DienThoai)
	values ('003', '0937125125')
insert into GV_DT(MaGV, DienThoai)
	values ('006', '0937888888')
insert into GV_DT(MaGV, DienThoai)
	values ('008', '0653717171')
insert into GV_DT(MaGV, DienThoai)
	values ('008', '0913232323')

	--Xem, xóa dữ liệu GV_DT
	--select * from GV_DT
	--delete from GV_DT

--Nhập dữ liệu cho BoMon
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('CNTT', N'Công nghệ tri thức', 'B15', '0838126126', null, null, null);
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('HHC', N'Hóa hữu cơ', 'B44', '0838222222', null, null, null);
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('HL', N'Hóa lý', 'B42', '0838878787', null, null, null);
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('HPT', N'Hóa phân tích', 'B43', '0838777777', null, null, '10/15/2007');
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('HTTT', N'Hệ thống thông tin', 'B13', '0838125125', null, null, '09/20/2004');
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('MMT', N'Mạng máy tính', 'B16', '0838676767', null, null, '05/15/2005');
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('SH', N'Sinh hóa', 'B33', '0838898989', null, null, null);
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values (N'VLĐT', N'Vật lý điện tử', 'B23', '0838234234', null, null, null);
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values (N'VLƯD', N'Vật lý ứng dụng', 'B24', '0838454545', null, null, '02/18/2006');
insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
	values ('VS', N'Vi sinh', 'B32', '0838909090', null, null, '01/01/2007');

	--Xem, xóa dữ liệu BoMon
	--select * from BoMon
	--delete from BoMon


--Nhập dữ liệu cho Khoa
insert into Khoa(MaKhoa, TenKhoa, NamTL, Phong, DienThoai, TruongKhoa, NgayNhanChuc)
	values ('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '02/20/2005');
insert into Khoa(MaKhoa, TenKhoa, NamTL, Phong, DienThoai, TruongKhoa, NgayNhanChuc)
	values ('HH', N'Hóa học', 1980, 'B41', '0838456456', '007', '10/15/2001');
insert into Khoa(MaKhoa, TenKhoa, NamTL, Phong, DienThoai, TruongKhoa, NgayNhanChuc)
	values ('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '10/11/2000');
insert into Khoa(MaKhoa, TenKhoa, NamTL, Phong, DienThoai, TruongKhoa, NgayNhanChuc)
	values ('VL', N'Vật lý', 1976, 'B21', '0838223223', '005', '09/18/2003');

	--Xem, xóa dữ liệu Khoa
	--select * from Khoa
	--delete from Khoa


--Nhập dữ liệu cho DeTai
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20.0, '10/20/2007', '10/20/2008', null, '002');
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('002', N'HTTT quản lý giáo vụ cho một Khoa', N'Trường', 20.0, '10/12/2000', '10/12/2001', null, '002');
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('003', N'Nghiên cứu chế tạo sợi nano platin', N'ĐHQG', 300.0, '05/15/2008', '05/15/2010', null, '005');
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('004', N'Tạo vật liệu sinh học bằng mảng ối người', N'Nhà nước', 100.0, '01/01/2007', '12/31/2009', null, '004');
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '10/10/2003', '12/10/2004', null, '007');
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '10/20/2006', '10/20/2009', null, '004');
insert into DeTai(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT)
	values ('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20.0, '05/10/2009', '05/10/2010', null, '001');

	--Xem, xóa dữ liệu DeTai
	--select * from DeTai
	--delete from DeTai

	
--Nhập dữ liệu cho ChuDe
insert into ChuDe(MaCD, TenCD)
	values ('NCPT', N'Nghiên cứu phát triển');
insert into ChuDe(MaCD, TenCD)
	values ('QLGD', N'Quản lý giáo dục');
insert into ChuDe(MaCD, TenCD)
	values (N'ƯDCN', N'Ứng dụng công nghệ');

	--Xem dữ liệu ChuDe
	--select * from ChuDe
	--delete from ChuDe


--Nhập dữ liệu cho CongViec
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('001', 1, N'Khởi tạo và lập kế hoạch', '10/20/2007', '12/20/2008');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('001', 2, N'Xác định yêu cầu', '12/21/2008', '03/21/2008');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('001', 3, N'Phân tích hệ thống', '03/22/2008', '05/22/2008');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('001', 4, N'Thiết kế hệ thống', '05/23/2008', '06/23/2008');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('001', 5, N'Cài đặt thử nghiệm', '06/24/2008', '10/20/2008');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('002', 1, N'Khởi tạo và lập kế hoạch', '05/10/2009', '07/10/2009');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('002', 2, N'Xác định yêu cầu', '07/11/2009', '10/11/2009');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('002', 3, N'Phân tích hệ thống', '10/12/2009', '12/20/2009');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('002', 4, N'Thiết kế hệ thống', '12/21/2009', '03/22/2010');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('002', 5, N'Cài đặt thử nghiệm', '03/23/2010', '05/10/2010');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('006', 1, N'Lấy mẫu', '10/20/2006', '02/20/2007');
insert into CongViec(MaDT, SoTT, TenCV, NgayBD, NgayKT)
	values ('006', 2, N'Nuôi cây', '02/21/2007', '08/21/2008');

	--Xem, xóa dữ liệu CongViec
	--select * from CongViec
	--delete from CongViec


--Nhập dữ liệu cho ThamGiaDT
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('001', '002', 1, 0.0, null);
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('001', '002', 2, 2.0, null);
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('002', '001', 4, 2.0, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('003', '001', 1, 1.0, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('003', '001', 2, 0.0, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('003', '001', 4, 1.0, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('003', '002', 2, 0.0, null);
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('004', '006', 1, 0.0, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('004', '006', 2, 1.0, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('006', '006', 2, 1.5, N'Đạt');
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('009', '002', 3, 0.5, null);
insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
	values ('009', '002', 4, 1.5, null);

	--Xem dữ liệu ThamGiaDT
	--select * from ThamGiaDT
	--delete from ThamGiaDT


--Nhập dữ liệu cho NguoiThan
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('001', N'Hùng',	'01/14/1990', N'Nam', N'Con trai');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe )
	values ('001', N'Thủy', '12/08/1994', N'Nữ', N'Con gái');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('003', N'Hà', '09/03/1998', N'Nữ', N'Con gái');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('003', N'Thu', '09/03/1998', N'Nữ', N'Con gái');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('007', N'Mai', '03/26/2003', N'Nữ', N'Con gái');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('007', N'Vy', '02/14/2000', N'Nữ', N'Con gái');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('008', N'Nam', '05/06/1991', N'Nam', N'Con trai');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('009', N'An', '08/19/1996', N'Nam', N'Con trai');
insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
	values ('010', N'Nguyệt', '01/14/2004', N'Nữ', N'Con gái');
	
	--Xem dữ liệu NguoiThan
	--select * from NguoiThan
	--delete from NguoiThan

go


-- Update dữ liệu
-- Update bảng GiaoVien
update GiaoVien
	set MaBM = 'MMT'
	where MaGV = '001';

update GiaoVien
	set MaBM = 'HTTT'
	where MaGV = '002';

update GiaoVien
	set MaBM = 'HTTT', GVQLCM = '002'
	where MaGV = '003';

update GiaoVien
	set MaBM = 'VS'
	where MaGV = '004';

update GiaoVien
	set MaBM = N'VLĐT'
	where MaGV = '005';

update GiaoVien
	set MaBM = 'VS', GVQLCM = '004'
	where MaGV = '006';

update GiaoVien
	set MaBM = 'HPT'
	where MaGV = '007';

update GiaoVien
	set MaBM = 'HPT', GVQLCM = '007'
	where MaGV = '008';

update GiaoVien
	set MaBM = 'MMT', GVQLCM = '001'
	where MaGV = '009';

update GiaoVien
	set MaBM = 'HPT', GVQLCM = '001'
	where MaGV = '010';

	--Xem dữ liệu khi update
	--select *from GiaoVien


--Update bảng BOMON
update BoMon
	set MaKhoa = 'CNTT'
	where MaBM = 'CNTT';

update BoMon
	set MaKhoa = 'HH'
	where MaBM = 'HHC';

update BoMon
	set MaKhoa = 'HH'
	where MaBM = 'HL';

update BoMon
	set TruongBM = '007', MaKhoa = 'HH'
	where MaBM = 'HPT';

update BoMon
	set MaKhoa = 'CNTT'
	where MaBM = 'CNTT';

update BoMon
	set TruongBM = '002', MaKhoa = 'CNTT'
	where MaBM = 'HTTT';

update BoMon
	set TruongBM = '001', MaKhoa = 'CNTT'
	where MaBM = 'MMT';

update BoMon
	set MaKhoa = 'SH'
	where MaBM = 'SH';

update BoMon
	set MaKhoa = 'VL'
	where MaBM = N'VLĐT';

update BoMon
	set TruongBM = '005', MaKhoa = 'VL'
	where MaBM = N'VLƯD';

update BoMon
	set TruongBM = '004', MaKhoa = 'SH'
	where MaBM = 'VS';

	--Xem dữ liệu khi update
	--select * from BoMon


--Update dữ liệu cho DeTai
update DeTai
	set	MaCD = 'QLGD'
	where MaDT = '001'
update DeTai
	set	MaCD = 'QLGD'
	where MaDT = '002'
update DeTai
	set	MaCD = 'QLGD'
	where MaDT = '007'

update DeTai
	set	MaCD = 'NCPT'
	where MaDT = '003'
update DeTai
	set	MaCD = 'NCPT'
	where MaDT = '004'
update DeTai
	set	MaCD = 'NCPT'
	where MaDT = '006'

update DeTai
	set	MaCD = N'ƯDCN'
	where MaDT = '005';

	--Xem dữ liệu khi update
	--select * from DeTai

go

--Xem dữ liệu tất cả các bảng
select * from GiaoVien
select * from GV_DT
select * from BoMon
select * from NguoiThan
select * from Khoa
select * from ChuDe
select * from DeTai
select * from CongViec
select * from ThamGiaDT

-- Xóa database
/*
	use master
	drop database DB_QLDeTai_22120157
*/


