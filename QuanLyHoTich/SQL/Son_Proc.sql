--Procedure
--Thêm công dân
CREATE or ALTER PROC CongDan_Insert @HoTen NVARCHAR(255), 
							@NgaySinh DATETIME, 
							@GioiTinh BIT, 
							@QueQuan NVARCHAR(255), 
							@ThuongTru NVARCHAR(255), 
							@DanToc NVARCHAR(255) = N'Kinh', 
							@QuocTich NVARCHAR(255), 
							@CMND NVARCHAR(25), 
							@TrangThai BIT = 0
AS BEGIN 
	INSERT INTO dbo.CongDan
	        ( HoTen ,
	          NgaySinh ,
	          GioiTinh ,
	          QueQuan ,
			  ThuongTru,
	          DanToc ,
	          QuocTich ,
	          CMND, 
			  TrangThai
	        )
	VALUES  ( @HoTen , -- HoTen - nvarchar(255)
	          @NgaySinh , -- NgaySinh - datetime
	          @GioiTinh , -- GioiTinh - bit
	          @QueQuan , -- QueQuan - nvarchar(255)
	          @ThuongTru, 
			  @DanToc, 
			  @QuocTich,
			  @CMND,
			  @TrangThai
	        )
END;
Go

CREATE or ALTER PROC CongDan_Update @HoTen NVARCHAR(255), 
							@NgaySinh DATETIME, 
							@GioiTinh BIT, 
							@QueQuan NVARCHAR(255), 
							@ThuongTru NVARCHAR(255), 
							@DanToc NVARCHAR(255) = N'Kinh', 
							@QuocTich NVARCHAR(255), 
							@CMND NVARCHAR(25), 
							@TrangThai BIT = 0,
							@MaCongDan int
AS BEGIN 
	UPDATE dbo.CongDan SET HoTen = @HoTen,
							NgaySinh = @NgaySinh,
							GioiTinh = @GioiTinh,
							QueQuan = @QueQuan,
							ThuongTru = @ThuongTru,
							DanToc = @DanToc,
							QuocTich = @QuocTich,
							CMND = @CMND,
							TrangThai = @TrangThai
	WHERE MaCongDan = @MaCongDan
END

GO
Create procedure CongDan_GetData @HoTen NVARCHAR(255) = NULL, 
							@NgaySinh DATETIME = NULL , 
							@GioiTinh BIT = NULL, 
							@QueQuan NVARCHAR(255) = NULL, 
							@ThuongTru NVARCHAR(255) = NULL, 
							@DanToc NVARCHAR(255) = NULL, 
							@QuocTich NVARCHAR(255) = NULL, 
							@CMND NVARCHAR(25) = NULL, 
							@TrangThai BIT = NULL
AS BEGIN
	DECLARE @Query AS NVARCHAR(MAX)
	DECLARE @ParamList AS NVARCHAR(max)
	SET @Query = 'Select * from CongDan where (1=1) '
	IF(@HoTen IS NOT NULL)
		BEGIN
			SET @HoTen = '%'+@HoTen+'%'
			SET @Query += ' AND (HoTen like @HoTen) '
		END
		
	IF (@NgaySinh IS NOT NULL)
		SET @Query += ' AND (NgaySinh = @NgaySinh) '
	IF (@GioiTinh IS NOT NULL)
		SET @Query += ' AND (GioiTinh = @GioiTinh) '
	IF (@QueQuan IS NOT NULL)
		BEGIN
			SET @QueQuan = '%'+@QueQuan+'%'
			SET @Query += ' AND (QueQuan like @QueQuan) '
		END
	IF (@ThuongTru IS NOT NULL)
		BEGIN
			SET @ThuongTru = '%'+@ThuongTru+'%'
		SET @Query += ' AND (ThuongTru like @ThuongTru) '
		END
	IF (@DanToc IS NOT NULL)
		SET @Query += ' AND (DanToc = @DanToc) '
	IF (@QuocTich IS NOT NULL)
		SET @Query += ' AND (QuocTich = @QuocTich) '
	IF (@CMND IS NOT NULL)
		SET @Query += ' AND (CMND = @CMND) '
	IF (@TrangThai IS NOT NULL)
		SET @Query += ' AND (TrangThai = @TrangThai) '
		  SET @ParamList = '@HoTen NVARCHAR(255), 
							@NgaySinh DATETIME, 
							@GioiTinh BIT, 
							@QueQuan NVARCHAR(255), 
							@ThuongTru NVARCHAR(255), 
							@DanToc NVARCHAR(255), 
							@QuocTich NVARCHAR(255), 
							@CMND NVARCHAR(25), 
							@TrangThai BIT'
	EXEC SP_EXECUTESQL @Query, @ParamList ,@HoTen, @NgaySinh, @GioiTinh, @QueQuan, @ThuongTru, @DanToc, @QuocTich, @CMND, @TrangThai
END


GO
-------------------------------
--Công Chức-- 1. Thêm công chức----2. Sửa công chức
CREATE PROC CongChuc_Insert @HoTen nvarchar(255),
							@NgaySinh DATETIME,
							@GioiTinh BIT,
							@QueQuan NVARCHAR(255),
							@ChucVu NVARCHAR(255),
							@MaBoPhan INT,
							@CMND NVARCHAR(25),
							@TaiKhoan NVARCHAR(255),
							@Pass NVARCHAR(255),
							@Quyen NVARCHAR(255),
							@TrangThai NVARCHAR(255)
