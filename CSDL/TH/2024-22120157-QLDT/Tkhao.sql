use DB_QLDeTai_22120157
go

-- MSSV: 22120163
-- HỌ VÀ TÊN: PHẠM ĐÀO ANH KHOA
-- NHÓM N1, SÁNG THỨ 4
-- LỚP: CQ 22_6


--1. Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.
-- Kiểu 1: NOT EXISTS + EXCEPT

SELECT gv.HOTEN
FROM GIAOVIEN gv
WHERE NOT EXISTS(
    SELECT cd.MACD
    FROM CHUDE cd
	EXCEPT
    SELECT dt.MACD
    FROM THAMGIADT tg
    LEFT JOIN DETAI AS dt ON dt.MADT=tg.MADT
    WHERE tg.MAGV=gv.MAGV
)

-- Kiểu 2: NOT EXISTS + NOT EXISTS
SELECT gv.HOTEN
FROM GIAOVIEN AS gv
WHERE NOT EXISTS(
    SELECT *
	FROM CHUDE AS cd
	WHERE NOT EXISTS(
    SELECT *
	FROM THAMGIADT AS tg
	LEFT JOIN DETAI AS dt ON dt.MADT=tg.MADT
	WHERE gv.MAGV=tg.MAGV AND cd.MACD=DT.MACD
    )
)

-- Kiểu 3: GROUP BY + HAVING
SELECT gv.HOTEN
FROM GIAOVIEN AS gv
LEFT JOIN THAMGIADT AS tg ON gv.MAGV=tg.MAGV
LEFT JOIN DETAI AS dt ON dt.MADT=tg.MADT
GROUP BY gv.MAGV, gv.HOTEN
HAVING COUNT(DISTINCT dt.MACD) = (
                                    SELECT COUNT(MACD)
									FROM CHUDE )

--2. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn HTTT tham gia.
-- Kiểu 1: NOT EXISTS + EXCEPT
select dt.TENDT
from DETAI dt
where not exists(
                select gv1.MAGV
				from GIAOVIEN gv1
				where gv1.MABM = 'HTTT'
				except
				select gv2.MAGV
				from GIAOVIEN gv2
				left join THAMGIADT tg on tg.MAGV=gv2.MAGV
				where gv2.MABM = 'HTTT' and tg.MADT=dt.MADT
				)
-- Kiểu 2: NOT EXISTS + NOT EXISTS
select dt.TENDT
from DETAI dt
where not exists(
		select *
		from GIAOVIEN gv
		where not exists(
					select *
					from THAMGIADT tg
					where gv.MAGV=tg.MAGV and dt.MADT=tg.MADT
					) and gv.MABM='HTTT'
)
-- Kiểu 3: GROUP BY + HAVING
select dt.TENDT
from GIAOVIEN gv
left join THAMGIADT tg on tg.MAGV=gv.MAGV
left join DETAI dt on dt.MADT=tg.MADT
where gv.MABM='HTTT'
group by dt.MADT, dt.TENDT
having count(distinct gv.MAGV)= (
						select count(gv.MAGV)
						from GIAOVIEN gv
						where gv.MABM='HTTT')

--3. Cho biết ten đe tai co tat ca giang vien bo mon 'He thong thong tin' tham gia
-- Kiểu 1: NOT EXISTS + EXCEPT
select dt.TENDT
from DETAI dt
where not exists(
    select gv.MAGV
    from GIAOVIEN gv
        left join BOMON bm on bm.MABM=gv.MABM
    where bm.TENBM=N'Hệ thống thông tin'
except
    select gv1.MAGV
    from THAMGIADT tg
        left join GIAOVIEN gv1 on gv1.MAGV=tg.MAGV
        left join BOMON bm on bm.MABM=gv1.MABM
    where tg.MADT=dt.MADT and bm.TENBM=N'Hệ thống thông tin'
)
-- Kiểu 2: NOT EXISTS + NOT EXISTS
select dt.TENDT
from DETAI dt
where not exists(
    select *
from GIAOVIEN gv1
    left join BOMON bm on bm.MABM=gv1.MABM
where bm.TENBM=N'Hệ thống thông tin' and not exists(
            select *
    from THAMGIADT tg
        left join GIAOVIEN gv2 on gv2.MAGV=tg.MAGV
        left join BOMON bm on bm.MABM=gv2.MABM
    where gv1.MAGV=gv2.MAGV and tg.MADT=dt.MADT
    )
)
-- Kiểu 3: GROUP BY + HAVING
select dt.TENDT
from DETAI dt
left join THAMGIADT tg on dt.MADT=tg.MADT
left join GIAOVIEN gv on gv.MAGV=tg.MAGV
left join BOMON bm on bm.MABM=gv.MABM
where bm.TENBM=N'Hệ thống thông tin'
group by dt.MADT, dt.TENDT
having count(distinct gv.MAGV)=(
								select count(gv1.MAGV)
								from GIAOVIEN gv1
								left join BOMON bm on bm.MABM=gv1.MABM
								where bm.TENBM=N'Hệ thống thông tin'
								)
