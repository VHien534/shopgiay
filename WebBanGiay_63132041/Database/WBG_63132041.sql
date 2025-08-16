create database WebBanGiay_63132041 on (
	name='WebBanGiay_63132041data',
	filename='F:\WebBanGiay_63132041\Database\WebBanGiay_63132041.mdf'
)
log on (
	name='WebBanGiay_63132041log',
	filename='F:\WebBanGiay_63132041\Database\WebBanGiay_63132041.ldf'
);
go
use WebBanGiay_63132041;
go
CREATE TABLE LoaiSanPham (
    MaLoaiSP varchar(8) PRIMARY KEY NOT NULL,
    TenLoai NVARCHAR(100),
    MoTa NTEXT
);
go
CREATE TABLE NhaCungCap (
    MaNCC		varchar(8) PRIMARY KEY ,
    TenNCC		NVARCHAR(100),
	EmailNCC	nvarchar(100),
    SDTNCC		nvarchar(20),
	DiaChiNCC	nvarchar(100)
);
go
CREATE TABLE PhanQuyen (
    MaQuyen	 INT PRIMARY KEY IDENTITY,
    TenQuyen NVARCHAR(50)
);
go
CREATE TABLE SanPham (
    MaSP varchar(8) PRIMARY KEY,
    TenSP NVARCHAR(100),
    MoTa NTEXT,
    GiaTien DECIMAL(18, 2),
    SoLuong INT,
	TrangThai bit,
    MaNCC varchar(8),
    MaLoaiSP varchar(8),
    HinhAnh nvarchar(50),
    CONSTRAINT SANPHAM_NCC_FK FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
    CONSTRAINT SANPHAM_LOAISP_FK FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSanPham(MaLoaiSP)
);
GO
CREATE TABLE NguoiDung (
    MaNguoiDung varchar(8) PRIMARY KEY,
	HoTenND	nvarchar(100),
    TenDangNhap NVARCHAR(50),
    Email NVARCHAR(50),
	DiaChiND nvarchar(100),
    MatKhau NVARCHAR(50),
    MaQuyen INT,
    CONSTRAINT NGUOIDUNG_PHANQUYEN_FK FOREIGN KEY (MaQuyen) REFERENCES PhanQuyen(MaQuyen)
);
GO
CREATE TABLE DonHang (
    MaDH varchar(8) PRIMARY KEY,
	MaNguoiDung varchar(8),
	DiaChiDH nvarchar(100),
    NgayDat DATE,
    TinhTrang BIT,
    CONSTRAINT DONHANG_NGUOIDUNG_FK FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);