AS BEGIN
	INSERT INTO dbo.CongChuc
	        ( HoTen ,
	          NgaySinh ,
	          GioiTinh ,
	          QueQuan ,
	          ChucVu ,
	          MaBoPhan ,
	          CMND ,
	          TaiKhoan ,
	          Pass ,
	          Quyen ,
	          TrangThai
	        )
	VALUES  ( @HoTen , -- HoTen - nvarchar(255)
	          @NgaySinh , -- NgaySinh - datetime
	          @GioiTinh , -- GioiTinh - bit
	          @QueQuan , -- QueQuan - nvarchar(255)
	          @ChucVu , -- ChucVu - nvarchar(255)
	          @MaBoPhan , -- MaBoPhan - int
	          @CMND , -- CMND - nvarchar(25)
	          @TaiKhoan, -- TaiKhoan - nvarchar(255)
	          @Pass, -- Pass - nvarchar(255)
	          @Quyen, -- Quyen - nvarchar(255)
	          @TrangThai-- TrangThai - nvarchar(255)
	        )
END

GO
CREATE PROC CongChuc_Update @HoTen nvarchar(255),
							@NgaySinh DATETIME,
							@GioiTinh BIT,
							@QueQuan NVARCHAR(255),
							@ChucVu NVARCHAR(255),
							@MaBoPhan INT,
							@CMND NVARCHAR(25),
							@TaiKhoan NVARCHAR(255),
							@Pass NVARCHAR(255),
							@Quyen NVARCHAR(255),
							@TrangThai NVARCHAR(255),
							@MaCongChuc INT
AS
BEGIN
	UPDATE CongChuc SET
							Hoten = @HoTen ,
							NgaySinh = @NgaySinh ,
							GioiTinh= @GioiTinh ,
							QueQuan= @QueQuan ,
							ChucVu= @ChucVu ,
							MaBoPhan= @MaBoPhan ,
							CMND= @CMND ,
							TaiKhoan= @TaiKhoan ,
							Pass= @Pass,
							Quyen= @Quyen ,
							TrangThai= @TrangThai
	WHERE MaCongChuc = @MaCongChuc

END;
GO

Create procedure CongChuc_GetData
							@HoTen NVARCHAR(255) = NULL, 
							@NgaySinh DATETIME = NULL , 
							@GioiTinh BIT = NULL, 
							@QueQuan NVARCHAR(255) = NULL, 
							@ChucVu NVARCHAR(255) = NULL,
							@MaBoPhan INT = NULL,
							@CMND NVARCHAR(25) = NULL, 
							@Quyen NVARCHAR(255) = NULL,							
							@TrangThai NVARCHAR(255) = NULL
AS BEGIN
	DECLARE @Query AS NVARCHAR(MAX)
	DECLARE @ParamList AS NVARCHAR(max)
	SET @Query = 'SELECT [MaCongChuc]
				  ,[HoTen]
				  ,[NgaySinh]
				  ,[GioiTinh]
				  ,[QueQuan]
				  ,[ChucVu]
				  ,[MaBoPhan]
				  ,[CMND]      
				  ,[Quyen]
				  ,[TrangThai]
			  FROM [qlhotich].[dbo].[CongChuc] where (1=1) '
	IF(@HoTen IS NOT NULL)
		BEGIN
			SET @HoTen = '%'+@HoTen+'%'
			SET @Query += ' AND (HoTen like @HoTen) '
		END
		
	IF (@NgaySinh IS NOT NULL)
		SET @Query += ' AND (NgaySinh = @NgaySinh) '
	IF (@GioiTinh IS NOT NULL)
		SET @Query += ' AND (GioiTinh = @GioiTinh) '
	IF (@QueQuan IS NOT NULL)
		BEGIN
			SET @QueQuan = '%'+@QueQuan+'%'
			SET @Query += ' AND (QueQuan like @QueQuan) '
		END
	IF (@ChucVu IS NOT NULL)
			SET @Query += ' AND (ChucVu like @ChucVu) '
	IF (@MaBoPhan IS NOT NULL)
		SET @Query += ' AND (MaBoPhan = @MaBoPhan) '
	IF (@CMND IS NOT NULL)
		SET @Query += ' AND (CMND = @CMND) '
	IF (@MaBoPhan IS NOT NULL)
		SET @Query += ' AND (MaBoPhan = @MaBoPhan) '
	IF (@Quyen IS NOT NULL)
		SET @Query += ' AND (Quyen = @Quyen) '
	IF (@TrangThai IS NOT NULL)
		SET @Query += ' AND (TrangThai = @TrangThai) '
		  SET @ParamList = '@HoTen NVARCHAR(255), 
							@NgaySinh DATETIME, 
							@GioiTinh BIT, 
							@QueQuan NVARCHAR(255), 
							@ChucVu NVARCHAR(255),
							@MaBoPhan INT,
							@CMND NVARCHAR(25), 
							@Quyen NVARCHAR(255),							
							@TrangThai NVARCHAR(255)'
	EXEC SP_EXECUTESQL @Query, @ParamList ,@HoTen, @NgaySinh,@GioiTinh,@QueQuan, @ChucVu,@MaBoPhan,@CMND, @Quyen,	@TrangThai
END


 GO

 Proc_CongChuc_DangNhap 'Quang','1'
 
Alter PROC Proc_CongChuc_DangNhap @TaiKhoan NVARCHAR(255), @Pass NVARCHAR(255)
AS
BEGIN
	SELECT MaCongChuc FROM dbo.CongChuc WHERE TaiKhoan = @TaiKhoan AND Pass = @Pass
END