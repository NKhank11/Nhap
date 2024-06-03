--MSSV: 22120157
--Họ tên: Nguyễn Nam Khánh
--Lớp: 22cq06 N2
--Ngày làm bài: 19/05/2024

--Câu 1: In ra câu chào "Hello World!!!"
create Proc sp_22120157_q1
as
begin
	print N'Hello World !!!'
end
go

exec sp_22120157_q1;

--drop Proc sp_22120157_q1

--Câu 2: In ra kết quả tổng hai số
create Proc sp_22120157_q2
	@num1 int,
	@num2 int
as
begin
	declare @sum int;
	set @sum = @num1 + @num2;
	print N'Tổng của 2 số là: ' + cast(@sum as nvarchar(100));
end
go

exec sp_22120157_q2 10, 20;

--drop Proc sp_22120157_q2

--Câu 3: Tính tổng 2 số (sử dụng biến output để lưu kết quả trả về)
-- Tạo stored procedure với tham số output
create Proc sp_221201257_q3
	@num1 int,
	@num2 int,
	@output int out
as
begin
	set @output = @num1 + @num2;
end
go

declare @res int
exec sp_221201257_q3 10, 20, @res out
print @res

--drop Proc sp_22120157_q3


--Câu 4: In ra tổng 3 số (sử dụng lại, gọi lại - stored procedure Tính tổng 2 số)
create Proc sp_22120157_q4
	@num1 int,
	@num2 int,
	@num3 int,
	@tong int out
as
begin
	exec sp_221201257_q3 @num1, @num2, @tong out;
	exec sp_221201257_q3 @tong, @num3, @tong out;
end
go

declare @res int
exec sp_22120157_q4 10, 20, 30, @res out
print @res

--drop Proc sp_22120157_q4

--Câu 5: In ra tổng các số nguyên từ m đến n
create Proc sp_22120157_q5
	@m int,
	@n int
as
begin
	declare @tong int
	declare @i int
	set @tong = 0
	set @i = @m

	while(@i < @n)
	begin
		set @tong = @tong + @i
		set @i = @i + 1
	end
	print @tong
end
go

exec sp_22120157_q5 1, 10;

--drop Proc sp_22120157_q5

--Câu 6: Kiểm tra một số nguyên có phải là số nguyên tố không
create Proc sp_22120157_q6
	@n int,
	@isPrime bit output
as
begin
	set @isPrime = 1;

	if(@n < 2)
	begin
		set @isPrime = 0;
		return;
	end

	declare @i int;
	set @i = 2;

	while(@i <= sqrt(@n))
	begin
		if(@n % @i = 0)
		begin
			set @isPrime = 0;
			return;
		end 
		set @i = @i + 1;
	end
end
go

create Proc sp_inNguyenTo
	@isPrime bit
as
begin
	if(@isPrime = 0) print N'Không là số nguyên tố'
	else print N'Là số nguyên tố'
end
go

declare @check1 bit;
exec sp_22120157_q6 37, @check1 output;
exec sp_inNguyenTo @check1;

declare @check2 bit;
exec sp_22120157_q6 18, @check2 output;
exec sp_inNguyenTo @check2;

/*
drop Proc sp_22120157_q6
--drop Proc sp_inNguyenTo
*/


--Câu 7: In ra tổng các số nguyên tố trong đoạn m, n
create Proc sp_22120157_q7
	@m int,
	@n int
as
begin
	declare @sum int;
	set @sum = 0;

	declare @i int;
	set @i = @m;

	while @i <= @n
	begin
		declare @isPrime bit;
		exec sp_22120157_q6 @i, @isPrime output;

		if @isPrime = 1
			set @sum = @sum + @i;
		set @i = @i + 1;
	end
	print N'Tổng các số nguyên tố từ ' + cast(@m as nvarchar(10)) + N' đến ' + cast(@n as varchar(10)) + N' là '
	+ cast(@sum as nvarchar(10));
end 
go

exec sp_22120157_q7 10, 30;

--drop Proc sp_22120157_q7


--Câu 8: Tính ước chung lớn nhất của 2 số nguyên
create Proc sp_22120157_q8
	@m int,
	@n int,
	@gcd int output
as
begin
	declare @temp int;
	set @temp = 0;

	while @n != 0
	begin
		set @temp = @m % @n;
		set @m = @n;
		set @n = @temp;
	end
	set @gcd = @m;
end
go

declare @gcd int;
exec sp_22120157_q8 60, 20, @gcd output;
print(@gcd);

--drop Proc sp_22120157_q8

--Câu 9: Tính bội chung nhỏ nhất của 2 số nguyên
create Proc sp_22120157_q9
	@m int,
	@n int,
	@bcnn int output
as
begin
	declare @ucln int;
	exec sp_22120157_q8 @m, @n, @ucln output;

	set @bcnn = @m * @n / @ucln;
end 
go

declare @bcnn int;
exec sp_22120157_q9 35, 20, @bcnn output;
print (@bcnn);

--drop Proc sp_22120157_q9