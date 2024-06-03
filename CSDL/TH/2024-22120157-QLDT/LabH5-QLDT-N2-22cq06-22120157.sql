--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 10/05/2024

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


--Q1: Cho biết tên giáo viên nào mà tham gia đề tài đủ các chủ đề
--Cách 1: group by + having
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
group by GV.MaGV, GV.HoTen
having count(distinct DT.MaCD) = (select count(distinct CD.MaCD)
								  from ChuDe CD);

								   
--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where not exists
 ( select CD.MaCD
   from ChuDe CD
   except
   select DT.MaCD
   from ThamGiaDT TG
   join DeTai DT on DT.MaDT = TG.MaDT
   where GV.MaGV = TG.MaGV)

--Cách 3: not exists + not exists
select GV.HoTen
from GiaoVien GV
where not exists
	( select *
	  from ChuDe CD
	  where not exists
	  ( select *
		from ThamGiaDT TG
		join DeTai DT on DT.MaDT = TG.MaDT
		where GV.MaGV = TG.MaGV and DT.MaCD = CD.TenCD
	  )
	 )


--Q2: Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn HTTT tham gia
--Cách 1: group by + having
select DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hệ thống thông tin'
group by DT.MaDT, DT.TenDT
having count(distinct GV.MaGV) = ( select count(GV.MaGV)
								   from GiaoVien GV
								   join BoMon BM on BM.MaBM = GV.MaBM
								   where BM.TenBM = N'Hệ thống thông tin')


--Cách 2: not exists + except
select distinct DT.TenDT
from DeTai DT 
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hệ thống thông tin' and not exists 
(
	select GV2.MaGV
	from GiaoVien GV2
	join BoMon BM2 on BM2.MaBM = GV2.MaBM
	where BM2.TenBM = BM.TenBM
	except
	select TG2.MaGV
	from ThamGiaDT TG2
	where TG2.MaDT = DT.MaDT
)

--Cách 3: not exists + not exists
select distinct DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hệ thống thông tin' and not exists
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.TenBM = N'Hệ thống thông tin' and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)


--Q3: Cho biết tên đề tài có tất cả giảng viên bộ môn 'Hệ thống thông tin' tham gia
--Cách 1: group by + having
select DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hệ thống thông tin'
group by DT.MaDT, DT.TenDT
having count(distinct GV.MaGV) = ( select count(GV.MaGV)
								   from GiaoVien GV
								   join BoMon BM on BM.MaBM = GV.MaBM
								   where BM.TenBM = N'Hệ thống thông tin')

--Cách 2: not exists + except
select DT.TenDT
from DeTai DT
where not exists 
(
	select GV.MaGV
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.TenBM = N'Hệ thống thông tin'
	except
	select TG.MaGV
	from ThamGiaDT TG
	join GiaoVien GV on GV.MaGV = TG.MaGV
	where TG.MaDT = DT.MaDT
)

--Cách 3: not exists + not exists
select DT.TenDT
from DeTai DT
where not exists
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.TenBM = N'Hệ thống thông tin' and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)

--Q4: Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD
--Cách 1: group by + having
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
join ChuDe CD on CD.MaCD = DT.MaCD
where CD.MaCD = 'QLGD'
group by GV.MaGV, GV.HoTen
having count(distinct DT.MaDT) = ( select count(CD.MaCD)
								   from ChuDe CD
								   join DeTai DT on DT.MaCD = CD.MaCD
								   where CD.MaCD = 'QLGD')

--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where not exists 
(
	select DT.MaDT
	from DeTai DT
	join ChuDe CD on CD.MaCD = DT.MaCD
	where CD.MaCD = 'QLGD'
	except
	select TG.MaDT
	from ThamGiaDT TG
	join DeTai DT2 on DT2.MaDT = TG.MaDT
	join ChuDe CD2 on CD2.MaCD = DT2.MaCD
	where TG.MaGV = GV.MaGV and CD2.MaCD = 'QLGD'
)

