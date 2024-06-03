--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 19/05/2024

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


--Tên sp_22120157_1: Xuất ra toàn bộ danh sách giáo viên
create proc sp_22120157_1
as
begin
	select *
	from GiaoVien;
end
go

exec sp_22120157_1
--drop proc sp_22120157_1

--Tên sp_22120157_2: Tính số lượng đề tài mà một giáo viên đang thực hiện
create proc sp_22120157_2
	@MaGV nvarchar(10)
as
begin
	select count(*) 'Số đề tài'
	from ThamGiaDT TG
	where TG.MaGV = @MaGV;
end
go

exec sp_22120157_2 @MaGV = '003'

--drop proc sp_22120157_2

--Tên sp_22120157_3: In thông tin chi tiết của giáo viên(sử dụng lệnh print): Thông tin cá nhân, Số lượng đề tài tham gia
--Số lượng thân nhân của giáo viên đó
create Proc sp_22120157_3
	@MaGV nvarchar(10)
as
begin
	declare @hoTen nvarchar(100), @luong float, @phai nvarchar(10);
	declare @ngaySinh date, @diaChi nvarchar(100), @gvqlcm nvarchar(10), @maBM varchar(10);
	declare @soDeTai int, @soNguoiThan int;

	select @hoTen = MaGV, @Luong = Luong, @phai = Phai, @ngaySinh = NgaySinh, @diaChi = DiaChi,
		   @gvqlcm = GVQLCM, @maBM = MaBM
	from GiaoVien
	where MaGV = @MaGV

	select @soDeTai = count(*)
	from ThamGiaDT
	where MaGV = @MaGV

	select @soNguoiThan = count(*)
	from NguoiThan
	where MaGV = @MaGV


    -- In thông tin cá nhân
    print N'Thông tin cá nhân GV có mã ' + cast(@maGV as nvarchar);
    print N'Họ tên: ' + @hoTen;
    print N'Lương: ' + cast(@luong as nvarchar);
    print N'Phái: ' + @phai;
    print N'Ngày sinh: ' + cast(@ngaySinh as nvarchar);
    print N'Địa chỉ: ' + @diaChi;
    print N'Giáo viên quản lý chuyên môn: ' + cast(@gvqlcm as nvarchar);
    print N'Mã bộ môn: ' + cast(@maBM as nvarchar);
	print N'Số đề tài tham gia: ' + cast(@soDeTai as nvarchar);
	print N'Số người thân: ' + cast(@soNguoiThan as nvarchar);

end
go

exec sp_22120157_3 '004';
--drop Proc sp_22120157_3


--Tên sp_22120157_4: Kiểm tra một giáo viên có tồn tại hay không(dựa vào MaGV)
create Proc sp_22120157_4
	@MaGV nvarchar(10)
as
begin
	if(exists(select * from GiaoVien where MaGV = @MaGV))
	begin
		print N'Tồn tại giáo viên có mã: ' + cast(@MaGV as nvarchar);
	end
	else
	begin
		print N'Không tồn tại giáo viên có mã: ' + cast(@MaGV as nvarchar);
	end
end
go

exec sp_22120157_4 '003'
--drop Proc sp_22120157_4


--Tên sp_22120157_5: Kiểm tra quy định của một giáo viên: Chỉ được thực hiện các đề tài mà bộ môn của giáo viên đó làm chủ nhiệm
create proc sp_22120157_5
	@MaGV nvarchar(10)
as
begin
	declare @MaBM nvarchar(10);

	select @MaBM = MaBM
	from GiaoVien GV
	where MaGV = @MaGV;

	--Kiểm tra trước xem GV có đang tham gia đề tài không
	if not exists
	(
		select *
		from ThamGiaDT
		where MaGV = @MaGV
	)
	begin
		print N'Giáo viên có mã: ' + @MaGV + N' không tham gia bất kỳ đề tài nào.';
		return;
	end

	if exists
	(
		select *
		from ThamGiaDT TG
		join DeTai DT on DT.MaDT = TG.MaDT
		join GiaoVien GV on GV.MaGV = DT.GVCNDT
		where TG.MaGV = @MaGV and GV.MaBM != @MaBM
	)
	begin
		print N'Giáo viên có mã: ' + @MaGV + N' đang thực hiện đề tài không thuộc bộ môn của giáo viên đó làm chủ nhiệm';
	end
	else 
	begin
		print N'Giáo viên có mã: ' + @MaGV + N' thực hiện đúng đề tài mà bộ môn của giáo viên đó làm chủ nhiệm';
	end

end
go

exec sp_22120157_5 '001';
--drop proc sp_22120157_5;

--Tên sp_22120157_6: Thực hiện thêm một phân công cho giáo viên thực hiện công việc của đề tài
--a. Kiểm tra thông tin đầu vào hợp lệ: giáo viên phải tồn tại, công việc phải tồn tại, thời gian tham gia phải > 0
--b. Kiểm tra quy định ở câu 5
create proc sp_22120157_6
	@MaGV nvarchar(10),
	@MaDT nvarchar(10),
	@SoTT int,
	@PhuCap float,
	@KetQua nvarchar(10)

