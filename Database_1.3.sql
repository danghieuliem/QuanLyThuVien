create database quanlythuvien;
 Go
 use quanlythuvien;
 Go
 /* 
		+id nhanvien : 1...
		+id theloai : 2...
		+id tacgia : 3...
		+id nhaxuatban : 4...
		+id sach : 5...
		+id docgia : 6...
		+id phieumuon : 7...
*/
 --Tạo bảng thể loại
create table theloai(
	ma_the_loai int Identity (2000,1) primary key,
	the_loai nvarchar(50)not null,
	da_xoa bit  not null 
)

go
--Tạo bảng tác giả
create table tacgia(
	ma_tac_gia int Identity (3000,1) primary key ,
	ten_tac_gia nvarchar(50) not null,
	tieu_su nvarchar(max)not null,
	da_xoa bit  not null 
)
go
--Tạo bảng nhà phát hành
create table nhaxuatban(
	ma_nha_xuat_ban int Identity (4000,1) primary key,
	ten_nha_xuat_ban nvarchar(50) not null,
	dia_chi nvarchar(50) not null,
	sdt nvarchar(12) not null,
	email nvarchar(50) not null,
	da_xoa bit  not null 
)
go
--Tạo bảng sách
create table sach(
	ma_sach int Identity (5000,1) primary key,
	ten_sach nvarchar(50) not null,
	so_luong int not null,
	nam_xuat_ban int not null,
	ma_nha_xuat_ban int not null,
	tac_gia int not null,
	the_loai int not null, 
	gia_muon int not null,
	ngay_nhap date not null,
	da_xoa bit  not null 
)
go
--Tạo bảng độc giả
create table docgia(
	ma_doc_gia int Identity (6000,1) primary key,
	ten_doc_gia nvarchar(50) not null,
	gioi_tinh bit not null,
	ngay_sinh date not null,
	dia_chi nvarchar(25) not null,
	CMND nvarchar(12) not null,
	SDT varchar(12) not null,
	da_xoa bit  not null 
	
)
go 
--Tạo bảng nhân viên
create table nhanvien(
	ma_nhan_vien int Identity (1000,1) primary key,
	ten_nhan_vien nvarchar(50) not null,
	gioi_tinh bit not null,
	ngay_sinh date not null,
	dia_chi nvarchar(25) not null,
	quanly bit not null,
	sdt varchar(12) not null,
	da_xoa bit  not null 
)
go
--Tạo bảng phiếu mượn
create table phieumuon(
	ma_phieu int Identity (7000,1) primary key,
	doc_gia int not null,
	nhan_vien int not null,
	ngay_muon date not null,
	ngay_tra date not null,
	tong_tien varchar(9) not null,
	trang_thai bit  not null,
	da_xoa bit  not null 
) 
go
--Tạo bảng tài khoản
create table taikhoan(
	ma_nhan_vien int primary key,
	tai_khoan nvarchar(25) not null,
	mat_khau nvarchar(25) not null,
	da_xoa bit  not null 
)
go
--Tạo bảng danh sách
create table thongtinphieumuon(
	ma_phieu_muon int not null,
	ma_sach int not null,
	da_xoa bit  not null 
)
go 

--add danh sach phieu muon
alter table thongtinphieumuon
add foreign key (ma_sach) references sach(ma_sach);

