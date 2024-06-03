--MSSV: 22120157
--Họ ten: Nguyễn Nam Khánh
--Lớp: 22cq06-N2
--Email: namkhanhto23@gmail.com
--Ngày làm bài: 28/03/2004


use DB_QLDeTai_22120157 

--Q1: Cho biết họ tên và mức lương của các giáo viên nữ. Sắp xếp tăng dần theo ngày sinh
select HoTen, Luong
from GiaoVien
where Phai = N'Nữ'
order by NgaySinh;

--Q2: Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%
select HoTen, Luong 'Lương trước', Luong * 1.1 'Lương sau'
from GiaoVien;

--Q3: Cho biết mã giáo viên có họ tên bắt đầu là "Nguyễn" và lương trên $2000 hoặc, giáo viên là trưởng
--bộ môn nhận chức sau 1995. Sắp xếp giảm dần theo lương, sau đó tăng dần theo mã bộ môn
select MaGV
from GiaoVien
where (HoTen like N'Nguyễn%' and Luong > 2000) 
		or MaGV in (
			select TruongBM
			from BoMon
			where year(NgayNhanChuc) > 1995
			)
order by Luong desc, MaBM asc;


--Q4: Cho biết những giáo viên thuộc bộ môn có mã "HTTT"
select *
from GiaoVien
where MaBM = 'HTTT';

--Q5: Cho biết mã giáo viên làm trưởng bộ có thân nhân
select GV.MaGV
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
where GV.MaGV IN (
	select MaGV
	from NguoiThan
);

--Q6: Cho biết mã đề tài nào chưa có giáo viên tham gia
select DT.MaDT
from DeTai DT
except
select TG.MaDT
from ThamGiaDT TG;


--Q7: Cho biết mã giáo viên có tham gia thực hiện đề tài nhưng không có thân nhân
select distinct GV.MaGV
from GiaoVien GV
join ThamGiaDT TG on GV.MaGV = TG.MaGV
except
select NT.MaGV
from NguoiThan NT;

--Q8: Cho biết mã giáo viên nào vừa làm trưởng bộ môn, vừa làm trưởng khoa
select GV.MaGV
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
join Khoa K on BM.TruongBM = K.TruongKhoa;
