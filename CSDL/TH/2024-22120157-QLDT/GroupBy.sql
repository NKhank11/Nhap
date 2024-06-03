use DB_QLDeTai_22120157

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

--Q27: Cho biết số lượng giáo viên và tổng lương của họ.
select Count(*) 'Số GV', Sum(Luong) 'Tổng Lương'
from GiaoVien

--Q28: Cho biết số lượng giáo viên và lương trung bình của từng bộ môn.
select BM.TenBM, Count(GV.MaGV) 'Số GV', AVG(GV.Luong) 'Lương'
from GiaoVien GV
left join BoMon BM on GV.MaBM = BM.MaBM
group by BM.TenBM

--Q29: Cho biết tên chủ đề và số lượng đề tài thuộc về chủ đề đó.
select CD.TenCD, Count(DT.MaDT) 'SLDT'
from ChuDe CD
left join DeTai DT on CD.MaCD = DT.MaCD
group by CD.TenCD

--Q30: Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó tham gia.
select GV.HoTen, Count(distinct TG.MaDT) 'SLDT'
from GiaoVien GV
left join ThamGiaDT TG on GV.MaGV = TG.MaGV
group by GV.HoTen

--Q31: Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiệm.
select GV.HoTen, Count(DT.MaDT)
from GiaoVien GV
left join DeTai DT on GV.MaGV = DT.GVCNDT
group by GV.HoTen

--Q32: Với mỗi giáo viên cho tên giáo viên và số người thân của giáo viên đó.
select GV.HoTen, Count(NT.MaGV) 'Số người thân'
from GiaoVien GV
left join NguoiThan NT on GV.MaGV = NT.MaGV
group by GV.HoTen

--Q33: Cho biết tên những giáo viên đã tham gia từ 3 đề tài trở lên
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
group by GV.HoTen
having Count(TG.MaDT) >= 3

--Q34: Cho biết số lượng giáo viên đã tham gia vào đề tài Ứng dụng hóa học xanh.
select Count(distinct GV.MaGV) 'Số GV Tham Gia'
from GiaoVien GV
join DeTai DT on DT.GVCNDT = GV.MaGV
where DT.TenDT = N'Ứng dụng hóa học xanh'