--Cách 3: not exists + not exists
select GV.HoTen
from GiaoVien GV 
where not exists
(
	select *
	from DeTai DT
	join ChuDe CD on CD.MaCD = DT.MaCD
	where CD.MaCD = 'QLGD' and not exists
	(
		select *
		from ThamGiaDT TG
		join DeTai DT2 on DT2.MaDT = TG.MaDT
		join ChuDe CD2 on CD2.MaCD = DT2.MaCD
		where TG.MaGV = GV.MaGV and DT.MaDT = DT2.MaDT
	)
)

--Q5: Cho biết giáo viên nào tham gia tất cả đề tài mà giáo viên Trần Trà Hương đã tham gia
--Cách 1: group by + having (đang lỗi)
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
WHERE GV.HoTen != N'Trần Trà Hương' and DT.MaDT in (
    SELECT TG2.MaDT
    FROM ThamGiaDT TG2
    JOIN GiaoVien GV2 ON GV2.MaGV = TG2.MaGV
    WHERE GV2.HoTen = N'Trần Trà Hương'
)
group by GV.MaGV, GV.HoTen
having count(distinct TG.MaDT) = (select count(TG2.MaDT)
						 from ThamGiaDT TG2
						 join GiaoVien GV2 on GV2.MaGV = TG2.MaGV
						 where GV2.HoTen = N'Trần Trà Hương')



--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where GV.HoTen != N'Trần Trà Hương' and not exists
(
	select TG1.MaDT
	from ThamGiaDT TG1
	join GiaoVien GV1 on GV1.MaGV = TG1.MaGV
	where GV1.HoTen = N'Trần Trà Hương'
	except
	select TG2.MaDT
	from ThamGiaDT TG2
	where TG2.MaGV = GV.MaGV 
)

--Cách 3: not exists + not exists
select GV.HoTen
from GiaoVien GV
where GV.HoTen != N'Trần Trà Hương' and not exists
(
	select *
	from ThamGiaDT TG1
	join GiaoVien GV1 on GV1.MaGV = TG1.MaGV
	where GV1.HoTen = N'Trần Trà Hương' and not exists
	(
		select *
		from ThamGiaDT TG2
		where TG2.MaGV = GV.MaGV and TG2.MaDT = TG1.MaDT
	)
)


--Q6: Cho biết tên đề tài nào mà được tất cả giáo viên của bộ môn Hóa Hữu Cơ tham gia
--Cách 1: group by + having
select DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hóa hữu cơ'
group by DT.MaDT, DT.TenDT
having count(distinct GV.MaGV) = ( select count(GV.MaGV)
								   from GiaoVien GV
								   join BoMon BM on BM.MaBM = GV.MaBM
								   where BM.TenBM = N'Hóa hữu cơ')


--Cách 2: not exists + except
select distinct DT.TenDT
from DeTai DT 
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hóa hữu cơ' and not exists 
(
	select GV2.MaGV
	from GiaoVien GV2
	join BoMon BM2 on BM2.MaBM = GV2.MaBM
	where BM2.TenBM = BM.TenBM
	except
	select TG2.MaGV
	from ThamGiaDT TG2
	where TG2.MaDT = DT.MaDT
)

--Cách 3: not exists + not exists
select distinct DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.TenBM = N'Hóa Hữu Cơ' and not exists
(
	select *
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.TenBM = N'Hóa Hữu Cơ' and not exists
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT
	)
)


--Q7: Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài 006
--Cách 1: group by + having
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join CongViec CV on CV.MaDT = TG.MaDT
join DeTai DT on DT.MaDT = TG.MaDT
where DT.MaDT = '006'
group by GV.MaGV, GV.HoTen
having count(distinct TG.SoTT) = ( select count(CV2.MaDT)
								   from CongViec CV2
								   join DeTai DT2 on DT2.MaDT = CV2.MaDT
								   where DT2.MaDT = '006'
								 )

