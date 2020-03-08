
create database [qlhotich]
go
use [qlhotich]
go


create table CongDan
(
MaCongDan int primary KEY IDENTITY(1,1),
HoTen  nvarchar(255),
NgaySinh Datetime,
GioiTinh bit,
QueQuan nvarchar(255),
ThuongTru NVARCHAR(255),
DanToc nvarchar(255),
QuocTich nvarchar(255),
CMND nvarchar(25),
TrangThai BIT  ---Trạng thái công dân:    0: chưa duyệt. 1: OK, 
);
 go

 create table ThuTuc
 (
 MaThuTuc int primary KEY IDENTITY(1,1),
 TenThuTuc nvarchar(255) 
 );
 GO
 
 create table CongChuc
 (
 MaCongChuc INT PRIMARY KEY IDENTITY(1,1),
 HoTen NVARCHAR(255),
 NgaySinh Datetime,
 GioiTinh bit,
 QueQuan nvarchar(255),
 ChucVu nvarchar(255),
 MaBoPhan int,
 CMND NVARCHAR(25),
 TaiKhoan NVARCHAR(255),
 Pass nvarchar(255),
 Quyen nvarchar(255),
 TrangThai NVARCHAR(255),
 );
 go

 create table BoPhan
 (
 MaBoPhan int primary KEY IDENTITY(1,1),
 TenVietTat NVARCHAR(25),
 TenBoPhan nvarchar(255)
 );
 GO
 
 INSERT INTO dbo.BoPhan
         ( TenVietTat, TenBoPhan )
 VALUES  (N'TN&TKQ', N'Bộ phận tiếp nhận và trả KQ'), (N'CCCX', N'Công chức cấp xã'), (N'LD', N'Lãnh đạo'), (N'VP', N'Bộ phận văn phòng'),(N'KTTC', N'Bộ phận tài chính - kế toán')
 
 create table LePhi   --Hoa don le phi
 (
 MaLePhi INt primary KEY IDENTITY(1,1),
 NgayLap Datetime,
 MaCongDan INT,
 MaCongChuc int
 );

 go
 create table CTLP   -- chi tiet le phi
 (
 MaCTLePhi int primary KEY IDENTITY(1,1),
 MaThuTuc int,
 MaLePhi  int,
 LyDoNop nvarchar(255),
 SoTienNop float
 );
 go

 create table KhaiSinh
 (
 MaKhaiSinh int primary KEY IDENTITY(1,1),
 HoTen nvarchar(255),
 NgaySinh datetime,
 GioiTinh bit,
 DanToc nvarchar(255),
 QuocTich nvarchar(255),
 QueQuan nvarchar(255),
 IDNguoiMe INT,
 IDNguoiCha int,
 MaThuTuc INT,
 NgayDangKy DATETIME,
 MaCongDan INT, 
 MaCongChucTiepNhan INT, 
 MaCongChucXacMinh INT,
 MaLanhDao INT,
 MaCongChucVanPhong INT,
 MaCongChucKTTC INT,
 TrangThai int
 );
 go 
 create table KhaiTu
 (
 MaKT int primary KEY IDENTITY(1,1),
 IDNguoiChet INT,
 NoiCuTruCuoiCung nvarchar(255),
 ThoiGianChet datetime,
 NoiChet nvarchar(255),
 NguyenNhan nvarchar(255),
MaThuTuc INT,
 NgayDangKy DATETIME,
 MaCongDan INT, 
 MaCongChucTiepNhan INT, 
 MaCongChucXacMinh INT,
 MaLanhDao INT,
 MaCongChucVanPhong INT,
  MaCongChucKTTC INT,
  TrangThai int
 );
 go
 create table KetHon
 (
 MaKH int primary KEY IDENTITY(1,1),
 IDNguoiChong INT,
 LanKetHonChong INT,
 IDNguoiVo INT,
 LanKetHonVo INT,
 MaThuTuc INT,
 NgayDangKy DATETIME,
 MaCongDan INT, 
 MaCongChucTiepNhan INT, 
 MaCongChucXacMinh INT,
 MaLanhDao INT,
 MaCongChucVanPhong INT,
  MaCongChucKTTC INT,
  TrangThai int
 );
 go
 create table GiamHo
 (
 MaGH INT primary KEY IDENTITY(1,1),
 IDNguoiGiamHo int,
 IDNguoiDuocGiamHo INT,
 MaThuTuc INT,
 NgayDangKy DATETIME,
 MaCongDan INT, 
 MaCongChucTiepNhan INT, 
 MaCongChucXacMinh INT,
 MaLanhDao INT,
 MaCongChucVanPhong INT,
  MaCongChucKTTC INT,
  TrangThai int
 );
 go

 CREATE TABLE TrangThai(
	MaTrangThai INT PRIMARY KEY,
    TrangThai NVARCHAR(50)
 );
 GO
 
 INSERT INTO TrangThai VALUES(0, 'Tiếp nhận hồ sơ'),(1, 'Đã xác minh hồ sơ'),(2, 'Xác minh hồ sơ thất bại'),(3, 'Đã duyệt'),(4, 'Duyệt thất bại'),(5, 'Xong'),(6, 'Đã thanh toán')
 ;
 GO

 -- constraint 
 alter table KhaiSinh
 add constraint fr_khaisinh_thutuc
 foreign key (MaThuTuc)
 references ThuTuc(MaThuTuc)
 go 

 alter table KhaiSinh
 add constraint fr_khaisinh_congdan
 foreign key(MaCongDan)
 references CongDan(MaCongDan)


 go 

  alter table KhaiTu
 add constraint Fr_Khaitu_Thutuc
 foreign key (MaThuTuc)
 references ThuTuc(MaThuTuc)
 
 go 
 alter table KhaiTu
 add constraint Fr_Khaitu_Congdan
 foreign key (MaCongDan)
 references CongDan(MaCongDan)
 go 

 alter table GiamHo
 add constraint Fr_Giamho_Congdan
 foreign key(MaCongDan)
 references CongDan(MaCongDan)

 go

  alter table GiamHo
 add constraint fr_Giamho_Thutuc
 foreign key(MaThuTuc)
 references ThuTuc(MaThuTuc)

 go

 alter table KetHon
 add constraint Fr_Kethon_Thutuc
 foreign key(MaThuTuc)
 references thutuc(MaThuTuc)

 go
  alter table KetHon
 add constraint Fr_KetHon_CongDan
 foreign key(MaCongDan)
 references CongDan(MaCongDan)
 
