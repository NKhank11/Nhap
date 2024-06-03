﻿use DB_QLDeAn_22120157

--Xem dữ liêu các bảng
/*
select * from NHANVIEN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from DEAN
select * from CONGVIEC
select * from PHANCONG
select * from THANNHAN
*/



--Các câu truy vấn đơn giản

--1. Tìm những nhân viên làm việc ở phòng số 4 

select DA.MaDA, PB.MaPhg, NV.HoNV, NV.TenLot, NV.TenNV, NV.DChi, NV.NgSinh
from DeAn DA
left join PhongBan PB on DA.Phong = PB.MaPhg
left join NhanVien NV on PB.TrPhg = NV.MaNV
where DA.DDiem_DA = N'Hà Nội';

--Q18: Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select (NV1.HoNV + ' ' + NV1.TenLot + ' ' + NV1.TenNV) 'Họ tên nhân viên', (NV2.HoNV + ' ' + NV2.TenLot + ' ' + NV2.TenNV) 'Họ tên người quản lý'
from NhanVien NV1
left join NhanVien NV2 on NV1.Ma_NQL = NV2.MaNV;