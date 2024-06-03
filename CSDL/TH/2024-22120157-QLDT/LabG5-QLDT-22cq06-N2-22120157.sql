--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 21/04/2024

use DB_QLDeTai_22120157

/*Xem dữ liệu tất cả các bảng
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

--Q1: Cho biết mức lương cao nhất của các giảng viên
select max(Luong) 'Lương cao nhất'
from GiaoVien	

/*
--Q2 C1: Cho biết những giáo viên có lương lớn nhất
select GV1.MaGV, GV1.HoTen
from GiaoVien GV1
where (	select count(*)
		from GiaoVien GV2
		where GV2.Luong > GV1.Luong) = 0
*/

--Q2 Cách 2:
select MaGV, HoTen
from GiaoVien 
where Luong = (	select max(Luong)
				from GiaoVien)

/*
--Q3 C1 : Cho biết lương cao nhất trong bộ môn 'HTTT'
select max(Luong) 'Lương cao nhất'
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.MaBM = 'HTTT'
*/

--Q3 Cách 2:
select distinct Luong
from GiaoVien
where MaBM = 'HTTT' and Luong >= all ( select Luong
					 from GiaoVien
					 where MaBM = 'HTTT')


--Q4: Cho biết tên giáo viên lớn tuổi nhất của bộ môn Hệ thống thông tin
select GV.HoTen
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hệ thống thông tin'
and GV.NgaySinh <= all ( select GV2.NgaySinh		--Lớn tuổi nhất thì ngày sinh bé nhất (VD: sinh 1995 lớn hơn 2000)
						 from GiaoVien GV2
						 join BoMon BM2 on BM2.MaBM = GV2.MaBM
						 where BM2.TenBM = N'Hệ thống thông tin')

--Q5: Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin
select GV.HoTen
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
where K.TenKhoa = N'Công nghệ thông tin'
and GV.NgaySinh >= all ( select GV2.NgaySinh
						 from GiaoVien GV2
						 join BoMon BM2 on BM2.MaBM = GV2.MaBM
						 join Khoa K2 on K2.MaKhoa = BM2.MaKhoa
						 where K2.TenKhoa = N'Công nghệ thông tin')

--Q6: Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất
select GV.HoTen, K.TenKhoa
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
where GV.Luong >= all ( select Luong
						from GiaoVien)


--Q7: Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ
select GV1.*
from GiaoVien GV1
where GV1.Luong >= all ( select GV2.Luong
						from GiaoVien GV2
						where GV2.MaBM = GV1.MaBM)

/*
--Q8 C1: Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia
select DT.TenDT
from DeTai DT
where not exists ( select *
					from ThamGiaDT TG
					join GiaoVien GV on GV.MaGV = TG.MaGV
					where GV.HoTen = N'Nguyễn Hoài An' and TG.MaDT = DT.MaDT)
*/

--Q8 C2:
select DT.TenDT
from DeTai DT
where MaDT not in ( select TG.MaDT
					from ThamGiaDT TG
					join GiaoVien GV on GV.MaGV = TG.MaGV
					where GV.HoTen = N'Nguyễn Hoài An')


--Q9: Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra 
--tên đề tài, tên người chủ nhiệm đề tài
select DT.TenDT, GV.HoTen 'GVCNDT'
from DeTai DT
join GiaoVien GV on GV.MaGV = DT.GVCNDT
where DT.MaDT not in ( select TG.MaDT
					   from ThamGiaDT TG
					   join GiaoVien GV2 on GV2.MaGV = TG.MaGV
					   where GV2.HoTen = N'Nguyễn Hoài An')
/*--C2
select DT.TenDT, GV.HoTen 'GVCNDT'
from DeTai DT
join GiaoVien GV on GV.MaGV = DT.GVCNDT
where not exists
(
	select *
	from ThamGiaDT TG
	join GiaoVien GV2 on GV2.MaGV = TG.MaGV
	where TG.MaDT = DT.MaDT and GV2.HoTen = N'Nguyễn Hoài An'
)
*/

--Q10: Cho biết tên những giáo viên khoa Công nghệ thông tin chưa tham gia đề tài nào
select GV.HoTen
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
where K.TenKhoa = N'Công nghệ thông tin'
and not exists ( select *
				 from ThamGiaDT TG
				 where TG.MaGV = GV.MaGV)


--Q11: Tìm những giáo viên không tham gia bất kỳ đề tài nào
select *
from GiaoVien
where MaGV not in ( select MaGV 
					from ThamGiaDT)


--Q12: Cho biết giáo viên có lương lớn hơn lương của giáo viên 'Nguyễn Hoài An'
select GV1.*
from GiaoVien GV1
where GV1.Luong > ( select GV2.Luong
					from GiaoVien GV2
					where GV2.HoTen = N'Nguyễn Hoài An')

--Q13: Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài
select GV.*
from GiaoVien GV
join BoMon BM on BM.TruongBM = GV.MaGV
where GV.MaGV in ( select MaGV
				   from ThamGiaDT)


--Q14: Tìm những giáo viên trùng tên và cùng giới tính với giáo viên khác trong cùng bộ môn
select GV1.*
from GiaoVien GV1
where exists (
	select * 
	from GiaoVien GV2
	where GV2.MaBM = GV1.MaBM
	and GV2.HoTen = GV1.HoTen
	and GV2.Phai = GV1.Phai
	and GV2.MaGV != GV1.MaGV)

--Q15: Tìm những giáo viên có lương lớn hơn lương của ít nhất một giáo viên bộ môn 'Công nghệ phần mềm'
select *
from GiaoVien
where Luong > any ( select GV.Luong
					from GiaoVien GV
					join BoMon BM on BM.MaBM = GV.MaBM
					where BM.TenBM = N'Công nghệ phần mềm')

--Q16: Tìm những giáo viên có lương lớn hơn của tất cả các giáo viên thuộc bộ môn 'Hệ thống thông tin'
select *
from GiaoVien
where Luong > all ( select GV.Luong
					from GiaoVien GV
					join BoMon BM on BM.MaBM = GV.MaBM
					where BM.TenBM = N'Hệ thống thông tin')