GO
CREATE TABLE ChiTietDonHang (
    MaDH varchar(8),
    MaSP varchar(8),
    SoLuong INT,
    DonGia DECIMAL(18, 2),
	ThanhTien DECIMAL(10,2),
    PRIMARY KEY (MaDH, MaSP),
    CONSTRAINT CTDH_DONHANG_FK FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    CONSTRAINT CTDT_SANPHAM_FK FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO
INSERT INTO LoaiSanPham (MaLoaiSP, TenLoai, MoTa) VALUES
('GTTN', N'Giày Thể Thao Nam', N'Giày Thể Thao Nam Vải Dệt'),
('GMN', N'Giày mọi nam', N'Giày Mọi Nam Đế Cao'),
('GCG', N'Giày cao gót', N'Giày cao gót mũi tròn Oval'),
('GSN', N'Giày sandal nam', N'Sandal Nam Quai Ngang'),
('GT', N'Giày Tây', N'Giày Tây'),
('BN', N'Boot Nam', N'Boot Nam'),
('SDN', N'Sandal nữ', N'Sandal nữ'),
('DS', N'Dép sục', N'Dép sục'),
('BNU', N'Boot nữ', N'Boot nữ'),
('GBP', N'Giày búp bê', N'Giày búp bê'),
('DN', N'Dép nữ', N'Dép nữ');
GO
INSERT INTO NhaCungCap (MaNCC, TenNCC, EmailNCC, SDTNCC, DiaChiNCC) VALUES
('NCC001', 'Adidas', N'info@adidas.com', '123456789', N'Adidas AG, Adi-Dassler-Strasse 1, 91074 Herzogenaurach, Germany'),
('NCC002', 'Nike', N'info@nike.com', '987654321', N'One Bowerman Drive, Beaverton, OR 97005, USA'),
('NCC003', 'Puma', N'info@puma.com', '555555555', N'Puma SE, PUMA Way 1, 91074 Herzogenaurach, Germany'),
('NCC004', 'Under Armour', N'info@ua.com', '111111111', N'1020 Hull Street, Baltimore, MD 21230, USA'),
('NCC005', 'New Balance', N'info@nb.com', '222222222', N'100 Guest Street, Boston, MA 02135, USA'),
('NCC006', 'Vans', N'info@vans.com', '333333333', N'1588 South Coast Drive, Costa Mesa, CA 92626, USA'),
('NCC007', 'Skechers', N'info@skechers.com', '444444444', N'Skechers USA, Inc, 225 S. Sepulveda Blvd, Manhattan Beach, CA 90266, USA');
GO
INSERT INTO PhanQuyen (TenQuyen) VALUES
(N'Quản trị viên'),
(N'Nhân viên bán hàng'),
(N'Khách hàng');
GO
INSERT INTO SanPham (MaSP, TenSP, MoTa, GiaTien, SoLuong, TrangThai, MaNCC, MaLoaiSP, HinhAnh) VALUES
-- Giày Thể Thao Nam
('SP001', N'Giày Thể Thao Nam - 5701', N'Giày Thể Thao Nam Vải Dệt Thoáng Khí, Sneaker Nam Cổ Thấp Năng Động Cá Tính', 1200000, 30, 1, 'NCC001', 'GTTN', N'mwc (1).jpg'),
('SP002', N'Giày Thể Thao Nam - 5702', N'Giày Thể Thao Nam Vải Dệt Thoáng Khí, Sneaker Nam Cổ Thấp Năng Động Cá Tính', 1100000, 25, 1, 'NCC007', 'GTTN', N'mwc (2).jpg'),
('SP003', N'Giày Thể Thao Nam - 5703', N'Giày Thể Thao Nam Vải Dệt Thoáng Khí, Sneaker Nam Cổ Thấp Năng Động Cá Tính', 1300000, 20, 1, 'NCC007', 'GTTN', N'mwc (3).jpg'),
('SP004', N'Giày Thể Thao Nam - 5704', N'Giày Thể Thao Nam Vải Dệt Thoáng Khí, Sneaker Nam Cổ Thấp Năng Động Cá Tính', 1250000, 28, 1, 'NCC003', 'GTTN', N'mwc (4).jpg'),
('SP005', N'Giày Thể Thao Nam - 5705', N'Giày Thể Thao Nam Vải Dệt Thoáng Khí, Sneaker Nam Cổ Thấp Năng Động Cá Tính', 1350000, 22, 1, 'NCC005', 'GTTN', N'mwc (5).jpg'),
-- Giày mọi nam
('SP006', N'Giày mọi nam-1001', N'Giày Mọi Nam Đế Cao Mũi Nhọn Da Mềm, Phối Dây Cách Điệu Thời Trang Thanh Lịch', 3000000, 40, 1, 'NCC001', 'GMN', N'dellp2419h.jpg'),
('SP007', N'Giày mọi nam-1002', N'Giày Mọi Nam Đế Cao Mũi Nhọn Da Mềm, Phối Dây Cách Điệu Thời Trang Thanh Lịch', 2500000, 35, 1, 'NCC004', 'GMN', N'lg27gl850.jpg'),
('SP008', N'Giày mọi nam-1003', N'Giày Mọi Nam Đế Cao Mũi Nhọn Da Mềm, Phối Dây Cách Điệu Thời Trang Thanh Lịch', 1000000, 30, 1, 'NCC007', 'GMN', N'asusvg279qm.jpg'),
('SP009', N'Giày mọi nam-1004', N'Giày Mọi Nam Đế Cao Mũi Nhọn Da Mềm, Phối Dây Cách Điệu Thời Trang Thanh Lịch', 2500000, 32, 1, 'NCC004', 'GMN', N'samsungodysseyg7.jpg'),
('SP010', N'Giày mọi nam-1005', N'Giày Mọi Nam Đế Cao Mũi Nhọn Da Mềm, Phối Dây Cách Điệu Thời Trang Thanh Lịch', 3250000, 38, 1, 'NCC002', 'GMN', N'aoc24g2.jpg'),
-- Giày cao gót
('SP011', N'Giày cao gót-2001', N'Giày cao gót mũi tròn Oval kiểu dáng Basic,phối quai hậu 2 trong 1', 500000, 50, 1, 'NCC005', 'GCG', N'logitechg502hero.jpg'),
('SP012', N'Giày cao gót-2002', N'Giày cao gót mũi tròn Oval kiểu dáng Basic,phối quai hậu 2 trong 1', 550000, 45, 1, 'NCC006', 'GCG', N'steelseriesrival3.jpg'),
('SP013', N'Giày cao gót-2003', N'Giày cao gót mũi tròn Oval kiểu dáng Basic,phối quai hậu 2 trong 1', 850000, 55, 1, 'NCC005', 'GCG', N'razerdeathadderv2.jpg'),
('SP014', N'Giày cao gót-2004', N'Giày cao gót mũi tròn Oval kiểu dáng Basic,phối quai hậu 2 trong 1', 580000, 60, 1, 'NCC005', 'GCG', N'corsairsabrergb.jpg'),
('SP015', N'Giày cao gót-2005', N'Giày cao gót mũi tròn Oval kiểu dáng Basic,phối quai hậu 2 trong 1', 750000, 48, 1, 'NCC005', 'GCG', N'hyperxpulsefirefpspro.jpg'),
-- Giày sandal nam
('SP016', N'Giày sandal nam-3001', N'Sandal Nam Quai Ngang Chéo Phối Lót Dán Thời Trang Kiểu Dáng Streetwear Đế Mềm Mại', 7300000, 40, 1, 'NCC002', 'GSN', N'amdryzen55600x.jpg'),
('SP017', N'Giày sandal nam-3002', N'Sandal Nam Quai Ngang Chéo Phối Lót Dán Thời Trang Kiểu Dáng Streetwear Đế Mềm Mại', 3500000, 42, 1, 'NCC001', 'GSN', N'intelcorei511400.jpg'),
('SP018', N'Giày sandal nam-3003', N'Sandal Nam Quai Ngang Chéo Phối Lót Dán Thời Trang Kiểu Dáng Streetwear Đế Mềm Mại', 9400000, 38, 1, 'NCC002', 'GSN', N'amdryzen75800x.jpg'),
('SP019', N'Giày sandal nam-3004', N'Sandal Nam Quai Ngang Chéo Phối Lót Dán Thời Trang Kiểu Dáng Streetwear Đế Mềm Mại', 12900000, 36, 1, 'NCC001', 'GSN', N'intelcorei911900k.jpg'),
('SP020', N'Giày sandal nam-3005', N'Sandal Nam Quai Ngang Chéo Phối Lót Dán Thời Trang Kiểu Dáng Streetwear Đế Mềm Mại', 11900000, 34, 1, 'NCC002', 'GSN', N'amdryzen95900x.jpg'),
-- Giày Tây
('SP021', N'Giày Tây-4001', N'Giày Mọi Nam Cao Cấp, Giày Da Slip On Công Sở Lịch Lãm, Thời Trang', 1500000, 60, 1, 'NCC005', 'GT', N'corsairvengeancelpx16gb.jpg'),
('SP022', N'Giày Tây-4002', N'Giày Mọi Nam Cao Cấp, Giày Da Slip On Công Sở Lịch Lãm, Thời Trang', 2600000, 55, 1, 'NCC005', 'GT', N'gskilltridentzrgb32gb.jpg'),
('SP023', N'Giày Tây-4003', N'Giày Mọi Nam Cao Cấp, Giày Da Slip On Công Sở Lịch Lãm, Thời Trang', 2400000, 57, 1, 'NCC003', 'GT', N'crucialballistix32gb.jpg'),
('SP024', N'Giày Tây-4004', N'Giày Mọi Nam Cao Cấp, Giày Da Slip On Công Sở Lịch Lãm, Thời Trang', 800000, 62, 1, 'NCC006', 'GT', N'kingstonhyperxfury8gb.jpg'),
('SP025', N'Giày Tây-4005', N'Giày Mọi Nam Cao Cấp, Giày Da Slip On Công Sở Lịch Lãm, Thời Trang', 1800000, 58, 1, 'NCC006', 'GT', N'teamtforcedeltargb16gb.jpg'),
-- Boot Nam
('SP026', N'Boot Nam-6001', N'Giày Boot Da Nam Cao Cấp Siêu Bền Đẹp, Oxford Nam Cổ Cao Phong Cách Cá Tính, Thời Trang', 1800000, 70, 1, 'NCC005', 'BN', N'wdblue1tb.jpg'),
('SP027', N'Boot Nam-6002', N'Giày Boot Da Nam Cao Cấp Siêu Bền Đẹp, Oxford Nam Cổ Cao Phong Cách Cá Tính, Thời Trang', 3000000, 65, 1, 'NCC001', 'BN', N'crucialmx5002tb.jpg'),
('SP028', N'Boot Nam-6003', N'Giày Boot Da Nam Cao Cấp Siêu Bền Đẹp, Oxford Nam Cổ Cao Phong Cách Cá Tính, Thời Trang', 1500000, 75, 1, 'NCC004', 'BN', N'samsung970evoplus500gb.jpg'),
('SP029', N'Boot Nam-6004', N'Giày Boot Da Nam Cao Cấp Siêu Bền Đẹp, Oxford Nam Cổ Cao Phong Cách Cá Tính, Thời Trang', 1900000, 72, 1, 'NCC006', 'BN', N'adataxpgsx8200pro1tb.jpg'),
('SP030', N'Boot Nam-6005', N'Giày Boot Da Nam Cao Cấp Siêu Bền Đẹp, Oxford Nam Cổ Cao Phong Cách Cá Tính, Thời Trang', 1200000, 78, 1, 'NCC006', 'BN', N'kingstona2000500gb.jpg'),
-- Sandal nữ
('SP031', N'Sandal nữ-7001', N'Sandal Nữ Da Mềm Siêu Bền Đẹp, Sandal Nữ Đế Bằng Đi Học, Đi Chơi Thanh Lịch Thời trang', 1800000, 80, 1, 'NCC007', 'SDN', N'asusprimeb560ma.jpg'),
('SP032', N'Sandal nữ-7002', N'Sandal Nữ Da Mềm Siêu Bền Đẹp, Sandal Nữ Đế Bằng Đi Học, Đi Chơi Thanh Lịch Thời trang', 2500000, 85, 1, 'NCC002', 'SDN', N'msipggb550gamingplus.jpg'),
('SP033', N'Sandal nữ-7003', N'Sandal Nữ Da Mềm Siêu Bền Đẹp, Sandal Nữ Đế Bằng Đi Học, Đi Chơi Thanh Lịch Thời trang', 1700000, 75, 1, 'NCC002', 'SDN', N'gigabyteb450aoruselite.jpg'),
('SP034', N'Sandal nữ-7004', N'Sandal Nữ Da Mềm Siêu Bền Đẹp, Sandal Nữ Đế Bằng Đi Học, Đi Chơi Thanh Lịch Thời trang', 2000000, 82, 1, 'NCC001', 'SDN', N'asrockb460mpro4.jpg'),
('SP035', N'Sandal nữ-7005', N'Sandal Nữ Da Mềm Siêu Bền Đẹp, Sandal Nữ Đế Bằng Đi Học, Đi Chơi Thanh Lịch Thời trang', 3000000, 88, 1, 'NCC002', 'SDN', N'biostarracingx570gt8.jpg'),
-- Dép sục
('SP036', N'Dép sục-8001', N'Dép Sục Nữ Phối Quai Cài Ngang Đính Nơ Tiểu Thư Xinh Xắn, Dép Sục Nữ Mũi Tròn Oval Trẻ Trung Thanh Lịch, Thời trang', 3200000, 50, 1, 'NCC007', 'DS', N'asustufgtx1660.jpg'),
('SP037', N'Dép sục-8002', N'Dép Sục Nữ Phối Quai Cài Ngang Đính Nơ Tiểu Thư Xinh Xắn, Dép Sục Nữ Mũi Tròn Oval Trẻ Trung Thanh Lịch, Thời trang', 7500000, 46, 1, 'NCC001', 'DS', N'gigabyteradeonrx6700xt.jpg'),
('SP038', N'Dép sục-8003', N'Dép Sục Nữ Phối Quai Cài Ngang Đính Nơ Tiểu Thư Xinh Xắn, Dép Sục Nữ Mũi Tròn Oval Trẻ Trung Thanh Lịch, Thời trang', 22000000, 42, 1, 'NCC001', 'DS', N'msirtx3080gamingxtrio.jpg'),
('SP039', N'Dép sục-8004', N'Dép Sục Nữ Phối Quai Cài Ngang Đính Nơ Tiểu Thư Xinh Xắn, Dép Sục Nữ Mũi Tròn Oval Trẻ Trung Thanh Lịch, Thời trang', 14000000, 48, 1, 'NCC004', 'DS', N'zotacrtx3060twinedge.jpg'),
('SP040', N'Dép sục-8005', N'Dép Sục Nữ Phối Quai Cài Ngang Đính Nơ Tiểu Thư Xinh Xắn, Dép Sục Nữ Mũi Tròn Oval Trẻ Trung Thanh Lịch, Thời trang', 30000000, 44, 1, 'NCC004', 'DS', N'powercolorrx6900xtreddevil.jpg'),
-- Boot nữ
('SP041', N'Boot nữ-9001', N'Da Lì Đế Bánh Mì Phối Khóa Cách Điệu Kiểu Dáng Nữ Tính Thời Trang', 1900000, 65, 1, 'NCC005', 'BNU', N'corsairrm750x750w.jpg'),
('SP042', N'Boot nữ-9002', N'Da Lì Đế Bánh Mì Phối Khóa Cách Điệu Kiểu Dáng Nữ Tính Thời Trang', 1700000, 68, 1, 'NCC001', 'BNU', N'evgasupernova650g5.jpg'),
('SP043', N'Boot nữ-9003', N'Da Lì Đế Bánh Mì Phối Khóa Cách Điệu Kiểu Dáng Nữ Tính Thời Trang', 2400000, 72, 1, 'NCC006', 'BNU', N'seasonicfocusgx850.jpg'),
('SP044', N'Boot nữ-9004', N'Da Lì Đế Bánh Mì Phối Khóa Cách Điệu Kiểu Dáng Nữ Tính Thời Trang', 2000000, 70, 1, 'NCC001', 'BNU', N'coolermastermwegold750v2.jpg'),
('SP045', N'Boot nữ-9005', N'Da Lì Đế Bánh Mì Phối Khóa Cách Điệu Kiểu Dáng Nữ Tính Thời Trang', 2200000, 75, 1, 'NCC006', 'BNU', N'thermaltaketoughpowergf1850w.jpg'),
-- Giày búp bê
('SP046', N'Giày búp bê-0001', N'Giày Búp Bê Đế Bệt Mũi Oval Đính Khóa Nơ Nhỏ Xinh Thanh Lịch, Thời Trang', 1500000, 80, 1, 'NCC001', 'GBP', N'nzxt510.jpg'),
('SP047', N'Giày búp bê-0002', N'Giày Búp Bê Đế Bệt Mũi Oval Đính Khóa Nơ Nhỏ Xinh Thanh Lịch, Thời Trang', 1800000, 85, 1, 'NCC002', 'GBP', N'phantekseclipsep400a.jpg'),
('SP048', N'Giày búp bê-0003', N'Giày Búp Bê Đế Bệt Mũi Oval Đính Khóa Nơ Nhỏ Xinh Thanh Lịch, Thời Trang', 2000000, 75, 1, 'NCC005', 'GBP', N'corsaircarbideseriesspec06.jpg'),
('SP049', N'Giày búp bê-0004', N'Giày Búp Bê Đế Bệt Mũi Oval Đính Khóa Nơ Nhỏ Xinh Thanh Lịch, Thời Trang', 2200000, 78, 1, 'NCC001', 'GBP', N'coolermastermasterboxmb511argb.jpg'),
('SP050', N'Giày búp bê-0005', N'Giày Búp Bê Đế Bệt Mũi Oval Đính Khóa Nơ Nhỏ Xinh Thanh Lịch, Thời Trang', 1900000, 82, 1, 'NCC002', 'GBP', N'fractaldesignmeshifyc.jpg');
GO
INSERT INTO NguoiDung (MaNguoiDung, HoTenND, TenDangNhap, Email, DiaChiND, MatKhau, MaQuyen)
VALUES
    ('ND001', N'Nguyễn Thị Hương', N'huongnt', N'huongnt@gmail.com', N'123 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', N'Huong123', 1),
    ('ND002', N'Võ Văn Tuấn', N'tuanvv', N'tuanvv@gmail.com', N'456 Đường Nguyễn Huệ, Quận 2, Thành phố Hà Nội', N'Tuan456', 3),
    ('ND003', N'Hoàng Thị Mai', N'maiht', N'maiht@gmail.com', N'789 Đường Trần Hưng Đạo, Quận 3, Thành phố Đà Nẵng', N'Mai789', 3),
    ('ND004', N'Lê Văn Hoàng', N'hoanglv', N'hoanglv@gmail.com', N'321 Đường Lý Tự Trọng, Quận 4, Thành phố Cần Thơ', N'Hoang0123', 3),
    ('ND005', N'Nguyễn Thị Trang', N'trangnt', N'trangnt@gmail.com', N'654 Đường Lê Hồng Phong, Quận 5, Thành phố Vũng Tàu', N'Trang345', 3),
    ('ND006', N'Trần Văn Nam', N'namtv', N'namtv@gmail.com', N'987 Đường Phạm Văn Đồng, Quận 6, Thành phố Hồ Chí Minh', N'Nam678', 3),
    ('ND007', N'Phạm Thị Lan', N'lanpt', N'lanpt@gmail.com', N'234 Đường Nguyễn Công Trứ, Quận 7, Thành phố Hà Nội', N'Lan901', 3),
    ('ND008', N'Đặng Văn Đức', N'ducdv', N'ducdv@gmail.com', N'567 Đường Lê Văn Việt, Quận 8, Thành phố Đà Nẵng', N'Duc234', 3),
    ('ND009', N'Lê Thị Hoa', N'hoalth', N'hoalth@gmail.com', N'876 Đường Nguyễn Văn Linh, Quận 9, Thành phố Cần Thơ', N'Hoa567', 3),
    ('ND010', N'Nguyễn Văn Đạt', N'datnv', N'datnv@gmail.com', N'543 Đường Lý Thường Kiệt, Quận 10, Thành phố Vũng Tàu', N'Dat890', 3),
    ('ND011', N'Trần Thị Anh', N'anhtt', N'anhtt@gmail.com', N'101 Đường Lê Lợi, Quận 11, TP. Hồ Chí Minh', N'Anh123', 3),
    ('ND012', N'Hoàng Văn Bình', N'binhvh', N'binhvh@gmail.com', N'202 Đường Lê Lai, Quận 12, TP. Hà Nội', N'Binh456', 3),
    ('ND013', N'Nguyễn Thị Ngọc', N'ngocnt', N'ngocnt@gmail.com', N'303 Đường Nguyễn Huệ, Quận 1, TP. Đà Nẵng', N'Ngoc789', 3),
    ('ND014', N'Lê Văn Thanh', N'thanhlv', N'thanhlv@gmail.com', N'404 Đường Trần Phú, Quận 2, TP. Cần Thơ', N'Thanh0123', 3),
    ('ND015', N'Võ Thị Hồng', N'hongvt', N'hongvt@gmail.com', N'505 Đường Lý Thường Kiệt, Quận 3, TP. Vũng Tàu', N'Hong345', 3);
GO
INSERT INTO DonHang (MaDH, MaNguoiDung, DiaChiDH, NgayDat, TinhTrang)
VALUES
    ('DH001', 'ND001', N'123 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', '2024-05-07', 1),
    ('DH002', 'ND002', N'456 Đường Nguyễn Huệ, Quận 2, Thành phố Hà Nội', '2024-05-08', 0),
    ('DH003', 'ND003', N'789 Đường Trần Hưng Đạo, Quận 3, Thành phố Đà Nẵng', '2024-05-09', 1),
    ('DH004', 'ND004', N'321 Đường Lý Tự Trọng, Quận 4, Thành phố Cần Thơ', '2024-05-10', 0),
    ('DH005', 'ND005', N'654 Đường Lê Hồng Phong, Quận 5, Thành phố Vũng Tàu', '2024-05-11', 1),
    ('DH006', 'ND006', N'987 Đường Phạm Văn Đồng, Quận 6, TP. Hồ Chí Minh', '2024-05-12', 1),
    ('DH007', 'ND007', N'234 Đường Nguyễn Công Trứ, Quận 7, TP. Hà Nội', '2024-05-13', 0),
    ('DH008', 'ND008', N'567 Đường Lê Văn Việt, Quận 8, TP. Đà Nẵng', '2024-05-14', 1),
    ('DH009', 'ND009', N'876 Đường Nguyễn Văn Linh, Quận 9, TP. Cần Thơ', '2024-05-15', 0),
    ('DH010', 'ND010', N'543 Đường Lý Thường Kiệt, Quận 10, TP. Vũng Tàu', '2024-05-16', 1),
    ('DH011', 'ND001', N'123 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', '2024-05-17', 1),
    ('DH012', 'ND002', N'456 Đường Nguyễn Huệ, Quận 2, Thành phố Hà Nội', '2024-05-18', 0),
    ('DH013', 'ND003', N'789 Đường Trần Hưng Đạo, Quận 3, Thành phố Đà Nẵng', '2024-05-19', 1),
    ('DH014', 'ND004', N'321 Đường Lý Tự Trọng, Quận 4, Thành phố Cần Thơ', '2024-05-20', 0),
    ('DH015', 'ND005', N'654 Đường Lê Hồng Phong, Quận 5, Thành phố Vũng Tàu', '2024-05-21', 1),
    ('DH016', 'ND006', N'987 Đường Phạm Văn Đồng, Quận 6, TP. Hồ Chí Minh', '2024-05-22', 1),
    ('DH017', 'ND007', N'234 Đường Nguyễn Công Trứ, Quận 7, TP. Hà Nội', '2024-05-23', 0),
    ('DH018', 'ND008', N'567 Đường Lê Văn Việt, Quận 8, TP. Đà Nẵng', '2024-05-24', 1),
    ('DH019', 'ND009', N'876 Đường Nguyễn Văn Linh, Quận 9, TP. Cần Thơ', '2024-05-25', 0),
    ('DH020', 'ND010', N'543 Đường Lý Thường Kiệt, Quận 10, TP. Vũng Tàu', '2024-05-26', 1);
GO
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia, ThanhTien)
VALUES ('DH001', 'SP012', 3, 550000, 1650000),
       ('DH002', 'SP037', 1, 7500000, 7500000),
       ('DH003', 'SP024', 3, 800000, 2400000),
       ('DH004', 'SP041', 2, 1900000, 3800000),
       ('DH005', 'SP005', 1, 13500000, 13500000),
       ('DH005', 'SP032', 2, 2500000, 2500000),
       ('DH006', 'SP017', 1, 3500000, 3500000),
       ('DH006', 'SP029', 3, 1900000, 1900000),
       ('DH007', 'SP002', 1, 11000000, 22000000),
       ('DH007', 'SP040', 2, 30000000, 60000000),
       ('DH008', 'SP027', 3, 3000000, 9000000),
       ('DH009', 'SP035', 1, 3000000, 3000000),
       ('DH009', 'SP036', 2, 3200000, 3200000),
       ('DH010', 'SP014', 1, 580000, 580000),
       ('DH011', 'SP003', 1, 13000000, 13000000),
       ('DH011', 'SP039', 2, 14000000, 14000000),
       ('DH012', 'SP011', 3, 500000, 1500000),
       ('DH013', 'SP048', 2, 2000000, 4000000),
       ('DH014', 'SP049', 1, 2200000, 2200000),
       ('DH015', 'SP025', 1, 1800000, 1800000),
       ('DH015', 'SP031', 2, 1800000, 1800000),
       ('DH016', 'SP007', 3, 4500000, 13500000),
       ('DH016', 'SP028', 2, 1500000, 4500000),
       ('DH017', 'SP050', 2, 1900000, 3800000),
       ('DH018', 'SP046', 1, 1500000, 1500000),
       ('DH019', 'SP001', 3, 12000000, 12000000),
       ('DH019', 'SP049', 1, 2200000, 2200000),
       ('DH020', 'SP016', 2, 7300000, 14600000);