--4. Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD.
-- Kiểu 1: NOT EXISTS + EXCEPT
select gv1.MAGV, gv1.HOTEN
from GIAOVIEN gv1
where not exists(
                select dt1.MADT
				from DETAI dt1
				left join CHUDE cd1 on cd1.MACD=dt1.MACD
				where cd1.MACD='QLGD'
				except
				select dt2.MADT
				from DETAI dt2
				left join CHUDE cd2 on cd2.MACD=dt2.MACD
				left join THAMGIADT tg on tg.MADT=dt2.MADT
				where cd2.MACD='QLGD' and tg.MAGV=gv1.MAGV
				)
-- Kiểu 2: NOT EXISTS + NOT EXISTS
select gv1.MAGV, gv1.HOTEN
from GIAOVIEN gv1
where not exists(
				select *
				from DETAI dt1
				left join CHUDE cd1 on cd1.MACD=dt1.MACD
				where cd1.MACD='QLGD' and not exists(
							select *
							from DETAI dt2
							left join CHUDE cd2 on cd2.MACD=dt2.MACD
							left join THAMGIADT tg on tg.MADT=dt2.MADT
							where dt1.MADT=dt2.MADT and gv1.MAGV=tg.MAGV
							)
				)	
-- Kiểu 3: GROUP BY + HAVING
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv
left join THAMGIADT tg on tg.MAGV=gv.MAGV
left join DETAI dt on dt.MADT=tg.MADT
left join CHUDE cd on cd.MACD=dt.MACD
where cd.MACD='QLGD'
group by gv.MAGV, gv.HOTEN
having count(distinct dt.MADT)=(
						select count(cd1.MACD)
						from CHUDE cd1
						left join DETAI dt1 on dt1.MACD=cd1.MACD
						where cd1.MACD='QLGD')
--5. Cho biết tên giáo viên nào tham gia tất cả các đề tài mà giáo viên Trần Trà Hương đã tham gia.
-- Kiểu 1: NOT EXISTS + EXCEPT
select gv1.MAGV, gv1.HOTEN
from GIAOVIEN gv1
where not exists(
                select tg2.MADT
				from THAMGIADT tg2
				join GIAOVIEN gv2 on gv2.MAGV=tg2.MAGV
				where gv2.HOTEN=N'Trần Trà Hương'
				except
				select tg3.MADT
				from THAMGIADT tg3
				where gv1.MAGV=tg3.MAGV
				)
-- Kiểu 2: NOT EXISTS + NOT EXISTS
select gv1.MAGV, gv1.HOTEN
from GIAOVIEN gv1
where not exists(
				select *
				from THAMGIADT tg1
				join GIAOVIEN gv2 on gv2.MAGV=tg1.MAGV
				where gv2.HOTEN=N'Trần Trà Hương' and not exists(
							select *
							from THAMGIADT tg2
							where gv1.MAGV=tg2.MAGV and tg1.MADT=tg2.MADT
							)
				)	
-- Kiểu 3: GROUP BY + HAVING
select gv.MAGV, gv.HOTEN
from THAMGIADT tg
join GIAOVIEN gv on gv.MAGV=tg.MAGV
group by gv.MAGV, gv.HOTEN
having tg.MADT =(
				select tg1.MADT
				from THAMGIADT tg1
				join GIAOVIEN gv1 on gv1.MAGV=tg1.MAGV
				where gv1.HOTEN=N'Trần Trà Hương'
				)