alter table thongtinphieumuon
add foreign key (ma_phieu_muon) references phieumuon(ma_phieu);
--add khoa ngoại quan lý
alter table taikhoan
add foreign key(ma_nhan_vien) references nhanvien(ma_nhan_vien);
--add khóa ngoại sách
go
alter table sach
add foreign key(ma_nha_xuat_ban) references nhaxuatban(ma_nha_xuat_ban);
go
alter table sach
add foreign key (tac_gia) references tacgia(ma_tac_gia);
go
alter table sach
add foreign key (the_loai) references theloai(ma_the_loai);
--add khóa ngoại phiếu mượn
go
alter table phieumuon
add foreign key (doc_gia) references docgia(ma_doc_gia);
go
-- insert dữ liệu vào bảng nhà phát hành
insert into nhaxuatban(ten_nha_xuat_ban,sdt,dia_chi,email ,da_xoa)
values (N'Tuổi trẻ','0382886014','tphcm','tuoitre@gmail.com',0),
(N'Nhà sách phương nam','0944065270','tpbienhoa','phuongnam@gmail.com',0),
(N'Nhà xuất bản Mới','0388019288','tpdanang','moi@gmail.com',1),
(N'Nhà xuất bản Kim Đồng','0944341923','hanoi','kimdong@gmail.com',0),
(N'Báo thanh niên','0382469877','tphcm','thanhnien@gmail.com',0),
(N'Nhà sách Fahasa','0888226853','tpbentre','fahasa@gmail.com',0);
select * from nhaxuatban;
--insert dữ liệu vào bảng thể loại
go
insert into theloai(the_loai,da_xoa)
values (N'Tình cảm',0),
(N'Phiêu lưu',0),
(N'Kinh dị',0),
(N'Chính trị',0),
(N'Công nghệ thông tin',1),
(N'Trinh thám',0),
(N'Sách Giáo Khoa',0),
(N'Tiểu thuyết',0);
--go
select *from theloai;
--ínert dữ liệu bảng tác giả
go
insert into tacgia(ten_tac_gia,tieu_su,da_xoa)
values (N'Vũ Trọng Phụng',N'Vũ Trọng Phụng (1912-1939) là một nhà văn, nhà báo nổi tiếng của Việt Nam vào đầu thế kỷ 20. Tuy thời gian cầm bút rất ngắn ngủi, với tác phẩm đầu tiên là truyện ngắn Chống nạng lên đường đăng trên Ngọ báo vào năm 1930, ông đã để lại một kho tác phẩm đáng kinh ngạc: hơn 30 truyện ngắn, 9 tập tiểu thuyết, 9 tập phóng sự, 7 vở kịch, cùng một bản dịch vở kịch từ tiếng Pháp, một số bài viết phê bình, tranh luận văn học và hàng trăm bài báo viết về các vấn đề chính trị, xã hội, văn hóa. Một số trích đoạn tác phẩm của ông trong các tác phẩm Số đỏ và Giông Tố đã được đưa vào sách giáo khoa môn Ngữ văn của Việt Nam',0),
(N'Ernest Hemingway',N'Ernest Miller Hemingway (21 tháng 7 năm 1899 – 2 tháng 7 năm 1961; phát âm tiếng Việt: Ơ-nít Mi-lơ Hê-minh-uê) là một tiểu thuyết gia người Mỹ, nhà văn viết truyện ngắn và là một nhà báo. Ông là một phần của cộng đồng những người xa xứ ở Paris trong thập niên 20 của thế kỷ XX, và là một trong những cựu quân nhân trong Chiến tranh thế giới I, sau đó được biết đến qua "Thế hệ bỏ đi" (Lost Generation). Ông đã nhận được Giải Pulitzer năm 1953 với tiểu thuyết Ông già và biển cả, và Giải Nobel Văn học năm 1954.',0),
(N'Franz Kafka',N'Franz Kafka (3 tháng 7 năm 1883 – 3 tháng 6 năm 1924) là một nhà văn lớn chuyên viết truyện ngắn và tiểu thuyết bằng tiếng Đức, được giới phê bình đánh giá như một trong những tác giả có tầm ảnh hưởng nhất thế kỉ 20. Kafka là một nhà hiện đại chủ nghĩa và chịu ảnh hưởng mạnh bởi những thể loại khác, bao gồm chủ nghĩa hiện sinh. Các tác phẩm của ông, như Hóa thân (Die Verwandlung), Vụ án (Der Prozess), và Lâu đài (Das Schloss) sử dụng những chủ đề và nguyên mẫu về sự ghẻ lạnh, sự tàn bạo về thể xác và tinh thần, mâu thuẫn cha-con, những nhân vật trong những cuộc truy tìm đáng sợ, và những sự biến đổi kỳ bí.',0),
(N'Tố Hữu',N'Tố Hữu, tên thật là Nguyễn Kim Thành (4 tháng 10 năm 1920 – 9 tháng 12 năm 2002), quê gốc ở làng Phù Lai, nay thuộc xã Quảng Thọ, huyện Quảng Điền, tỉnh Thừa Thiên - Huế. Ông là một nhà thơ tiêu biểu của thơ cách mạng Việt Nam, đồng thời ông còn là một chính khách, một cán bộ cách mạng lão thành. Ông đã từng giữ các chức vụ quan trọng trong hệ thống chính trị của Việt Nam như Ủy viên Bộ Chính trị, Bí thư Ban Chấp hành Trung ương Đảng Cộng sản Việt Nam, Phó Chủ tịch thứ Nhất Hội đồng Bộ trưởng nước Cộng hòa Xã hội Chủ nghĩa Việt Nam.',1),
(N'Ngô Tất Tố',N'Ngô Tất Tố (1894 – 20 tháng 4 năm 1954) là một nhà văn, nhà báo, nhà Nho học, dịch giả và nhà nghiên cứu có ảnh hưởng lớn ở Việt Nam giai đoạn trước 1954.',0),
(N'Nguyễn Du',N'Nguyễn Du (chữ Hán: 阮攸; sinh ngày 3 tháng 1 năm 1766–1820) tên tự Tố Như (素如), hiệu Thanh Hiên (清軒), biệt hiệu Hồng Sơn lạp hộ (鴻山獵戶), Nam Hải điếu đồ (南海釣屠), là một nhà thơ, nhà văn hóa lớn thời Lê mạt, Nguyễn sơ ở Việt Nam. Ông được người Việt kính trọng tôn xưng là "Đại thi hào dân tộc".',0),
(N'Nam Cao',N'Nam Cao (1915 hoặc 1917 – 28 tháng 11 năm 1951) là một nhà văn và cũng là một chiến sĩ, liệt sĩ người Việt Nam. Ông là nhà văn hiện thực lớn (trước Cách mạng), một nhà báo kháng chiến (sau Cách mạng), một trong những nhà văn tiêu biểu nhất thế kỷ 20. Nam Cao có nhiều đóng góp quan trọng đối với việc hoàn thiện phong cách truyện ngắn và tiểu thuyết Việt Nam ở nửa đầu thế kỷ 20.',0)
--insert dữ liệu vào bảng sách
go
select * from tacgia;
go
insert into sach(ten_sach,nam_xuat_ban,so_luong,tac_gia,the_loai,ma_nha_xuat_ban,gia_muon,ngay_nhap,da_xoa)
values (N'Những ngôi sao xa xôi',2007,3,3001,2000,4001,53000,'02/15/2020',0),
	(N'Bí quyết của sự thành công',2010,5,3001,2001,4000,78000,'03/12/2020',0),
	(N'Lập trinh java',2004,50,3000,2001,4003,115000,'03/25/2020',0),
	(N'Chí phèo',2005,100,3006,2004,4004,62000,'03/25/2020',1),
	(N'Đắc nhân tâm',2008,100,3000,2005,4000,55000,'04/03/2020',0);
