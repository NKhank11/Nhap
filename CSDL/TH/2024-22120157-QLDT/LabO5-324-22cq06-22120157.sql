--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 23/05/2024

use DB_QLDeTai_22120157

--Xem dữ liệu tất cả các bảng
/*
select * from GiaoVien
select * from GV_DT
select * from BoMon
select * from NguoiThan
select * from Khoa
select * from ChuDe
select * from DeTai
select * from CongViec
select * from ThamGiaDT
*/

--Cài đặt một số RBTV miền giá trị sử dụng kỹ thuật CHECK
--1) Giới tính của Giáo viên phải là Nam hoặc Nữ
alter table GiaoVien
add constraint CK_GiaoVien_Phai
check (Phai in (N'Nam', N'Nữ'));

--2) Lương của giáo viên phải là một số	làm tròn đến hàng chục
alter table GiaoVien
add constraint CK_GiaoVien_Luong
check (Luong % 10 = 0);

--3) Tuổi của giáo viên phải từ	18 đến 60 tuổi
alter table GiaoVien
add constraint CK_GiaoVien_Tuoi
check (year(getdate()) - year(ngaySinh) between 18 and 60);


