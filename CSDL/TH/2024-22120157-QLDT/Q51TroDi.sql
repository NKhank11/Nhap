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

--Q51: Cho biết tên khoa có đông giáo viên nhất
select K.TenKhoa
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa	
group by K.TenKhoa
having count(*) >= all (
					select count(*)
					from GiaoVien GV
					join BoMon BM on BM.MaBM = GV.MaBM
					join Khoa K on K.MaKhoa = BM.MaKhoa	
					group by BM.MaKhoa)


--Q52: Cho biết họ tên giáo viên chủ nhiệm nhiều đề tài nhất
select GV.HoTen
from GiaoVien GV
join DeTai DT on DT.GVCNDT = GV.MaGV
group by GV.HoTen
having count(DT.MaDT) >= all (
							select count(DT2.MaDT)
							from DeTai DT2
							group by DT2.GVCNDT)

--Q53: Cho biết mã bộ môn có nhiều giáo viên nhất
select BM.MaBM
from BoMon BM
join GiaoVien GV on GV.MaBM = BM.MaBM
group by BM.MaBM
having count(*) >= all (
					select count(*)
					from GiaoVien GV2
					group by GV2.MaBM)
		
--Q54: Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất.
select GV.HoTen, BM.TenBM
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join ThamGiaDT TG on TG.MaGV = GV.MaGV				--Nen de GV.MaGV o group by cho no sap thu tu giong o subquery
group by GV.MaGV, GV.HoTen, BM.TenBM
having count(*) >= all (
					select count(*)
					from ThamGiaDT TG2
					group by TG2.MaGV)

				
				
--Q55. Cho biết tên giáo viên tham gia nhiều đề tài nhất của bộ môn HTTT.
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
where GV.MaBM = 'HTTT'
group by GV.MaGV, GV.HoTen	
having count(*) >= all (
					select count(*)
					from ThamGiaDT TG2
					group by TG2.MaGV)

--Q56. Cho biết tên giáo viên và tên bộ môn của giáo viên có nhiều người thân nhất.
select GV.HoTen, BM.TenBM, count(*)
from GiaoVien GV
join NguoiThan NT on NT.MaGV = GV.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
group by GV.MaGV, GV.HoTen, BM.TenBM
having count(*) >= all (
					select count(*)
					from NguoiThan NT2
					group by NT2.MaGV)


--Q57. Cho biết tên trưởng bộ môn mà chủ nhiệm nhiều đề tài nhất
select GV.HoTen 'Truong bo mon'
from GiaoVien GV
join BoMon BM on BM.TruongBM = GV.MaGV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
group by GV.MaGV, GV.HoTen
having count(*) >= all ( 
					select count(*)
					from GiaoVien GV2
					join BoMon BM2 on BM2.TruongBM = GV2.MaGV
					join ThamGiaDT TG2 on TG2.MaGV = GV2.MaGV
					group by TG2.MaGV)