go
select *from sach;
--insert dữ liệu vào bảng độc giả
go
insert into docgia(gioi_tinh,ten_doc_gia,ngay_sinh,dia_chi,CMND,SDT,da_xoa)
values (1,N'Nguyễn Hiếu Liêm','05/17/2000',N'Tây Ninh','0706960388','0123456789',0),
(0,N'Đoàn Diệp Thế Ngoc','07/05/2000',N'Bến Tre','235893426','0318749107',0),
(0,N'Đỗ Thanh Sơn','03/17/2000',N'Bà Rịa','708343227635','0316662853',1),
(1,N'Trần Công Minh Trí','05/11/2000',N'Bà Rịa','139578934','0272905707',0),
(0,N'Trương Tuấn Kiệt','08/02/2000',N'Tây Ninh','549032498721','0250130406',0);
go
select * from docgia
--insert dữ liệu vào bảng nhân viên
go
insert into nhanvien(ten_nhan_vien,ngay_sinh,dia_chi,gioi_tinh,quanly,sdt,da_xoa)
values (N'Phạm Văn Đồng','02/04/1999',N'Vũng Tàu',0,0,'0873236516',1),
(N'Đặng Hiếu Liêm','08/19/1993',N'Hà Tĩnh',0,1,'0104851245',0),
(N'Đỗ Thanh Sơn','05/07/2001',N'Tiền Giang',1,0,'0643667890',0),
(N'Đoàn Diệp Thế Ngọc','11/04/1987',N'Vũng Tàu',0,0,'0599518093',0);
go
select * from nhanvien
go
--insert dữ liệu vào bảng phiếu mượn 
insert into phieumuon(nhan_vien,doc_gia,ngay_muon,ngay_tra,tong_tien,trang_thai,da_xoa) /* muon sach tinh tien 1000d/ngay*/
values (1002,6004,'6/22/2020','6/28/2020','114000',0,0), /*53.000 + 55.000 + 6.000*/
(1003,6001,'6/2/2020','6/12/2020','63000',0,0),/* 53.000 + 10.000 */
(1002,6003,'6/1/2020','7/15/2020','123000',1,1),/*78.000 + 45.000*/
(1004,6002,'7/13/2020','7/22/2020','124000',0,0),/*115.000 + 9.000*/
(1002,6004,'7/2/2020','8/3/2020','94000',0,0);/*62.000 + 32.000 */
go
select * from phieumuon
--insert dữ liệu vào bản thông tin phiếu mượng
insert into thongtinphieumuon(ma_phieu_muon,ma_sach,da_xoa)
values (7000,5000,0),
(7000,5004,0),
(7002,5003,1),
(7001,5000,0),
(7002,5001,0),
(7003,5002,0),
(7004,5003,0);

go
select * from thongtinphieumuon 
where ma_phieu_muon = 7001



select ten_nhan_vien,ten_doc_gia
from phieumuon,docgia,nhanvien
where docgia.ma_doc_gia=phieumuon.doc_gia and phieumuon.nhan_vien=nhanvien.ma_nhan_vien;


--insert dữ liệu vào bảng quản lý
insert into taikhoan(ma_nhan_vien,tai_khoan,mat_khau,da_xoa)
values (1000,'49484848','48565551505154534954',1),
(1001,'49484849','48494852565349505253',0),
(1002,'49484850','48545251545455565748',0),    /* tk : manv ; mk: sdt */
(1003,'49484851','48535757534956485751',0);

select * from taikhoan;

select * from nhanvien;

select *from sach;
--drop database quanlythuvien

