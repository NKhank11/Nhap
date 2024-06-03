use DB_QLDeAn_22120157

/*
select * from PhongBan
select * from DiaDiem_Phg
*/

create Proc usp_updateDD 
	@MaPhongBan int, @TenDiaDiemMoi nvarchar(100)
as
 begin
	 if(exists(select * from PhongBan where MaPhg = @MaPhongBan))
		select *
		from PhongBan
		where MaPhg = @MaPhongBan
	 else
		begin
			print N'Phong ban khong ton tai'
			return;
		end
	 if (exists(select * from DiaDiem_Phg where MaPhg = @MaPhongBan and DiaDiem = @TenDiaDiemMoi))
		begin
			print N'Ten dia diem cua phong ban da ton tai'
			return;
		end
	 insert into DiaDiem_Phg (MaPhg, DiaDiem) values (@MaPhongBan, @TenDiaDiemMoi)
	 select DiaDiem
	 from DiaDiem_Phg
	 where @MaPhongBan = MaPhg
	 print N'Da cap nhat thanh cong'
	 return;
 end
 
 exec usp_updateDD 1, N'Hà Nội'