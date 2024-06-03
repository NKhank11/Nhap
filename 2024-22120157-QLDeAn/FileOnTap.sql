use DB_QLDeAn_22120157

/*
select * from NHANVIEN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from DEAN
select * from CONGVIEC
select * from PHANCONG
select * from THANNHAN
*/


----CÁC CÂU TRUY VẤN ĐƠN GIẢN

--1. Tìm những nhân viên làm việc ở phòng số 4
--2. Tìm những nhân viên có mức lương trên 30000
--3, 4. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương
--trên 30,000 ở phòng 5
--5. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
--6. Cho biết ngày sinh và địa chỉ của nhân viên Hoang Dinh Hieu
--7. Cho biết danh sách các công việc có tên liên quan đến sản phẩm X.


----PHÉP KẾT
--8. Cho biết danh sách các công việc của đề án “Sản phẩm X”.
--9. Cho biết những công việc được thực hiện tại Hà Nội.
--10. Cho biết những công việc mà nhân viên Hoàng Đình Hiếu đảm trách
--11. Cho biết các công việc mà nhân viên phòng Nghiên cứu đảm trách
--12. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
--13. Tìm tên những người trưởng phòng của từng phòng ban
--14. Tìm TENDA, MADA, DDIEM_DA, PHONG, TENPHG, MAPHG, TRPHG, NG_NHANCHUC
--15. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghien cuu".
--16. Tìm tên những nữ nhân viên và tên người thân của họ
--17. Với mọi đề án ở "Ha Noi", liệt kê các mã số đề án (MADA), mã số phòng ban chủ trì đề án (PHONG), họ tên trưởng phòng
--(HONV, TENLOT, TENNV) cũng như địa chỉ (DCHI) và ngày sinh (NGSINH) của người ấy.
--18. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
--19. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc
--20. Tên những nhân viên phòng số 5 có tham gia vào đề án "San pham X" và nhân viên này do "Nguyen Thanh Tung" quản lý
--trực tiếp. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) và tên các đề án mà nhân viên ấy tham gia nếu có.


----GOM NHÓM
--21. Cho biết phòng ban đảm trách nhiều công việc nhất.
--22. Cho biết đề án ở thành phố HCM mà có nhiều công việc nhất.
--23. Với mỗi đề án, liệt kê tên đề án (TENDA) và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
--24. Với mỗi nhân viên, cho biết họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân
--25. Với mỗi phòng ban, liệt kê tên phòng ban (TENPHG) và lương trung bình của những nhân viên làm việc cho phòng ban đó.
--26. Lương trung bình của tất cả các nữ nhân viên
--27. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.----CÂU TRUY VẤN LỒNG--28. Với mỗi đề án, chọn ra công việc mà nhân viên tham gia phải làm lâu nhất.
--29. Cho biết đề án mà nhân viên phòng Nghiên cứu không hề tham gia.
--30. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc , có người trưởng phòng chủ trì đề án
--với họ (HONV) là ‘Dinh’.
--31. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
--32. Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào.
--33. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
--34. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
--35. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghien cuu"
--36. Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
--37. Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở ‘TP HCM’
--nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố ‘TP HCM’ .
--38. Tổng quát câu 16, tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố nhưng phòng ban mà họ
--trực thuộc lại không toạ lạc ở thành phố đó.----PHÉP CHIA--39. Cho biết đề án má tất cả công việc của nó đều đã được phân công.
--40. Cho biết đề án được tất cả nhân viên phòng Nghiên cứu tham gia..
--41. Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong mọi đề án của công ty
--42. Danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án do phòng số 4 chủ trì.
--43. Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án mà nhân viên Hoang Dinh Hieu làm việc