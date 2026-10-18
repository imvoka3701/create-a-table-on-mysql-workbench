-- =====================================================================
-- BÀI THỰC HÀNH: TẠO BẢNG TRÊN MYSQL WORKBENCH
-- FILE: create_table.sql
-- =====================================================================

-- ---------------------------------------------------------------------
-- PHẦN 1: CÁC CÂU LỆNH CHÍNH XÁC THEO YÊU CẦU ĐỀ BÀI
-- ---------------------------------------------------------------------

-- Bước 1.1: Tạo cơ sở dữ liệu demo
create database demo;

-- Bước 1.2: Sử dụng cơ sở dữ liệu demo
use demo;

-- Bước 1.3: Tạo bảng Student với 4 trường: id, name, age, country
create table Student (
    id int,
    name varchar(200),
    age int,
    country varchar(50)
);


-- ---------------------------------------------------------------------
-- PHẦN 2: KIỂM TRA CẤU TRÚC BẢNG SAU KHI TẠO
-- ---------------------------------------------------------------------

-- Xem danh sách các bảng đang có trong database demo
SHOW TABLES;

-- Xem mô tả cấu trúc các cột của bảng Student
DESCRIBE Student;

-- Xem câu lệnh DDL đầy đủ do MySQL sinh ra
SHOW CREATE TABLE Student;


-- ---------------------------------------------------------------------
-- PHẦN 3: THÊM DỮ LIỆU MẪU VÀ TRUY VẤN KIỂM TRA
-- ---------------------------------------------------------------------

-- Thêm các bản ghi sinh viên mẫu vào bảng Student
INSERT INTO Student (id, name, age, country) VALUES
(1, 'Nguyễn Văn Nam', 20, 'Việt Nam'),
(2, 'Alice Johnson', 21, 'Hoa Kỳ'),
(3, 'Trần Minh Hoàng', 19, 'Việt Nam'),
(4, 'Kenji Sato', 22, 'Nhật Bản');

-- Truy vấn hiển thị toàn bộ danh sách sinh viên
SELECT * FROM Student;

-- Truy vấn sinh viên có quốc tịch Việt Nam
SELECT * FROM Student WHERE country = 'Việt Nam';

-- Truy vấn sinh viên có tuổi từ 20 trở lên
SELECT * FROM Student WHERE age >= 20;


-- ---------------------------------------------------------------------
-- PHẦN 4: CÚ PHÁP CHUẨN HÓA MỞ RỘNG (DÀNH CHO DỰ ÁN THỰC TẾ)
-- ---------------------------------------------------------------------
-- Trong thực tế, bảng nên có khóa chính và ràng buộc hợp lệ:
/*
CREATE DATABASE IF NOT EXISTS demo_chuan
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE demo_chuan;

CREATE TABLE IF NOT EXISTS Student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    age INT CHECK (age > 0),
    country VARCHAR(50) DEFAULT 'Việt Nam',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
*/