--cập nhập trạng thái
GO
CREATE TRIGGER SuaTrangThai
ON SanPham
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
	-- TrangThai = 0 (hết hàng) nếu số lượng = 0
    UPDATE SanPham
    SET TrangThai = 0
    WHERE SoLuong = 0
      AND EXISTS (
          SELECT 1
          FROM inserted i
          WHERE i.MaSP = SanPham.MaSP
            AND i.SoLuong = 0
      );
	  -- Đặt TrangThai = 1 (còn hàng) nếu số lượng > 0
    UPDATE SanPham
    SET TrangThai = 1
    WHERE SoLuong > 0
      AND EXISTS (
          SELECT 1
          FROM inserted i
          WHERE i.MaSP = SanPham.MaSP
            AND i.SoLuong > 0
      );
END;
--tìm kiếm
GO
CREATE PROCEDURE TimKiemLSP
    @MaLoaiSP varchar(8)=NULL,
    @TenLoai nvarchar(100)=NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)
    SELECT @SqlStr = '
       SELECT *
       FROM LoaiSanPham
       WHERE 1=1
       '

    IF @MaLoaiSP IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND MaLoaiSP LIKE ''%' + @MaLoaiSP + '%''
        '

    IF @TenLoai IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
			AND TenLoai LIKE N''%' + @TenLoai + '%''
        '

    EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE TimKiemNCc
    @MaNCC varchar(8)=NULL,
    @TenNCC nvarchar(100)=NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)
    SELECT @SqlStr = '
       SELECT *
       FROM NhaCungCap
       WHERE 1=1
       '

    IF @MaNCC IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND MaNCC LIKE ''%' + @MaNCC + '%''
        '

    IF @TenNCC IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
			AND TenNCC LIKE N''%' + @TenNCC + '%''
        '

    EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE TimKiemSP
    @MaSP varchar(8)=NULL,
    @TenSP nvarchar(100)=NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)
    SELECT @SqlStr = '
       SELECT *
       FROM SANPHAM
       WHERE 1=1
       '

    IF @MaSP IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND MaSP LIKE ''%' + @MaSP + '%''
        '

    IF @TenSP IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
			AND TenSP LIKE N''%' + @TenSP + '%''
        '

    EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE TimKiemND
    @MaND varchar(8)=NULL,
    @TenND nvarchar(100)=NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)
    SELECT @SqlStr = '
       SELECT *
       FROM NGUOIDUNG
       WHERE 1=1
       '

    IF @MaND IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND MaNguoiDung LIKE ''%' + @MaND + '%''
        '

    IF @TenND IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
			AND HoTenND LIKE N''%' + @TenND + '%''
        '

    EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE TimKiemDH
    @MaDH varchar(8) = NULL,
    @MaND varchar(8) = NULL,
    @TenND nvarchar(100) = NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)

    SELECT @SqlStr = '
        SELECT *
        FROM DonHang dh
        JOIN NguoiDung nd ON dh.MaNguoiDung = nd.MaNguoiDung
        WHERE 1=1
       '

    IF @MaDH IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND dh.MaDH LIKE ''%' + @MaDH + '%''
        '

    IF @MaND IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND nd.MaNguoiDung LIKE ''%' + @MaND + '%''
        '

    IF @TenND IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND nd.HoTenND LIKE N''%' + @TenND + '%''
        '

    EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE TimKiemCTDH
    @MaDH varchar(8) = NULL,
    @MaSP varchar(8) = NULL,
    @TenSP nvarchar(100) = NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(4000),
            @ParamList NVARCHAR(2000)

    SELECT @SqlStr = '
        SELECT *
        FROM ChiTietDonHang ct
        JOIN SANPHAM sp
		ON ct.MaSP = sp.MaSP
        WHERE 1=1
       '

    IF @MaDH IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND ct.MaDH LIKE ''%' + @MaDH + '%''
        '

    IF @MaSP IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND sp.MaSP LIKE ''%' + @MaSP + '%''
        '

    IF @TenSP IS NOT NULL
        SELECT @SqlStr = @SqlStr + '
            AND sp.TenSP LIKE N''%' + @TenSP + '%''
        '

    EXEC SP_EXECUTESQL @SqlStr
END