--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where not exists
(
	select CV.MaDT, CV.SoTT
	from CongViec CV
	where CV.MaDT = '006'
	except 
	select TG.MaDT, TG.SoTT
	from ThamGiaDT TG
	where TG.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
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
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT and TG.SoTT = CV.SoTT
	)
)


--Q8: Cho biết giáo viên nào đã tham gia tất cả các đề tài của chủ đề Ứng dụng công nghệ
--C1: group by + having
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
join ChuDe CD on CD.MaCD = DT.MaCD
where CD.TenCD = N'Ứng dụng công nghệ'
group by GV.MaGV, GV.HoTen
having count(distinct DT.MaDT) = ( select count(DT.MaDT)
								   from DeTai DT
								   join ChuDe CD on CD.MaCD = DT.MaCD
								   where CD.TenCD = N'Ứng dụng công nghệ')

--C2: not exists + except
select GV.HoTen
from GiaoVien GV
where not exists 
(
	select DT.MaDT
	from DeTai DT
	join ChuDe CD on CD.MaCD = DT.MaCD
	where CD.TenCD = N'Ứng dụng công nghệ'
	except
	select TG2.MaDT
	from ThamGiaDT TG2
	where TG2.MaGV = GV.MaGV
)

--C3: not exists + not exists
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
--Cách 1: group by + having 
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
where GV.HoTen != N'Trần Trà Hương' 
and TG.MaDT IN ( select DT2.MaDT
				 from GiaoVien GV2
				 join DeTai DT2 on DT2.GVCNDT = GV2.MaGV
				 where GV2.HoTen = N'Trần Trà Hương'
			   )
group by GV.MaGV, GV.HoTen
having count(distinct TG.MaDT) = ( select count(distinct DT.MaDT)
						  from GiaoVien GV
						  join DeTai DT on DT.GVCNDT = GV.MaGV
						  where GV.HoTen = N'Trần Trà Hương')




