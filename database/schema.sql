-- ============================================
-- CSDL Quản Lý Sinh Viên Tốt Nghiệp
-- ============================================
DROP DATABASE IF EXISTS sinhvien_totnghiep_db;
CREATE DATABASE sinhvien_totnghiep_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE sinhvien_totnghiep_db;
SET NAMES utf8mb4;

-- 1. Bảng TRUONG
CREATE TABLE IF NOT EXISTS TRUONG (
    MaTruong  VARCHAR(20)   PRIMARY KEY,
    TenTruong NVARCHAR(255),
    DiaChi    NVARCHAR(255),
    SoDT      VARCHAR(20)
    );

-- 2. Bảng NGANH
CREATE TABLE IF NOT EXISTS NGANH (
    MaNganh  VARCHAR(20)   PRIMARY KEY,
    TenNganh NVARCHAR(255),
    LoaiNganh NVARCHAR(100)
    );

-- 3. Bảng SINHVIEN
CREATE TABLE IF NOT EXISTS SINHVIEN (
    SoCMND VARCHAR(20)   PRIMARY KEY,
    HoTen  NVARCHAR(100),
    Email  VARCHAR(100),
    SoDT   VARCHAR(20),
    DiaChi NVARCHAR(255)
    );

-- 4. Bảng TOT_NGHIEP
CREATE TABLE IF NOT EXISTS TOT_NGHIEP (
    SoCMND   VARCHAR(20)  NOT NULL,
    MaTruong VARCHAR(20)  NOT NULL,
    MaNganh  VARCHAR(20)  NOT NULL,
    HeTN     NVARCHAR(50),
    NgayTN   DATE,
    LoaiTN   NVARCHAR(50),
    PRIMARY KEY (SoCMND, MaTruong, MaNganh),
    FOREIGN KEY (SoCMND)   REFERENCES SINHVIEN(SoCMND) ON DELETE CASCADE,
    FOREIGN KEY (MaTruong) REFERENCES TRUONG(MaTruong)  ON DELETE CASCADE,
    FOREIGN KEY (MaNganh)  REFERENCES NGANH(MaNganh)    ON DELETE CASCADE
    );

-- 5. Bảng CONG_VIEC
CREATE TABLE IF NOT EXISTS CONG_VIEC (
    SoCMND          VARCHAR(20)   NOT NULL,
    NgayVaoCongTy   DATE          NOT NULL,
    MaNganh         VARCHAR(20),
    TenCongViec     NVARCHAR(255),
    TenCongTy       NVARCHAR(255),
    DiaChiCongTy    NVARCHAR(255),
    ThoiGianLamViec NVARCHAR(100),
    PRIMARY KEY (SoCMND, NgayVaoCongTy),
    FOREIGN KEY (SoCMND)  REFERENCES SINHVIEN(SoCMND) ON DELETE CASCADE,
    FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)   ON DELETE SET NULL
    );

-- ============================================
-- Dữ liệu mẫu
-- ============================================

INSERT INTO TRUONG (MaTruong, TenTruong, DiaChi, SoDT) VALUES
('BKU',  N'Đại học Bách Khoa TP.HCM',       N'268 Lý Thường Kiệt, Q.10, TP.HCM',  '02838652086'),
('HCMUS',N'Đại học Khoa học Tự nhiên',       N'227 Nguyễn Văn Cừ, Q.5, TP.HCM',   '02838353551'),
('UEL',  N'Đại học Kinh tế - Luật',          N'Linh Xuân, TP. Thủ Đức, TP.HCM',   '02837244555'),
('FPT',  N'Đại học FPT TP.HCM',              N'Lô E2a-7, Đ. D1, TP. Thủ Đức',     '02873005588');

INSERT INTO NGANH (MaNganh, TenNganh, LoaiNganh) VALUES
('CNTT',  N'Công nghệ Thông tin',   N'Kỹ thuật'),
('KTPM',  N'Kỹ thuật Phần mềm',    N'Kỹ thuật'),
('QTKD',  N'Quản trị Kinh doanh',  N'Kinh tế'),
('TCNH',  N'Tài chính - Ngân hàng', N'Kinh tế');

INSERT INTO SINHVIEN (SoCMND, HoTen, Email, SoDT, DiaChi) VALUES
('079201001234', N'Nguyễn Văn An',   'an.nguyen@email.com',   '0901234567', N'Q.1, TP.HCM'),
('079201005678', N'Trần Thị Bích',   'bich.tran@email.com',   '0912345678', N'Q.3, TP.HCM'),
('079201009012', N'Lê Hoàng Cường',  'cuong.le@email.com',    '0923456789', N'Q.7, TP.HCM'),
('079201003456', N'Phạm Ngọc Diệu',  'dieu.pham@email.com',   '0934567890', N'Bình Thạnh, TP.HCM');

INSERT INTO TOT_NGHIEP (SoCMND, MaTruong, MaNganh, HeTN, NgayTN, LoaiTN) VALUES
('079201001234', 'BKU',   'CNTT',  N'Đại học chính quy', '2023-06-15', N'Giỏi'),
('079201005678', 'HCMUS', 'KTPM',  N'Đại học chính quy', '2023-07-20', N'Xuất sắc'),
('079201009012', 'UEL',   'QTKD',  N'Đại học chính quy', '2022-11-10', N'Khá'),
('079201003456', 'FPT',   'CNTT',  N'Đại học chính quy', '2024-01-05', N'Giỏi');

INSERT INTO CONG_VIEC (SoCMND, NgayVaoCongTy, MaNganh, TenCongViec, TenCongTy, DiaChiCongTy, ThoiGianLamViec) VALUES
('079201001234', '2023-08-01', 'CNTT',  N'Lập trình viên Backend',   N'FPT Software',        N'Tòa nhà FPT, TP. Thủ Đức', N'Full-time'),
('079201005678', '2023-09-15', 'KTPM',  N'Kỹ sư Kiểm thử Phần mềm', N'Tiki Corporation',    N'Q.1, TP.HCM',               N'Full-time'),
('079201009012', '2023-01-10', 'QTKD',  N'Chuyên viên Kinh doanh',   N'Vingroup',            N'Q.7, TP.HCM',               N'Full-time'),
('079201003456', '2024-03-01', 'CNTT',  N'Lập trình viên Frontend',  N'KMS Technology',      N'Q.10, TP.HCM',              N'Full-time');