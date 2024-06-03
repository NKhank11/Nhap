use DB_QLDeAn_22120157

/*Xem dữ liệu tất cả các bảng
select * from NHANVIEN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from DEAN
select * from CONGVIEC
select * from PHANCONG
select * from THANNHAN
*/
--Q15: Cho biết địa điểm nào vừa có phòng ban trú ngụ, vừa có đề án đang triển khai
select distinct D.DiaDiem
from DiaDiem_Phg D
join PhongBan PB on D.MaPhg = PB.MaPhg
join DeAn DA on D.MaPhg = DA.Phong;

--Q5: Cho biết họ tên đầy đủ của các nhân viên sống ở TP HCM
select HoNV, TenLot, TenNV
from NhanVien
where DChi like '%Tp HCM';

--Q2: Cho biết ngày sinh và địa chỉ của nhân viên có họ tên là 'Đinh Bá Tiến'
select NgSinh, DChi
from NhanVien
where HoNV + ' ' + TenLot + ' ' + TenNV = N'Đinh Bá Tiên';

--Q6: Cho biết các nhân viên sinh trước ngày 30/4/1975
select *
from NhanVien
where NgSinh < '4/30/1975';

select *
from NhanVien
where datediff(d, NgSinh, '4/30/1975') > 0;

--Q9: Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N' nhưng không bắt đầu bằng 'Ng'
select (HoNV + ' ' + TenLot + ' ' + TenNV ) as HoTen
from NhanVien
where HoNV like 'N%' and HoNV not like 'Ng%';

--Q12: Cho biết danh sách các địa điểm vừa là nơi thực hiện đề án, vừa là địa điểm phòng ban
--giống câu trên

--Q13: Cho biết tên của nhân viên nào không trùng với tên của bất kỳ thân nhân nào
select TenNV
from NhanVien
except
select TenTN
from ThanNhan;

--Q8: Tìm các nhân viên có mức lương trên 25000 ở phòng 4 hoặc các nhân viên có mức lương trên 30000 ở phòng 5
select *
from NhanVien
where Luong > 25000 and Phg = 4 or Luong > 30000 or Phg = 5;

--Q16: Cho biết danh sách địa điểm hoặc có phòng ban trú ngụ, hoặc có đề án đang triển khai
select D.DiaDiem
from DiaDiem_Phg D
join PhongBan PB on D.MaPhg = PB.MaPhg
union
select D.DiaDiem
from DiaDiem_Phg D
join DeAn DA on D.MaPhg = DA.Phong;

--Q11: Liệt kê danh sách mã nhân viên giảm dần mà chưa được phân công tham gia bất cứ đề án nào của công ty
select NV.MaNV
from NhanVien NV
except
select PC.MaNVien
from PhanCong PC
order by NV.MaNV desc
--Q7: Tìm những nữ nhân viên có mức lương trên 30000
select *
from NhanVien
where Phai = N'Nữ' and Luong > 30000;

--Q4: Cho biết các nhân viên sinh trước 30/4/1975, đồng thời, hoặc có địa chỉ ở TP HCM hoặc làm việc tại phòng số 4
select *
from NhanVien
where NgSinh < '4/30/1975' and (DChi like '%Tp HCM' or Phg = 4);

--Q23: Với mọi đề án ở 'Hà Nội', liệt kê các mã đề án, mã số phòng ban chủ trì để án, họ tên trưởng phòng cũng như địa chỉ và ngày sinh

select DA.MaDA, PB.MaPhg, NV.HoNV, NV.TenLot, NV.TenNV, NV.DChi, NV.NgSinh
from DeAn DA
left join PhongBan PB on DA.Phong = PB.MaPhg
left join NhanVien NV on PB.TrPhg = NV.MaNV
where DA.DDiem_DA = N'Hà Nội';

--Q29: Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select * from NHANVIEN
select (NV1.HoNV + ' ' + NV1.TenLot + ' ' + NV1.TenNV) 'Họ tên nhân viên', (NV2.HoNV + ' ' + NV2.TenLot + ' ' + NV2.TenNV) 'Họ tên người quản lý'
from NhanVien NV1
left join NhanVien NV2 on NV1.Ma_NQL = NV2.MaNV;