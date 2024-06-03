--MSSV: 22120157
--Họ ten: Nguyễn Nam Khánh
--Lớp: 22cq06-N2
--Email: namkhanhto23@gmail.com
--Ngày làm bài: 28/03/2004

use DB_QLDeTai_22120157

select * from GiaoVien
--Q1: Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó
select BM.*, GV.*
from BoMon BM 
	join GiaoVien GV on BM.TruongBM = GV.MaGV;


--Q2: Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc
select GV.HoTen, BM.*
from GiaoVien GV
	left join BoMon BM on GV.MaBM = BM.MaBM;

--Q3: Cho biết tên đề tài và giáo viên chủ nhiệm đề tài
select DT.TenDT, GV.HoTen 'Giáo viên chủ nhiệm đề tài'
from DeTai DT
	join GiaoVien GV on DT.GVCNDT = GV.MaGV;


--Q4: Với mỗi khoa cho biết thông tin trưởng khoa
select K.TenKhoa, GV.*
from Khoa K
	left join GiaoVien GV on K.TruongKhoa = GV.MaGV;

--Q5: Cho biết các giáo viên của bộ môn 'Vi sinh' có tham gia đề tài 006
select distinct GV.HoTen
from GiaoVien GV
	join BoMon BM on GV.MaBM = BM.MaBM
	join ThamGiaDT TG on GV.MaGV = TG.MaGV
where BM.TenBM = N'Vi sinh' and TG.MaDT = '006';


--Q6: Với những đề tài thuộc cấp quản lý 'Thành phố', cho biết mã đề tài, đề tài thuộc về
--chủ đề nào, họ tên người chủ nhiệm đề tài cùng với ngày sinh và địa của chỉ người ấy
select DT.MaDT, CD.TenCD, GV.HoTen 'Chủ nhiệm đè tài', GV.NgaySinh, GV.DiaChi
from DeTai DT
	join ChuDe CD on DT.MaCD = CD.MaCD
	join GiaoVien GV on DT.GVCNDT = GV.MaGV
where DT.CapQL = N'Thành phố'


--Q7: Tìm họ tên của những giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên đó
select GV.HoTen 'Giáo viên', GVQLCM.HoTen 'Người phụ trách chuyên môn'
from GiaoVien GV
	left join GiaoVien GVQLCM on GV.GVQLCM = GVQLCM.MaGV


--Q8: Tìm họ tên của những giáo viên được "Nguyen Thanh Tung" phụ trách trực tiếp
select GV.HoTen 'Giáo viên', GVQLCM.HoTen 'Người phụ trách chuyên môn'
from GiaoVien GV
	left join GiaoVien GVQLCM on GVQLCM.MaGV = GV.GVQLCM
where GVQLCM.HoTen = 'Nguyen Thanh Tung'

--Q9: Cho biết tên giáo viên là trưởng bộ môn Hệ thống thông tin
select GV.HoTen
from GiaoVien GV
	join BoMon BM on BM.TruongBM = GV.MaGV
where BM.TenBM = N'Hệ thống thông tin'

--Q10: Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề Quản lý giáo dục
select GV.HoTen 'GVCNDT'
from DeTai DT
	join GiaoVien GV on DT.GVCNDT = GV.MaGV
	join ChuDe CD on DT.MaCD = CD.MaCD
where CD.TenCD = N'Quản lý giáo dục';


--Q11: Cho biết tên các công việc của đề tài HTTT quản lý các trường ĐH	
--có thời gian bắt đầu trong tháng 03/2008
select CV.TenCV
from CongViec CV
	join DeTai DT on CV.MaDT = DT.MaDT
where DT.TenDT = N'HTTT quản lý các trường ĐH' and month(CV.NgayBD) = 3 and year(CV.ngayBD) = 2008;


--Q12: Cho biết tên giáo viên và người quản lý chuyên môn của giáo viên đó
select GV.HoTen 'Tên GV', GVQLCM.HoTen 'GV quản lý chuyên môn'
from GiaoVien GV
	left join GiaoVien GVQLCM on GVQLCM.MaGV = GV.GVQLCM;

--Q13: Cho biết các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007
select TenCV, NgayBD, NgayKT
from CongViec
where NgayBD >= '01/01/2007' and NgayKT <= '01/08/2007';