go

  alter table LePhi
 add constraint Fr_congdan_lephi
 foreign key(MaCongDan)
 references CongDan(MaCongDan)


 go
  alter table CTLP
 add constraint Fr_Ctlp_Thutuc
 foreign key(MaThuTuc)
 references thutuc(MaThuTuc)



 go 
 alter table CTLP
 add constraint Fr_Ctlp_Lp
 foreign key(MaLePhi)
 references LePhi(MaLePhi)

go

 alter table LePhi
 add constraint Fr_Lp_CC
 foreign key(MaCongChuc)
 references CongChuc(MaCongChuc)

 go
  alter table CongChuc
 add constraint Fr_CongChuc_Bophan
 foreign key(MaBoPhan)
 references BoPhan(MaBoPhan)


 go


ALTER TABLE dbo.KhaiSinh  ADD CONSTRAINT fr_KhaiSinh_CongChuc_TiepNhan FOREIGN KEY(MaCongChucTiepNhan) REFERENCES dbo.CongChuc(MaCongChuc); 
ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_CongChuc_XacMinh FOREIGN KEY(MaCongChucXacMinh) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_CongChuc_LanhDao FOREIGN KEY(MaLanhDao) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_CongChuc_VanPhong FOREIGN KEY(MaCongChucVanPhong) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_CongChuc_KTTC FOREIGN KEY(MaCongChucKTTC) REFERENCES dbo.CongChuc(MaCongChuc) ;
ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_TrangThai FOREIGN KEY(TrangThai) REFERENCES dbo.TrangThai(MaTrangThai);
 

