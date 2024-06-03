use DB_QLDeAn_22120157

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

--1. Tìm những nhân viên làm việc ở phòng số 4 select *from NhanVienwhere Phg = 4--2. Tìm những nhân viên có mức lương trên 30000select *from NhanVienwhere Luong > 30000--3, 4.Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5select *from NhanVienwhere Luong > 25000 and Phg = 4unionselect *from NhanVienwhere Luong > 30000 and Phg = 5--5. Cho biết họ tên đầy đủ của các nhân viên ở TP HCMselect *from NhanVienwhere DChi like '%Tp HCM'--6. Cho biết ngày sinh và địa chỉ của nhân viên Hoang Dinh Hieuselect NgSinh, DChifrom NhanVienwhere HoNV = 'Hoang' and TenLot = 'Dinh' and TenNV = 'Hieu'--7. Cho biết danh sách các công việc có tên liên quan đến sản phẩm X.select *from CongViecwhere TenCongViec like N'%sản phẩm X%'--Phép kết--8. Cho biết danh sách các công việc của đề án “Sản phẩm X”.select CV.*from CongViec CVjoin DeAn DA on DA.MaDA = CV.MaDAwhere DA.TenDA = N'Sản phẩm X'--9. Cho biết những công việc được thực hiện tại Hà Nội.select CV.*from CongViec CVjoin DeAn DA on DA.MaDA = CV.MaDAjoin DiaDiem_Phg DD on DD.MaPhg = DA.Phongwhere DD.DiaDiem = N'Hà Nội'--10. Cho biết những công việc mà nhân viên Hoàng Đình Hiếu đảm tráchselect CV.*from CongViec CVjoin PhanCong PC on PC.MaDA = CV.MaDAjoin NhanVien NV on NV.MaNV = PC.MaNVienwhere HoNV = N'Hoàng' and TenLot = N'Đình' and TenNV = N'Hiếu'--11. Cho biết các công việc mà nhân viên phòng Nghiên cứu đảm tráchselect distinct CV.*from CongViec CVjoin PhanCong PC on PC.MaDA = CV.MaDAjoin NhanVien NV on NV.MaNV = PC.MaNVienjoin PhongBan PB on PB.MaPhg = NV.Phgwhere PB.TenPhg = N'Nghiên cứu'--12. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòngselect *from PhongBan PBleft join DiaDiem_Phg DD on DD.MaPhg = PB.MaPhg--13. Tìm tên những người trưởng phòng của từng phòng banselect *from PhongBan PBleft join NhanVien NV on NV.MaNV = PB.TrPhg--Q17: Với mọi đề án ở 'Hà Nội', liệt kê các mã đề án, mã số phòng ban chủ trì để án, họ tên trưởng phòng cũng như địa chỉ và ngày sinh

select DA.MaDA, PB.MaPhg, NV.HoNV, NV.TenLot, NV.TenNV, NV.DChi, NV.NgSinh
from DeAn DA
left join PhongBan PB on DA.Phong = PB.MaPhg
left join NhanVien NV on PB.TrPhg = NV.MaNV
where DA.DDiem_DA = N'Hà Nội';

--Q18: Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select (NV1.HoNV + ' ' + NV1.TenLot + ' ' + NV1.TenNV) 'Họ tên nhân viên', (NV2.HoNV + ' ' + NV2.TenLot + ' ' + NV2.TenNV) 'Họ tên người quản lý'
from NhanVien NV1
left join NhanVien NV2 on NV1.Ma_NQL = NV2.MaNV;