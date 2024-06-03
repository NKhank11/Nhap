--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 23/05/2024

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

--Câu 1: Tên trigger tg_22120157_R1: Tên đề tài phải duy nhất
create trigger tg_22120157_R1
on DeTai
for insert, update
as
begin
	if exists
	(
		select *
		from inserted i
		join DeTai DT on DT.TenDT = i.TenDT and DT.MaDT != i.MaDT
	)
	begin
		raiserror(N'Lỗi: Tên đề tài phải là duy nhất', 16, 1)
		rollback;
	end
end


--drop trigger tg_22120157_R1

--Kiểm tra
/*Check
--insert
	insert into DeTai(MaDT, TenDT, KinhPhi, CapQL, NgayBD, NgayKT, MaCD, GVCNDT)
	values('011', N'HTTT quản lý các trường ĐH', 20, N'ĐHQG', '11/22/1988', '03/04/1989', 'QLGD', null);
--update
	update DeTai
	set TenDT = N'HTTT quản lý các trường ĐH'
	where MaDT = '003'
	

*/

--Câu 2: Tên trigger tg_22120157_R2: Trưởng bộ môn phải sinh trước 1975
create trigger tg_22120157_R2
on GiaoVien	
for update
as
begin
	if exists
	(
		select *
		from BoMon BM, inserted I
		where BM.TruongBM = I.MaGV and year(I.NgaySinh) >= 1975
	)
	begin
		raiserror(N'Lỗi: Trưởng bộ môn phải sinh trước 1975', 16, 1)
		rollback
	end
end

--drop trigger tg_22120157_R2

/*Check
--update
	update GiaoVien
	set NgaySinh='02/01/1976'
	where MaGV='001'
*/