ALTER TABLE dbo.KhaiTu  ADD CONSTRAINT fr_KhaiTu_CongChuc_TiepNhan FOREIGN KEY(MaCongChucTiepNhan) REFERENCES dbo.CongChuc(MaCongChuc); 
ALTER TABLE dbo.KhaiTu ADD CONSTRAINT fr_KhaiTu_CongChuc_XacMinh FOREIGN KEY(MaCongChucXacMinh) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KhaiTu ADD CONSTRAINT fr_KhaiTu_CongChuc_LanhDao FOREIGN KEY(MaLanhDao) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KhaiTu ADD CONSTRAINT fr_KhaiTu_CongChuc_VanPhong FOREIGN KEY(MaCongChucVanPhong) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KhaiTu ADD CONSTRAINT fr_KhaiTu_CongChuc_KTTC FOREIGN KEY(MaCongChucKTTC) REFERENCES dbo.CongChuc(MaCongChuc) ;
ALTER TABLE dbo.KhaiTu ADD CONSTRAINT fr_KhaiTu_TrangThai FOREIGN KEY(TrangThai) REFERENCES dbo.TrangThai(MaTrangThai);


ALTER TABLE dbo.KetHon  ADD CONSTRAINT fr_KetHon_CongChuc_TiepNhan FOREIGN KEY(MaCongChucTiepNhan) REFERENCES dbo.CongChuc(MaCongChuc); 
ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_CongChuc_XacMinh FOREIGN KEY(MaCongChucXacMinh) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_CongChuc_LanhDao FOREIGN KEY(MaLanhDao) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_CongChuc_VanPhong FOREIGN KEY(MaCongChucVanPhong) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_CongChuc_KTTC FOREIGN KEY(MaCongChucKTTC) REFERENCES dbo.CongChuc(MaCongChuc) ;
ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_TrangThai FOREIGN KEY(TrangThai) REFERENCES dbo.TrangThai(MaTrangThai);


ALTER TABLE dbo.GiamHo  ADD CONSTRAINT fr_GiamHo_CongChuc_TiepNhan FOREIGN KEY(MaCongChucTiepNhan) REFERENCES dbo.CongChuc(MaCongChuc); 
ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_CongChuc_XacMinh FOREIGN KEY(MaCongChucXacMinh) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_CongChuc_LanhDao FOREIGN KEY(MaLanhDao) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_CongChuc_VanPhong FOREIGN KEY(MaCongChucVanPhong) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_CongChuc_KTTC FOREIGN KEY(MaCongChucKTTC) REFERENCES dbo.CongChuc(MaCongChuc);
ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_TrangThai FOREIGN KEY(TrangThai) REFERENCES dbo.TrangThai(MaTrangThai);

ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_CongDan_Me FOREIGN KEY (IDNguoiMe) REFERENCES dbo.CongDan(MaCongDan);
ALTER TABLE dbo.KhaiSinh ADD CONSTRAINT fr_KhaiSinh_CongDan_Cha FOREIGN KEY (IDNguoiCha) REFERENCES dbo.CongDan(MaCongDan);
ALTER TABLE dbo.KhaiTu ADD CONSTRAINT fr_KhaiTu_CongDan_NguoiChet FOREIGN KEY (IDNguoiChet) REFERENCES dbo.CongDan(MaCongDan);

ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_CongDan_Chong FOREIGN KEY (IDNguoiChong) REFERENCES dbo.CongDan(MaCongDan);
ALTER TABLE dbo.KetHon ADD CONSTRAINT fr_KetHon_CongDan_Vo FOREIGN KEY (IDNguoiVo) REFERENCES dbo.CongDan(MaCongDan);

ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_CongDan_NguoiGiamHo FOREIGN KEY (IDNguoiGiamHo) REFERENCES dbo.CongDan(MaCongDan);
ALTER TABLE dbo.GiamHo ADD CONSTRAINT fr_GiamHo_CongDan_NguoiDuocGiamHo FOREIGN KEY (IDNguoiDuocGiamHo) REFERENCES dbo.CongDan(MaCongDan);