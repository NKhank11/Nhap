--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2

use DB_QLDeTai_22120157

/*
select * from GiaoVien
select * from GV_DT
select * from BoMon
select * from Khoa
select * from DeTai
select * from ChuDe
select * from CongViec
select * from ThamGiaDT
select * from NguoiThan
*/

--Q1. Cho	biết	họ tên	và	mức	lương	của	các	giáo	viên	nữ
select HoTen, Luong
from GiaoVien
where Phai = N'Nữ';

--Q2. Cho	biết	họ tên	của	các	giáo	viên	và	lương	của	họ sau	khi	tăng	10%.
select HoTen, Luong 'Lương trước', Luong * 1.1 'Lương sau'
from GiaoVien;
--Q3. Cho	biết	mã	của	các	giáo	viên	có	họ tên	bắt	đầu	là	“Nguyễn”	và	lương	trên	$2000	hoặc,	
--giáo	viên	là	trưởng	bộ môn	nhận	chức	sau	năm	1995
select MaGV
from GiaoVien
where HoTen like 'Nguyễn%' and Luong > 2000
union
select TruongBM
from BoMon
where year(NgayNhanChuc) > 1995;

--Q4. Cho	biết	tên	những	giáo viên	khoa	Công	nghệ thông	tin.
select GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaBM = BM.MaBM
join Khoa K on BM.MaKhoa = K.MaKhoa
where K.TenKhoa = N'Công nghệ thông tin';

--Q5. Cho	biết	thông	tin	của	bộ môn	cùng	thông	tin	giảng	viên	làm	trưởng	bộ môn	đó.
select BM.*, GV.*
from BoMon BM
join GiaoVien GV on BM.TruongBM = GV.MaGV;

--Q6. Với	mỗi	giáo	viên,	hãy	cho	biết	thông	tin	của	bộ môn	mà	họ đang	làm	việc
select GV.HoTen, BM.*
from GiaoVien GV
left join BoMon BM on GV.MaBM = BM.MaBM;

--Q7. Cho	biết	tên	đề tài	và	giáo	viên	chủ nhiệm	đề tài.
select DT.TenDT, GV.HoTen 'GVCNDT'
from DeTai DT
join GiaoVien GV on DT.GVCNDT = GV.MaGV;

--Q8. Với	mỗi	khoa	cho	biết thông	tin	trưởng	khoa.
select K.MaKhoa, K.TenKhoa, GV.*
from Khoa K
left join GiaoVien GV on K.TruongKhoa = GV.MaGV;

--Q9. Cho	biết	các	giáo	viên	của	bộ môn	“Vi	sinh”	có	tham	gia	đề tài	006
select distinct GV.*
from GiaoVien GV
join BoMon BM on GV.MaBM = BM.MaBM
join ThamGiaDT TG on GV.MaGV = TG.MaGV
where BM.TenBM = N'Vi sinh' and TG.MaDT = '006';

--Q10. Với	những	đề tài	thuộc	cấp	quản	lý	“Thành	phố”,	cho	biết	mã	đề tài,	đề tài	thuộc	về chủ
--đề nào,	họ tên	người	chủ nghiệm	đề tài	cùng	với	ngày	sinh	và	địa	chỉ của	người	ấy.
select DT.MaDT, CD.TenCD, GV.HoTen 'GVCNDT', GV.NgaySinh, GV.DiaChi
from DeTai DT
join ChuDe CD on DT.MaCD = CD.MaCD
join GiaoVien GV on DT.GVCNDT = GV.MaGV
where DT.CapQL = N'Thành phố';

--Q11. Tìm	họ tên	của	từng	giáo	viên	và	người	phụ trách	chuyên	môn	trực	tiếp	của	giáo	viên	
--đó.
select GV.HoTen, GVQLCM.HoTen 'Phụ trách chuyên môn'
from GiaoVien GV
join GiaoVien GVQLCM on GV.GVQLCM = GVQLCM.MaGV;

--Q12. Tìm	họ tên	của	những	giáo	viên	được	“Nguyễn	Thanh	Tùng”	phụ trách	trực	tiếp
select GV.HoTen
from GiaoVien GV
join GiaoVien GVQLCM on GV.GVQLCM = GVQLCM.MaGV
where GVQLCM.HoTen = N'Nguyễn Thanh Tùng';

