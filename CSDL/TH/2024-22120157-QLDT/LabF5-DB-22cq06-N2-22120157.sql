--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 21/04/2024

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

--Q1: Cho biết số lượng giáo viên và tổng lương của họ
select count(*) 'Số GV', sum(Luong) 'Tổng lương'
from GiaoVien

--Q2: Cho biết số lượng giáo viên và lương trung bình của từng bộ môn
select BM.TenBM, count(GV.MaGV) 'Số GV', sum(GV.Luong) 'Lương TB'
from BoMon BM
left join GiaoVien GV on GV.MaBM = BM.MaBM
group by BM.TenBM

--Q3: Cho biết tên chủ đề và số lượng đề tài thuộc chủ đề đó
select CD.TenCD, count(DT.MaDT) 'Số đề tài'
from ChuDe CD
left join DeTai DT on DT.MaCD = CD.MaCD
group by CD.MaCD, CD.TenCD

--Q4: Cho biết tên giáo viên và số lượng đề tài giáo viên đó tham gia
select GV.HoTen, count(distinct TG.MaDT) 'SLDT'
from GiaoVien GV
left join ThamGiaDT TG on TG.MaGV = GV.MaGV
group by GV.HoTen

--Q5: Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiêm
select GV.HoTen, count(distinct DT.MaDT) 'Số DT chủ nhiệm'
from GiaoVien GV
left join DeTai DT on DT.GVCNDT = GV.MaGV
group by GV.HoTen

--Q6: Với mỗi giáo viên cho tên giáo viên và số người thân giáo viên đó
select GV.HoTen, count(NT.MaGV) 'Số người thân'
from GiaoVien GV
left join NguoiThan NT on NT.MaGV = GV.MaGV
group by GV.HoTen

--Q7: Cho biết tên những giáo viên tham gia từ 3 đề tài trở lên
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
group by GV.HoTen
having count(distinct TG.MaDT) >= 3

--Q8: Cho biết số lượng giáo viên tham gia vào đề tài Ứng dụng hóa học xanh
select count(distinct GV.MaGV) 'Số GV tham gia'
from GiaoVien GV
join DeTai DT on DT.GVCNDT = GV.MaGV
where DT.TenDT = N'Ứng dụng hóa học xanh'