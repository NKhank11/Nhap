--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2

use DB_QLPhim_22120157
	select * from Phim
	select * from TheLoai
	select * from DaoDien
	select * from DienVien
	select * from DongPhim

--Q1: Cho biết tên những bộ phim được sản xuất trong khoảng thời gian từ năm 2009 đến 2010
select TenPhim
from Phim
where NamSanXuat >= 2009 and NamSanXuat <= 2010;

--Q2: Cho biết tên những bộ phim mà có thời lượng > 120 phút
select TenPhim
from Phim
where DoDai > 120;

--Q3: Cho biết tên bộ phim và tên đạo diễn của những bộ phim được sản xuất trong năm 2008
select P.TenPhim, D.HoTen 'Tên đạo diễn'
from Phim P
join DaoDien D on P.MaDaoDien = D.MaDaoDien
where P.NamSanXuat = 2008;

--Q4: Cho biết tên phim, tên đạo diễn và tên thể loại của phim “Bình minh trên biển”
select P.TenPhim, D.HoTen 'Tên đạo diễn', T.TenTheloai
from Phim P
join DaoDien D on P.MaDaoDien = D.MaDaoDien
join TheLoai T on P.MaTheLoai = T.MaTheLoai
where P.TenPhim = N'Bình minh trên biển';

--Q5: Cho biết mã những thể loại phim mà chưa được sản xuất lần nào
select MaTheLoai
from TheLoai
except
select MaTheLoai
from Phim

--Q6: Cho biết mã và tên những thể loại phim chưa được sản xuất lần nào
select MaTheLoai, TenTheloai
from TheLoai
where MaTheLoai not in
	( 
		select MaTheLoai
		from Phim
	)

--Q7: Cho biết tên những diễn viên có địa chỉ tại thành phố “Hồ Chí Minh"
select HoTen
from DienVien
where DiaChi = N'Hồ Chí Minh';

--Q8:Cho biết tên diễn viên và tên thể loại sở trường của những diễn viên nữ
select DV.HoTen, T.TenTheloai 'Thể loại sở trường'
from DienVien DV
left join TheLoai T on DV.TheLoaiSoTruong = T.MaTheLoai
where DV.Phai = N'Nữ'

--Q9: Cho biết tên và địa chỉ của những diễn viên và đạo diễn có năm sinh trong khoảng 1970 đến 1980
select HoTen, DiaChi
from DienVien
where NamSinh >= 1970 and NamSinh <= 1980
union
select HoTen, DiaChi
from DaoDien
where NamSinh >= 1970 and NamSinh <= 1980;

--Q10: Cho biết mã diễn viên và thu nhập từ việc đóng phim của mỗi diễn viên
select MaDienVien, sum(SoGio * DonGia) 'Thu nhập'
from DongPhim
group by MaDienVien

--Q11: 