--Q13. Cho	biết	tên	giáo	viên	là	trưởng	bộ môn	“Hệ thống	thông	tin”
select GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
where BM.TenBM = N'Hệ thống thông tin';

--Q14. Cho	biết	tên	người	chủ nhiệm	đề tài	của	những	đề tài	thuộc	chủ đề Quản	lý	giáo	dục
select distinct GV.HoTen
from GiaoVien GV
join DeTai DT on GV.MaGV = DT.GVCNDT
join ChuDe CD on DT.MaCD = CD.MaCD
where CD.TenCD = N'Quản lý giáo dục';

--Q15. Cho	biết	tên	các	công	việc	của	đề tài	HTTT	quản	lý	các	trường	ĐH	có	thời	gian	bắt	đầu	
--trong	tháng	3/2008.
select CV.TenCV
from CongViec CV
join DeTai DT on CV.MaDT = DT.MaDT
where DT.TenDT = N'HTTT quản lý các trường ĐH' and month(CV.NgayBD) = 3 and year(CV.NgayBD) = 2008;

--Q16. Cho	biết	tên	giáo	viên	và	tên	người	quản	lý	chuyên	môn	của	giáo	viên	đó
select GV.HoTen, GVQLCM.HoTen 'Quản lý chuyên môn'
from GiaoVien GV
join GiaoVien GVQLCM on GV.GVQLCM = GVQLCM.MaGV;

--Q17. Cho	các	công	việc	bắt	đầu	trong	khoảng	từ 01/01/2007	đến	01/08/2007.
select TenCV
from CongViec
where NgayBD > '01/01/2007' and NgayKT < '08/01/2007';

--Q18. Cho	biết	họ tên	các	giáo	viên	cùng	bộ môn	với	giáo	viên	“Trần	Trà	Hương”.
select GV.HoTen, BM.TenBM
from GiaoVien GV
join BoMon BM on GV.MaBM = BM.MaBM
where GV.HoTen <> N'Trần Trà Hương' and exists (
	select *
	from GiaoVien GV2
	where GV2.HoTen = N'Trần Trà Hương' and GV2.MaBM = GV.MaBM
	)
		
--Q19. Tìm	những	giáo	viên	vừa	là	trưởng	bộ môn	vừa	chủ nhiệm	đề tài.
select distinct GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
join DeTai DT on GV.MaGV = DT.GVCNDT;


--Q20. Cho	biết	tên	những	giáo	viên	vừa	là	trưởng	khoa	và	vừa	là	trưởng	bộ môn.
select distinct GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
join Khoa K on GV.MaGV = K.TruongKhoa;

--Q21. Cho	biết	tên	những	trưởng	bộ môn	mà	vừa	chủ nhiệm	đề tài.
select distinct GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
join DeTai DT on GV.MaGV = DT.GVCNDT;

--Q22. Cho	biết	mã	số các	trưởng	khoa	có	chủ nhiệm	đề tài.
select distinct K.TruongKhoa
from Khoa K
join DeTai DT on K.TruongKhoa = DT.GVCNDT;

--Q23. Cho	biết	mã	số các	giáo	viên	thuộc	bộ môn	“HTTT” hoặc	có	tham	gia	đề tài	mã	“001”.
select MaGV
from GiaoVien 
where MaBM = 'HTTT'
union 
select MaGV
from ThamGiaDT
where MaDT = '001';

--Q24. Cho	biết	giáo	viên	làm	việc	cùng	bộ môn	với	giáo	viên	002.
select GV.HoTen, GV.MaBM
from GiaoVien GV
where GV.MaGV <> '002' and exists
			(
				select *
				from GiaoVien GV2
				where GV.MaBM = GV2.MaBM and GV2.MaGV = '002'
			);

--Q25. Tìm	những	giáo	viên	là	trưởng	bộ môn.
select GV.*
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM;

--Q26. Cho	biết	họ tên	và	mức	lương	của	các	giáo	viên
select HoTen, Luong
from GiaoVien
