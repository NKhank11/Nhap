use DB_QLDeTai_22120157

select * from GiaoVien
select * from GV_DT
select * from BoMon
select * from NguoiThan
select * from Khoa
select * from ChuDe
select * from DeTai
select * from CongViec
select * from ThamGiaDT
--Q1
select HoTen 'Họ và tên', Luong 'Lương'
from GiaoVien
where Phai = N'Nữ';

--Q2
select HoTen 'Họ và tên', Luong 'Lương trước', Luong * 1.1 'Lương sau'
from GiaoVien

--Q3
select MaGV
from GiaoVien
where HoTen = N'Nguyễn%' and Luong > 2000
union
select TruongBM
from BoMon
where year(NgayNhanChuc) > 1995

--Q4
select GV.MaGV, GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaBM = BM.MaBM
join Khoa K on BM.MaKhoa = K.MaKhoa
where K.TenKhoa = N'Công nghệ thông tin';

--Q4 C2
SELECT GV.MaGV, GV.HoTen
FROM GiaoVien GV
JOIN BoMon BM ON GV.MaBM = BM.MaBM
WHERE BM.MaKhoa IN (
    SELECT MaKhoa
    FROM Khoa
    WHERE TenKhoa = N'Công nghệ thông tin'
);


--Q5
select BM.MaBM, BM.TenBM, GV.MaGV, GV.HoTen 'Trưởng bộ môn'
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM

--Q6
select GV.MaGV, GV.HoTen, BM.MaBM, BM.TenBM
from GiaoVien GV
join BoMon BM on GV.MaBM = BM.MaBM

--Q7
select DT.TenDT, GV.HoTen 'GVCNDT'
from GiaoVien GV
join DeTai DT on GV.MaGV = DT.GVCNDT;

--Q8
select K.TenKhoa, GV.HoTen 'Trưởng khoa'
from GiaoVien GV
join Khoa K on GV.MaGV = K.TruongKhoa;


--Q9
select GV.HoTen, BM.TenBM, TGDT.MaDT
from GiaoVien GV
join BoMon BM on GV.MaBM = BM.MaBM
join ThamGiaDT TGDT on TGDT.MaGV = GV.MaGV
where BM.TenBM = N'Vi sinh' and TGDT.MaDT = '006';


--Q10: Chữ "Thành phố" có vẻ sai
select DT.MaDT, CD.TenCD, GV.HoTen 'GVCNDT', GV.NgaySinh, GV.DiaChi
from DeTai DT
join GiaoVien GV on DT.GVCNDT = GV.MaGV
join ChuDe CD on CD.MaCD = DT.MaCD
where DT.CapQL = N'Trường';


--Q11: (Sử dụng left join nếu muôn hiển thị cả NULL)
select GV.HoTen 'Giáo viên', GVQLCM.HoTen 'Người phụ trách trực tiếp'
from GiaoVien GV
join GiaoVien GVQLCM on GV.GVQLCM = GVQLCM.MaGV;

--Q12: Đổi ddkien tên gvien
select GV.HoTen 'Giáo viên', GVQLCM.HoTen 'Người phụ trách trực tiếp'
from GiaoVien GV
join GiaoVien GVQLCM on GV.GVQLCM = GVQLCM.MaGV
where GVQLCM.HoTen = N'Nguyễn Hoài An';

--Q13
select GV.HoTen
from GiaoVien GV
join BoMon BM on GV.MaGV = BM.TruongBM
where BM.TenBM = N'Hệ thống thông tin';

--Q14
select GV.HoTen 'GVCNDT', CD.TenCD 
from DeTai DT
join GiaoVien GV on DT.GVCNDT = GV.MaGV
join ChuDe CD on DT.MaCD = CD.MaCD
where CD.TenCD = N'Quản lý giáo dục';

--Q15: Đổi lại ngày
select CV.TenCV, DT.TenDT, DT.NgayBD
from CongViec CV
join DeTai DT on CV.MaDT = DT.MaDT
where month(DT.NgayBD) = 10 and year(DT.NgayBD) = 2007 and DT.TenDT = N'HTTT quản lý các trường ĐH'