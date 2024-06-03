--Ôn tập phép chia: viết theo kiểu not exists + not exists
use DB_QLDeTai_22120157

--File bài tập lab H5 thầy Minh

--Q1: Cho biết tên giáo viên nào mà tham gia đề tài đủ các chủ đề
select GV.HoTen
from GiaoVien GV
where not exists
(
	select *
	from DeTai DT
	join ChuDe CD on CD.MaCD = DT.MaCD
	where not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)


--Q2: Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn HTTT tham gia
select DT.TenDT
from DeTai DT
where not exists
(
	select *
	from GiaoVien GV
	where GV.MaBM = 'HTTT'
	and not exists 
	(
		select *
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)

--Q3: Cho biết tên đề tài có tất cả giảng viên bộ môn 'Hệ thống thông tin' tham gia
select DT.TenDT
from DeTai DT
where not exists
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.TenBM = N'Hệ thống thông tin'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)

--Q4: Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD
select GV.HoTen
from GiaoVien GV
where not exists 
(
	select *
	from DeTai DT
	where DT.MaCD = 'QLGD'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)

--Q5: Cho biết giáo viên nào tham gia tất cả đề tài mà giáo viên Trần Trà Hương đã tham gia
select GV.HoTen
from GiaoVien GV
where GV.HoTen != N'Trần Trà Hương'
and not exists
(
	select *
	from GiaoVien GV1
	join ThamGiaDT TG1 on TG1.MaGV = GV1.MaGV
	where GV1.HoTen = N'Trần Trà Hương'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = TG1.MaDT
	)
)

--Q6: Cho biết tên đề tài nào mà được tất cả giáo viên của bộ môn Hóa Hữu Cơ tham gia
select DT.TenDT
from DeTai DT
where not exists
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.TenBM = N'Hóa hữu cơ'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)

--Q7: Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài 006
select GV.HoTen
from GiaoVien GV
where not exists
(
	select *
	from CongViec CV
	join DeTai DT on DT.MaDT = CV.MaDT
	where DT.MaDT = '006'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = CV.MaDT and TG.SoTT = CV.SoTT
	)
)

--Q8: Cho biết giáo viên nào đã tham gia tất cả các đề tài của chủ đề Ứng dụng công nghệ
select GV.HoTen
from GiaoVien GV
where not exists
(
	select *
	from DeTai DT
	join ChuDe CD on CD.MaCD = DT.MaCD
	where CD.TenCD = N'Ứng dụng công nghệ'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)


--Q9: Cho biết tên giáo viên nào đã tham gia tất cả các đề tài do Trần Trà Hương làm chủ nhiệm
select GV.HoTen
from GiaoVien GV
where not exists
(
	select *
	from DeTai DT
	join GiaoVien GV2 on GV2.MaGV = DT.GVCNDT
	where GV2.HoTen = N'Trần Trà Hương'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)

--Q10: Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa CNTT tham gia
select DT.TenDT
from DeTai DT
where not exists
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.MaKhoa = 'CNTT'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)

--Q11: Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài Nghiên cứu tế bào gốc
select GV.HoTen
from GiaoVien GV
where not exists
(
	select *
	from CongViec CV
	join DeTai DT on DT.MaDT = CV.MaDT
	where DT.TenDT = N'Nghiên cứu tế bào gốc'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = CV.MaDT and TG.SoTT = CV.SoTT
	)
)


--Q12: Tìm tên các giáo viên được phân công làm tất cả các đề tài có kinh phí trên 100 triệu
select GV.HoTen
from GiaoVien GV
where not exists 
(
	select *
	from DeTai DT
	where DT.KinhPhi > 100
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)

--Q13: Cho biết tên đề tài nào được tất cả giáo viên của khoa Sinh học tham gia
select DT.TenDT
from DeTai DT
where not exists 
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	join Khoa K on K.MaKhoa = BM.MaKhoa
	where K.TenKhoa = N'Sinh học'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)

--Q14: Cho biết mã số, họ tên, ngày sinh của giáo viên tham gia tất cả các công việc của đề tài 'Ứng dụng hóa học xanh'
select GV.MaGV, GV.HoTen, GV.NgaySinh
from GiaoVien GV
where not exists
(
	select *
	from DeTai DT
	join CongViec CV on CV.MaDT = DT.MaDT
	where DT.TenDT = N'Ứng dụng hóa học xanh'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = CV.MaDT and TG.SoTT = CV.SoTT
	)
)


--Q15: Cho biết mã số, tên bộ môn và tên người quản lý chuyên môn của giáo viên tham gia tất cả các đề tài
--thuộc chủ đề 'Nghiên cứu phát triển'
select GV.MaGV, GV.HoTen, BM.TenBM
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join GiaoVien GVQLCM on GVQLCM.MaGV = GV.GVQLCM
where not exists
(
	select *
	from DeTai DT
	join ChuDe CD on CD.MaCD = DT.MaCD
	where CD.TenCD = N'Nghiên cứu phát triển'
	and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)



--Q16: Cho biết họ tên, ngày sinh, tên khoa, tên trưởng khoa của giáo viên tham gia 
--tất cả các đề tài có giáo viên 'Nguyễn Hoài An' tham gia
select GV.HoTen, GV.NgaySinh, K.TenKhoa, TrgKhoa.HoTen 'Truong Khoa'
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
join GiaoVien TrgKhoa on TrgKhoa.MaGV = K.TruongKhoa
where GV.HoTen != N'Nguyễn Hoài An' and not exists
(
	select *
	from DeTai DT 
	join ThamGiaDT TG1 on TG1.MaDT = DT.MaDT
	join GiaoVien GV1 on GV1.MaGV = TG1.MaGV
	where GV1.HoTen = N'Nguyễn Hoài An'
	and not exists
	(
		select *
		from ThamGiaDT TG2
		where TG2.MaGV = GV.MaGV and TG2.MaDT = TG1.MaDT
	)
)



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