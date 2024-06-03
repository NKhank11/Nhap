use DB_QLChuyenBay_22120157

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

--Q17: Với mỗi sân bay (SBDEN), cho biết số lượng chuyến bay hạ cánh xuống sân bay đó.
-- Kết quả được sắp xếp theo thứ tự tăng dần của sân bay đến
select SBDen, Count(*) 'So chuyen bay'
from ChuyenBay
group by SBDen
order by SBDen asc;

--Q18: Với mỗi sân bay (SBDI), cho biết số lượng chuyến bay xuất phát từ sân bay đó, sắp xếp theo thứ tự tăng dần của sân bay xuất phát.
select SBDi, Count(*) 'So chuyen bay'
from ChuyenBay
group by SBDi
order by SBDi asc;

--Q19: Với mỗi sân bay (SBDI), cho biết số lượng chuyến bay xuất phát theo từng ngày. Xuất ra mã sân bay đi, ngày và số lượng.
select CB.SBDi, LB.NgayDi, count(*) 'So luong'
from ChuyenBay CB
left join LichBay LB on LB.MaCB= CB.MaCB
group by CB.SBDi, LB.NgayDi

--Q20: Với mỗi sân bay (SBDEN), cho biết số lượng chuyến bay hạ cánh theo từng ngày. Xuất ra mã sân bay đến, ngày và số lượng.
select CB.SBDen, LB.NgayDi, count(*) 'So luong'
from ChuyenBay CB
left join LichBay LB on LB.MaCB = CB.MaCB
group by CB.SBDen, LB.NgayDi

--Q21: Với mỗi lịch bay, cho biết mã chuyến bay, ngày đi cùng với số lượng nhân viên không phải là phi công của chuyến bay đó.