--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where GV.HoTen != N'Trần Trà Hương'
and not exists
(
	select DT.MaDT
	from DeTai DT
	join GiaoVien GV2 on GV2.MaGV = DT.GVCNDT
	where GV2.HoTen = N'Trần Trà Hương'
	except
	select TG.MaDT
	from ThamGiaDT TG
	where TG.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
select GV.HoTen
from GiaoVien GV
where GV.HoTen != N'Trần Trà Hương'
and not exists
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
--Cách 1: group by + having
select DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
where BM.MaKhoa = 'CNTT'
group by DT.MaDT, DT.TenDT
having count(distinct GV.MaGV) = ( select count(GV.MaGV)
						  from GiaoVien GV
						  join BoMon BM on BM.MaBM = GV.MaBM
						  where BM.MaKhoa = 'CNTT')

--Cách 2: not exists + except
select DT.TenDT
from DeTai DT
where not exists
(
	select GV.MaGV
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.MaKhoa = 'CNTT'
	except
	select TG.MaGV
	from ThamGiaDT TG
	where TG.MaDT = DT.MaDT
)

--Cách 3: not exists + not exists
select DT.TenDT
from DeTai DT
where not exists
(
	select GV.MaBM
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where BM.MaKhoa = 'CNTT'
	and not exists
	(
		select TG.MaGV
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)


--Q11: Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài Nghiên cứu tế bào gốc
--Cách 1: group by + having
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join CongViec CV on CV.MaDT = TG.MaDT
join DeTai DT on DT.MaDT = TG.MaDT
where DT.TenDT = N'Nghiên cứu tế bào gốc'
group by GV.MaGV, GV.HoTen
having count(distinct TG.SoTT) = ( select count(CV2.MaDT)
								   from CongViec CV2
								   join DeTai DT2 on DT2.MaDT = CV2.MaDT
								   where DT2.TenDT = N'Nghiên cứu tế bào gốc'
								 )
 
--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where not exists
(
	select CV.MaDT, CV.SoTT
	from CongViec CV
	join DeTai DT on DT.MaDT = CV.MaDT
	where DT.TenDT = N'Nghiên cứu tế bào gốc'
	except
	select TG.MaDT, TG.SoTT
	from ThamGiaDT TG 
	where TG.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
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
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT and TG.SoTT = CV.SoTT
	)
)


--Q12: Tìm tên các giáo viên được phân công làm tất cả các đề tài có kinh phí trên 100 triệu
--Cách 1: group by + having
select GV.HoTen
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
where DT.KinhPhi > 100
group by GV.MaGV, GV.HoTen
having count(distinct DT.MaDT) = ( select count(MaDT)
				   from DeTai
				   where KinhPhi > 100)


--Cách 2: not exists + except
select GV.HoTen
from GiaoVien GV
where not exists 
(
	select DT.MaDT
	from DeTai DT
	where DT.KinhPhi > 100
	except
	select TG.MaDT
	from ThamGiaDT TG
	where TG.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
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
--Cách 1: group by + having
select DT.TenDT
from DeTai DT
join ThamGiaDT TG on TG.MaDT = DT.MaDT
join GiaoVien GV on GV.MaGV = TG.MaGV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
where K.TenKhoa = N'Sinh học'
group by DT.MaDT, DT.TenDT
having count(distinct GV.MaGV) = ( select count(GV.MaGV)
						  from GiaoVien GV
						  join BoMon BM on BM.MaBM = GV.MaBM
						  join Khoa K on K.MaKhoa = BM.MaKhoa
						  where K.TenKhoa = N'Sinh học')

--Cách 2: not exists + except
select DT.TenDT
from DeTai DT
where not exists
(
	select GV.MaGV
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	join Khoa K on K.MaKhoa = BM.MaKhoa
	where K.TenKhoa = N'Sinh học'
	except
	select TG.MaGV
	from ThamGiaDT TG
	where TG.MaDT = DT.MaDT
)

--Cách 3: not exists + not exists
select DT.TenDT
from DeTai DT
where not exists
(
	select GV.MaBM
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	join Khoa K on K.MaKhoa = BM.MaKhoa
	where K.TenKhoa = N'Sinh học'
	and not exists
	(
		select TG.MaGV
		from ThamGiaDT TG
		where TG.MaDT = DT.MaDT and TG.MaGV = GV.MaGV
	)
)


--Q14:Cho biết mã số, họ tên, ngày sinh của giáo viên tham gia tất cả các công việc của đề tài 'Ứng dụng hóa học xanh'
--Cách 1: group by + having
select GV.MaGV, GV.HoTen, GV.NgaySinh
from GiaoVien GV
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
join CongViec CV on CV.MaDT = DT.MaDT
where DT.TenDT = N'Ứng dụng hóa học xanh'
group by GV.MaGV, GV.HoTen, GV.NgaySinh
having count(distinct TG.SoTT) = ( select count(CV.SoTT)  --hoặc count(CV.MaDT) cũng được
				   from CongViec CV
				   join DeTai DT on DT.MaDT = CV.MaDT
				   where DT.TenDT = N'Ứng dụng hóa học xanh'
				 )

--Cách 2: not exists + except
select GV.MaGV, GV.HoTen, GV.NgaySinh
from GiaoVien GV
where not exists
(
	select CV.MaDT, CV.SoTT
	from CongViec CV
	join DeTai DT on DT.MaDT = CV.MaDT
	where DT.TenDT = N'Ứng dụng hóa học xanh'
	except
	select TG.MaDT, TG.SoTT
	from ThamGiaDT TG 
	where TG.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
select GV.MaGV, GV.HoTen, GV.NgaySinh
from GiaoVien GV
where not exists 
(
	select *
	from CongViec CV
	join DeTai DT on DT.MaDT = CV.MaDT
	where DT.TenDT = N'Ứng dụng hóa học xanh'
	and not exists 
	(
		select *
		from ThamGiaDT TG
		where TG.MaGV = GV.MaGV and TG.MaDT = DT.MaDT and TG.SoTT = CV.SoTT
	)
)


--Q15: Cho biết mã số, tên bộ môn và tên người quản lý chuyên môn của giáo viên tham gia tất cả các đề tài
--thuộc chủ đề 'Nghiên cứu phát triển'

--Cách 1: group by + having
select GV.MaGV, BM.TenBM, GVQLCM.HoTen, count(distinct DT.MaDT)
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join GiaoVien GVQLCM on GVQLCM.MaGV = GV.GVQLCM
join ThamGiaDT TG on TG.MaGV = GV.MaGV
join DeTai DT on DT.MaDT = TG.MaDT
join ChuDe CD on CD.MaCD = DT.MaCD
where CD.TenCD = N'Nghiên cứu phát triển'
group by GV.MaGV, BM.TenBM, GVQLCM.HoTen
having count(distinct DT.MaDT) = ( select count(DT.MaDT)
				   from DeTai DT
				   join ChuDe CD on CD.MaCD = DT.MaCD
				   where CD.TenCD = N'Nghiên cứu phát triển'
			      )

--Cách 2: not exists + except
select GV.MaGV, BM.TenBM, GVQLCM.HoTen
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join GiaoVien GVQLCM on GVQLCM.MaGV = GV.GVQLCM
where not exists
(
	select DT.MaDT
	from DeTai DT 
	join ChuDe CD on CD.MaCD = DT.MaCD
	where CD.TenCD = N'Nghiên cứu phát triển'
	except
	select TG.MaDT
	from ThamGiaDT TG
	where TG.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
select GV.MaGV, BM.TenBM, GVQLCM.HoTen
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

--Cách 1: group by + having
select GV.HoTen, GV.NgaySinh, K.TenKhoa, TrgKhoa.HoTen 'Truong khoa'
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
join GiaoVien TrgKhoa on TrgKhoa.MaGV = K.TruongKhoa
join ThamGiaDT TG on TG.MaGV = GV.MaGV
where GV.HoTen != N'Nguyễn Hoài An'
and TG.MaDT IN ( select TG2.MaDT
				 from ThamGiaDT TG2
				 join GiaoVien GV2 on GV2.MaGV = TG2.MaGV
				 where GV2.HoTen = N'Nguyễn Hoài An'
			   )
group by GV.MaGV, GV.HoTen, GV.NgaySinh, K.TenKhoa, TrgKhoa.HoTen
having count(distinct TG.MaDT) = ( select count(distinct TG2.MaDT)
								   from ThamGiaDT TG2
								   join GiaoVien GV2 on GV2.MaGV = TG2.MaGV
								   where GV2.HoTen = N'Nguyễn Hoài An'
							      )

--Cách 2: not exists + except
select distinct GV.HoTen, GV.NgaySinh, K.TenKhoa, TrgKhoa.HoTen 'Truong khoa'
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
join GiaoVien TrgKhoa on TrgKhoa.MaGV = K.TruongKhoa
join ThamGiaDT TG on TG.MaGV = GV.MaGV
where GV.HoTen != N'Nguyễn Hoài An'
and not exists 
(
	select DT.MaDT
	from DeTai DT
	join ThamGiaDT TG1 on TG1.MaDT = DT.MaDT
	join GiaoVien GV1 on GV1.MaGV = TG1.MaGV
	where GV1.HoTen = N'Nguyễn Hoài An'
	except
	select TG2.MaDT
	from ThamGiaDT TG2
	where TG2.MaGV = GV.MaGV
)

--Cách 3: not exists + not exists
select distinct GV.HoTen, GV.NgaySinh, K.TenKhoa, TrgKhoa.HoTen 'Truong khoa'
from GiaoVien GV
join BoMon BM on BM.MaBM = GV.MaBM
join Khoa K on K.MaKhoa = BM.MaKhoa
join GiaoVien TrgKhoa on TrgKhoa.MaGV = K.TruongKhoa
join ThamGiaDT TG on TG.MaGV = GV.MaGV
where GV.HoTen != N'Nguyễn Hoài An'
and not exists
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