as
begin
	--Kiểm tra giáo viên tồn tại
	if not exists
	(
		select *
		from GiaoVien
		where MaGV = @MaGV
	)
	begin
		print N'Giáo viên không tồn tại';
		return;
	end

	--Kiểm tra công việc tồn tại
	if not exists
	(
		select *
		from CongViec
		where MaDT = @MaDT and SoTT = @SoTT
	)
	begin
		print N'Công việc không tồn tại'
		return;
	end

	--Kiểm tra thời gian tham gia phải > 0
	declare @NgayBD date;
	declare @NgayKT date;

	select @NgayBD = NgayBD, @NgayKT = NgayKT
	from CongViec
	where MaDT = @MaDT and SoTT = @SoTT

	if @NgayBD >= @NgayKT
	begin
		print N'Thời gian tham gia không hợp lệ !!!';
		return;
	end

	--Thêm phân công cho GV thực hiện công việc đề tài
	insert into ThamGiaDT (MaGV, MaDT, SoTT, PhuCap, KetQua)
		values(@MaGV, @MaDT, @SoTT, @PhuCap, @KetQua)
	print N'Đã phân công thành công'
	select * from ThamGiaDT

	--Kiểm tra quy định ở câu 5
	exec sp_22120157_5 @MaGV;

	--Xóa dòng vừa insert
	--delete from ThamGiaDT where MaGV = @MaGV and MaDT = @MaDT and SoTT = @SoTT
end
go

exec sp_22120157_6 '001', '002', 3, 1.0, N'Đạt'
--drop proc sp_22120157_6
--delete from ThamGiaDT where MaGV = '001' and MaDT = '002' and SoTT = 3


--Tên sp_22120157_7: Thực hiện xóa một giáo viên theo mã. Nếu giáo viên có thông tin liên quan(Có thân nhân, có làm đề tài,...) thì báo lỗi
create proc sp_22120157_7
	@MaGV nvarchar(10)
as
begin
	--Kiểm tra giáo viên có tồn tại không
	if not exists
	(
		select *
		from GiaoVien
		where MaGV = @MaGV
	)
	begin
		print N'Không tồn tại giáo viên có mã ' + @MaGV;
		return; 
	end

	--Kiểm tra đề tài liên quan
	if exists
	(
		select *
		from ThamGiaDT
		where MaGV = @MaGV
	)
	begin
		print N'Không thể xóa giáo viên có mã: ' + @MaGV + N' vì có đề tài liên quan';
		return;
	end

	--Kiểm tra người thân của giáo viên
	if exists
	(
		select *
		from NguoiThan
		where MaGV = @MaGV
	)
	begin
		print N'Không thể xóa giáo viên có mã: ' + @MaGV + N' vì có người thân liên quan';
		return;
	end

	--Thực hiện xóa giáo viên
	delete from GiaoVien where MaGV = @MaGV
	print N'Giáo viên có mã ' + @MaGV + N' đã được xóa thành công.';
end
go

exec sp_22120157_7 '001'
--drop proc sp_22120157_7


--Tên sp_22120157_8: In ra danh sách giáo viên của một phòng ban nào đó cùng với số lượng đề tài mà giáo viên tham gia, số thân nhân, 
--số giáo viên mà giáo viên đó quản lý nếu có,...
--create proc sp_22120157_8
--	@MaBM nvarchar(10)
--as
--begin
--end
--go

--exec sp_22120157_8 'HTTT'
--drop proc sp_22120157_8

--Tên sp_22120157_9: Kiểm tra quy định của 2 giáo viên a, b. Nếu a là trưởng bộ môn c của b thì lương của a phải cao hơn lương của b (a, b: MaGV)
create proc sp_22120157_9
	@MaGV_A nvarchar(10),
	@MaGV_B nvarchar(10)
as
begin
	declare @Luong_A float, @Luong_B float;
	declare @MaBM_A nvarchar(10), @MaBM_B nvarchar(10);
	declare @TruongBM nvarchar(10);

	--Lấy thông tin lương và MaBM của 2 giáo viên
	select @Luong_A = Luong, @MaBM_A = MaBM
	from GiaoVien
	where MaGV = @MaGV_A

	select @Luong_B = Luong, @MaBM_B = MaBM
	from GiaoVien
	where MaGV = @MaGV_B

	--Lấy trưởng bộ môn của giáo viên B
	select @TruongBM = BM.TruongBM
	from GiaoVien GV
	join BoMon BM on BM.MaBM = GV.MaBM
	where MaGV = @MaGV_B

	--Kiểm tra quy định
	if @TruongBM = @MaGV_A
	begin
		if @Luong_A > @Luong_B
		begin
			print N'Giáo viên ' + @MaGV_A + N' có lương cao hơn giáo viên ' + @MaGV_B + N'. Quy định được thỏa mãn.';
		end
		else
		begin
			print N'Giáo viên ' + @MaGV_A + N' có lương thấp hơn hoặc bằng giáo viên ' + @MaGV_B + N'. Quy định không được thỏa mãn.';
		end
	end
	else
	begin
		print @MaGV_A + N' không là trưởng bộ môn của giáo viên ' + @MaGV_B;
	end