--Câu 3: Tên trigger tg_22120157_R3: Một bộ môn có tối thiểu 3 giáo viên nữ
create trigger tg_22120157_R3
on GiaoVien
for insert, update
as
begin
	declare @soGiaoVienNu int;
	declare @MaBM nvarchar(50);

	--Lấy MaBM
	select @MaBM = MaBM from inserted

	--Tính số lượng giáo viên nữ trong bộ môn
	select @soGiaoVienNu = count(*)
	from GiaoVien
	where MaBM = @MaBM and Phai = N'Nữ'

	--Kiểm tra
	if @soGiaoVienNu < 3
	begin
		raiserror(N'Lỗi: Bộ môn phải có tối thiểu 3 giáo viên nữ', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_R3

/*Check
--insert
	insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
		values('011', N'Nguyễn Văn A', null, N'Nam', null, null, null, 'HTTT')

--update
	update GiaoVien
	set MaBM = 'HTTT'
	where MaGV = '004'
*/


--Câu 4: Tên trigger tg_22120157_R4: Một giáo viên phải có ít nhất 1 số điện thoại (đang sai)
create trigger tg_22120157_R4
on GV_DT
for delete
as
begin
	declare @MaGV nvarchar(10);

	select @MaGV = MaGV
	from deleted;
	
	if not exists
	(
		select *
		from GV_DT
		where MaGV = @MaGV
	)
	begin
		raiserror(N'Lỗi: Mỗi gv phải có ít nhất 1 sdt', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R4

/*Check
--delete
	delete from GV_DT where MaGV = '002'
*/


--Câu 5: Tên trigger tg_22120157_R5: Một giáo viên phải có tối đa 3 số điện thoại
create trigger tg_22120157_R5
on GV_DT
for insert
as
begin
	if exists
	(
		select *
		from inserted I
		join GV_DT GDT on GDT.MaGV = I.MaGV
		group by I.MaGV
		having count(GDT.DienThoai) > 3
	)
	begin
		raiserror(N'Lỗi: Mỗi gv chỉ được có tối đa 3 sdt', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R5
/*
	INSERT INTO GV_DT (MaGV, DienThoai)
	VALUES ('001', '0123456759');

	INSERT INTO GV_DT (MaGV, DienThoai)
	VALUES ('001', '0987654351');

*/


--Câu 6: Tên trigger tg_22120157_R6: Một bộ môn phải có tối thiểu 4 giáo viên
create trigger tg_22120157_R6
on GiaoVien
for insert, update
as
begin
	declare @MaBM nvarchar(10);

	--Lấy MaBM
	select @MaBM = MaBM
	from inserted

	--Kiểm tra
	if exists
	(
		select *
		from GiaoVien
		where MaBM = @MaBM
		group by MaBM
		having count(*) < 4
	)
	begin
		raiserror(N'Lỗi: Bộ môn phải có tối thiêu 4 giáo viên', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R6
/*
--insert
	insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
		values('011', N'Nguyễn Văn A', null, N'Nam', null, null, null, 'HTTT')

		--delete from GiaoVien where MaGV = '011'
--update
	update GiaoVien
	set MaBM = 'VS'
	where MaGV = '004'

*/



--Câu 7: Tên trigger tg_22120157_R7: Trưởng bộ môn phải là người lớn tuổi nhất trong bộ môn
create trigger tg_22120157_R7
on GiaoVien
for update
as
begin
	--Lấy MaBM
	declare @MaBM nvarchar(10);
	select @MaBM = MaBM
	from inserted

	if exists
	(
		select *
		from BoMon BM
		join inserted I on I.MaGV = BM.TruongBM
		where not exists
		(
			select *
			from GiaoVien GV
			where GV.MaBM = BM.MaBM
			and GV.MaGV <> BM.TruongBM
			and GV.NgaySinh > I.NgaySinh
		)
	)
	begin
		raiserror(N'Lỗi: Trưởng bộ môn phải là người lớn tuổi nhất trong bộ môn', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_R7

/*
--update
	update GiaoVien
	set NgaySinh = '02/01/1980'
	where MaGV = '002'
*/


--Câu 8: Tên trigger tg_22120157_R8: Nếu giáo viên đã là trưởng bộ môn thì giáo viên đó không làm người quản lý chuyên môn (đang sai)
create trigger tg_22120157_R8
on GiaoVien
for insert, update
as
begin
	declare @MaGV nvarchar(10);

	select @MaGV = MaGV
	from inserted
	
	if exists
	(
		select *
		from BoMon BM
		where BM.TruongBM = @MaGV
		and exists
		(
			select *
			from GiaoVien GV
			where GV.GVQLCM = @MaGV
		)
	)

	begin
		raiserror(N'Lỗi: Nếu giáo viên đã là trưởng bộ môn thì giáo viên đó không làm người quản lý chuyên môn', 16, 1);
		rollback;		
	end
end

--drop trigger tg_22120157_R8
/*
--update
	update GiaoVien
	set GVQLCM = '002'
	where MaGV = '009'

*/


--Câu 9: Tên trigger tg_22120157_R9: Giáo viên và giáo viên quản lý chuyên môn của giáo viên đó phải thuộc cùng bộ môn
create trigger tg_22120157_R9
on GiaoVien
for insert, update
as
begin
	if exists
	(
		select *
		from inserted I
		join GiaoVien GV on GV.MaGV = I.GVQLCM
		where I.MaBM != GV.MaBM
	)
	begin
		raiserror(N'Lỗi: Giáo viên và giáo viên quản lý chuyên môn của giáo viên đó phải thuộc cùng bộ môn', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_R9

/*
--insert
	insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
		values('011', N'Nguyễn Văn A', null, N'Nam', null, null, '002', 'MMT')
	--delete from GiaoVien where MaGV = '011'
--update
	update GiaoVien
	set MaBM = 'MMT'
	where MaGV = '003'

*/


--Câu 10: Tên trigger tg_22120157_10: Mỗi giáo viên chỉ có tối đa 1 vợ chồng
create trigger tg_22120157_10
on NguoiThan
for insert, update
as
begin
	declare @MaGV nvarchar(10);
	declare @SoVoChong int;

	--Lấy MaGV từ bảng inserted
	select @MaGV = MaGV
	from inserted

	--Đếm
	select @SoVoChong = count(*)
	from NguoiThan
	where MaGV=@MaGV and QuanHe in (N'Vợ', N'Chồng');

	if @SoVoChong > 1
	begin
		raiserror(N'Lỗi: Mỗi giáo viên chỉ có tối đa 1 vợ hoặc 1 chồng', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_10

/*
--insert
	insert into NguoiThan(MaGV,	Ten, NgaySinh, Phai, QuanHe)
		values('001', N'Như', null, N'Nữ', N'Vợ')
	insert into NguoiThan(MaGV,	Ten, NgaySinh, Phai, QuanHe)
		values('001', N'Trà', null, N'Nữ', N'Vợ')
--update
	update NguoiThan
	set QuanHe = N'Vợ'
	where MaGV = '001' and Ten = N'Thủy'
*/

	--delete from NguoiThan where MaGV = '001' and Ten = 'Trà'


--Câu 11: Tên trigger tg_22120157_R11: Giáo viên là nam thì chỉ có vợ chồng là Nữ hoặc ngược lại
create trigger tg_22120157_R11
on NguoiThan
for insert, update
as
begin
	declare @MaGV nvarchar(10);
	declare @GioiTinhGV nvarchar(10);
	declare @GioiTinhNT nvarchar(10);
	declare @QuanHe nvarchar(10);

	--Lấy từ bảng inserted
	select @MaGV = MaGV, @GioiTinhNT = Phai, @QuanHe = QuanHe
	from inserted;

	--Lấy từ bảng GiaoVien
	select @GioiTinhGV = Phai
	from GiaoVien
	where MaGV = @MaGV

	--Kiểm tra
	if(@GioiTinhGV = N'Nam' and @QuanHe = N'Chồng') or (@GioiTinhGV = N'Nữ' and @QuanHe = N'Nữ')
	begin
		raiserror(N'Lỗi: Giáo viên là nam thì chỉ có vợ chồng là Nữ hoặc ngược lại', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_R11

/*
--insert
	insert into NguoiThan(MaGV,	Ten, NgaySinh, Phai, QuanHe)
		values('001', N'Bình', null, N'Nam', N'Chồng')	
--update
	update NguoiThan
	set QuanHe = N'Chồng'
	where MaGV = '001' and Ten = N'Thủy'
*/


--Câu 12: Tên trigger tg_22120157_R12: Nếu thân nhân có quan hệ là 'con gái' hoặc 'con trai' với giáo
--viên thì năm sinh của giáo viên phải lớn hơn năm sinh của thân nhân
create trigger tg_22120157_R12
on NguoiThan
for insert, update
as
begin
	if exists
	(
		select *
		from inserted I
		join GiaoVien GV on GV.MaGV = I.MaGV
		where (I.QuanHe = N'Con gái' or I.QuanHe = N'Con trai') and year(GV.NgaySinh) >= year(I.NgaySinh)
	)
	begin
		raiserror(N'Lỗi: Nếu thân nhân có quan hệ là "con gái" hoặc "con trai" thì năm sinh của giáo viên phải lớn hơn năm sinh của thân nhân', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_R12
/*
--insert
	insert into NguoiThan(MaGV, Ten, NgaySinh, Phai, QuanHe)
		values('001', N'Nguyễn Văn D', '01/01/1955', N'Nam', N'Con trai')
*/

--Câu 13: Tên trigger tg_22120157_R13: Một giáo viên chỉ làm chủ nhiệm tối đa 3 đề tài
create trigger tg_22120157_R13
on DeTai
for insert, update
as
begin
	declare @MaGV nvarchar(10);

	--Lấy MaGV từ inserted
	select @MaGV = GVCNDT
	from inserted

	--Kiểm tra
	if exists
	(
		select *
		from DeTai
		where GVCNDT = @MaGV
		group by GVCNDT
		having count(MaDT) > 3
	)
	begin
		raiserror(N'Lỗi: Một giáo viên chỉ làm chủ nhiệm tối đa 3 đề tài', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R13

/*Check
--insert
	insert into DeTai(MaDT, TenDT, KinhPhi, CapQL, NgayBD, NgayKT, MaCD, GVCNDT)
		values('008', null, null, null, null, null, 'QLGD', '002')
	insert into DeTai(MaDT, TenDT, KinhPhi, CapQL, NgayBD, NgayKT, MaCD, GVCNDT)
		values('009', null, null, null, null, null, 'NCPT', '002')
--update
	update DeTai
	set GVCNDT = '002'
	where MaDT = '003'
*/


--Câu 14: Tên trigger tg_22120157_R14: Một đề tài phải có ít nhất 1 công việc
create trigger tg_22120157_R14
on CongViec
for delete
as
begin
	if exists
	(
		select *
		from deleted d
		left join CongViec CV on CV.MaDT = d.MaDT
		group by d.MaDT
		having count(CV.MaDT) < 1
	)
	begin
		raiserror(N'Lỗi: Một đề tài phải có ít nhất 1 công việc', 16, 1);
		rollback;
	end
end

--drop trigger tg_22120157_R14
/*Check
--delete
	delete from CongViec where MaDT = '006' and SoTT=1
	delete from CongViec where MaDT = '006' and SoTT=2
*/


--Câu 15: Tên trigger tg_22120157_R15: Lương của giáo viên phải nhỏ hơn lương người quản lý giáo viên đó
create trigger tg_22120157_R15
on GiaoVien
for insert, update
as
begin
	if exists
	(
		select *
		from inserted I
		join GiaoVien GVQLCM on I.GVQLCM = GVQLCM.MaGV
		where I.Luong >= GVQLCM.Luong
	)
	begin
		raiserror(N'Lỗi: Lương của giáo viên phải nhỏ hơn lương của người quản lý chuyên môn', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R15
/*Check
--insert
	insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
		values('011', N'Nguyễn Văn A', 4000, N'Nam', null, null, '002', 'MMT')
-update
	update GiaoVien
	set Luong = 5000
	where MaGV = '010'
*/


--Câu 16: Tên trigger tg_22120157_R16: Lương của trưởng bộ môn phải lớn hơn lương của các giáo viên trong bộ môn
create trigger tg_22120157_R16
on GiaoVien
for insert, update
as
begin
	if exists
	(
		select *
		from GiaoVien GV
		join BoMon BM on BM.MaBM = GV.MaBM
		join GiaoVien TrBM on TrBM.MaGV = BM.TruongBM
		where GV.MaBM in (select I.MaBM from inserted I)
		and TrBM.Luong <= GV.Luong
	)
	begin
		raiserror(N'Lỗi: Lương của trưởng bộ môn phải lớn hơn lương của các giáo viên trong bộ môn', 16, 1);
		rollback;	
	end
end
--drop trigger tg_22120157_R16

/*Check
--insert
	insert into GiaoVien(MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
		values('012', N'Nguyễn Thị D', 4000, N'Nữ', null, null, '002', 'HTTT')
--update
	update GiaoVien
	set Luong = 6000
	where MaGV = '010'
*/

--Câu 17: Tên trigger tg_22120157_R17: Bộ môn ban nào cũng phải có trưởng bộ môn và trưởng bộ môn phải là 1 giáo viên trong trường
create trigger tg_22120157_R17
on BoMon
for insert, update
as
begin
	-- Kiểm tra rằng bộ môn phải có trưởng bộ môn
	if exists
	(
		select *
		from inserted I
		where I.TruongBM is NULL
	)
	begin
		raiserror(N'Lỗi: Bộ môn phải có trưởng bộ môn', 16, 1);
		rollback;
	end

	-- Kiểm tra rằng trưởng bộ môn phải là một giáo viên trong trường
	if exists
	(
		select *
		from inserted I
		join GiaoVien GV on GV.MaGV = I.TruongBM
		where GV.MaGV is null
	)
	begin
		raiserror(N'Lỗi: Trưởng bộ môn phải là một giáo viên trong trường', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R17

/*Check
--insert
	insert into BoMon(MaBM, TenBM, Phong, DienThoai, TruongBM, MaKhoa, NgayNhanChuc)
		values('HKS', N'Thị giác máy tính', null, null, null, null, null)
--update
	update BoMon
	set TruongBM = null
	where MaBM = 'CNTT'
*/
--Câu 18: Tên trigger tg_22120157_R18: Một giáo viên chỉ quản lý tối đa 3 giáo viên khác
create trigger tg_22120157_R18
on GiaoVien
for insert, update
as
begin
	declare @MaGV nvarchar(10);
	declare @SoGVQuanLy int;

	--Lấy MaGV từ inserted
	select @MaGV = GVQLCM
	from inserted
	where GVQLCM is not null;

	if @MaGV is not null
	begin
		select @SoGVQuanLy = count(*)
		from GiaoVien
		where GVQLCM = @MaGV

		if @SoGVQuanLy > 3
		begin
			raiserror(N'Lỗi: Một giáo viên chỉ quản lý tối đa 3 giáo viên khác', 16, 1);
			rollback;
		end
	end
end
--drop trigger tg_22120157_R18

/*Check
	update GiaoVien
	set GVQLCM = '002'
	where MaGV = '007'

	update GiaoVien
	set GVQLCM = '002'
	where MaGV = '004'

	update GiaoVien
	set GVQLCM = '002'
	where MaGV = '005'

*/
--Câu 19: Tên trigger tg_22120157_R19: Giáo viên chỉ tham gia những đề tài mà giáo viên chủ nhiệm đề tài là người cùng bộ môn với giáo viên đó
create trigger tg_22120157_R19
on ThamGiaDT
for insert, update
as
begin
	if exists
	(
		select *
		from ThamGiaDT TG
		join DeTai DT on DT.MaDT = TG.MaDT
		join GiaoVien GV_TG on GV_TG.MaGV = TG.MaGV
		join GiaoVien GV_CN on GV_CN.MaGV = DT.GVCNDT
		where GV_TG.MaBM != GV_CN.MaBM
	)
	begin
		raiserror(N'Lỗi: Giáo viên chỉ tham gia những đề tài mà giáo viên chủ nhiệm đề tài là người cùng bộ môn với giáo viên đó', 16, 1);
		rollback;
	end
end
--drop trigger tg_22120157_R19

/*Check
	insert into ThamGiaDT(MaGV, MaDT, SoTT, PhuCap, KetQua)
		values('001', '002', 3, null, null)
*/



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