end
go

exec sp_22120157_9 '002', '003';
--drop proc sp_22120157_9;

--Tên sp_22120157_10: Thêm một giáo viên: Kiểm tra các quy định: Không trùng tên, tuổi > 18, lương > 0
create proc sp_22120157_10
    @MaGV nvarchar(10),
    @HoTen nvarchar(100),
    @Luong float,
    @Phai nvarchar(10),
    @NgaySinh date,
    @DiaChi nvarchar(100),
    @GVQLCM nvarchar(10),
    @MaBM nvarchar(10)
as
begin
    -- Kiểm tra nếu tên giáo viên đã tồn tại
    if exists (select * from GiaoVien where HoTen = @HoTen)
    begin
        print N'Lỗi: Tên giáo viên đã tồn tại !!!';
        return;
    end

    -- Kiểm tra tuổi giáo viên
    declare @Tuoi int;
    set @Tuoi = datediff(year, @NgaySinh, getdate());

    if @Tuoi <= 18
    begin
        print N'Lỗi: Tuổi giáo viên phải lớn hơn 18 !!!';
        return;
    end

    -- Kiểm tra lương
    if @Luong <= 0
    begin
        print N'Lỗi: Lương giáo viên phải lớn hơn 0 !!!';
        return;
    end

    -- Thêm giáo viên mới vào cơ sở dữ liệu
	insert into GiaoVien (MaGV, HoTen, Luong, Phai, NgaySinh, DiaChi, GVQLCM, MaBM)
    values (@MaGV, @HoTen, @Luong, @Phai, @NgaySinh, @DiaChi, @GVQLCM, @MaBM);

    print N'Thêm giáo viên thành công !!!'

	--select * from GiaoVien

end
go

exec sp_22120157_10 
    @MaGV = '011',
    @HoTen = N'Nguyễn Hoài Bão',
    @Luong = 5000,
    @Phai = N'Nam',
    @NgaySinh = '07/11/1988',
    @DiaChi = '01 Võ Văn Ngân Thủ Đức, TP HCM',
    @GVQLCM = NULL,
    @MaBM = 'HTTT';

--delete from GiaoVien where MaGV = '011';
--drop proc sp_22120157_10


--Tên sp_22120157_11: Mã giáo viên được xác định tự động theo quy tắc. Nếu đã có GV 001, 002, 003, thì MaGV của GV mới là 004. Nếu đã có GV 
--001, 002, 005, thì MaGV của GV mới là 003
create proc sp_22120157_11
	@NextMaGV nvarchar(10) output
as
begin
	declare @MaxMaGV nvarchar(10);
	declare @SecondMaxMaGV nvarchar(10);
	--declare @NextMaGV nvarchar(10);

	--Số kí tự ở MaGV
	declare @SoKiTu int;

	--Tìm MaGV lớn nhất và lớn thứ 2
	select top 1 @MaxMaGV = MaGV
	from GiaoVien
	order by MaGV desc;

	select top 1 @SecondMaxMaGV = MaGV
	from GiaoVien
	where MaGV < @MaxMaGV
	order by MaGV desc;

	set @SoKiTu = len(@MaxMaGV)

	--Nếu không có GV nào
	if @MaxMaGV is null
	begin
		set @NextMaGV = '001'
	end
	else
	begin
		-- Xác định Mã giáo viên tiếp theo
		if @SecondMaxMaGV is not null and cast(@MaxMaGV as int) - cast(@SecondMaxMaGV as int) = 1
		begin
			set @NextMaGV = '00' + cast(cast(@MaxMaGV as int) + 1 as nvarchar(10));
			if len(@NextMaGV) = @SoKiTu + 1
			begin
				set @NextMaGV = right(@NextMaGV, @SoKiTu);
			end
		end
		else
		begin
			set @NextMaGV = '00' + cast(cast(@SecondMaxMaGV as int) + (cast(@MaxMaGV as int) - cast(@SecondMaxMaGV as int)) as nvarchar(10));
			if len(@NextMaGV) = @SoKiTu + 1
			begin
				set @NextMaGV = right(@NextMaGV, @SoKiTu);
			end
		end
	end
end
go

declare @NextMaGV nvarchar(10);
exec sp_22120157_11 @NextMaGV output;
exec sp_22120157_10 
    @MaGV = @NextMaGV,
    @HoTen = N'Nguyễn Hoài Bão',
    @Luong = 5000,
    @Phai = N'Nam',
    @NgaySinh = '07/11/1988',
    @DiaChi = N'01 Võ Văn Ngân Thủ Đức, TP HCM',
    @GVQLCM = NULL,
    @MaBM = 'HTTT';
select * from GiaoVien
--delete from GiaoVien where MaGV = '011'
--drop proc sp_22120157_11