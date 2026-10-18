# [Thực hành] Tạo bảng trên MySQL Workbench

## 🎯 Mục tiêu
- Luyện tập và làm quen với các thao tác tạo bảng dữ liệu (Table) bằng câu lệnh SQL trên **MySQL Workbench**.
- Hiểu rõ cú pháp lệnh DDL cơ bản: `CREATE DATABASE`, `USE`, `CREATE TABLE`.
- Nắm bắt ý nghĩa của các kiểu dữ liệu thông dụng trong MySQL: kiểu số nguyên (`INT`), kiểu chuỗi ký tự độ dài thay đổi (`VARCHAR`).
- Thực hành chạy từng câu lệnh độc lập trong SQL Editor bằng phím tắt và thanh công cụ.

---

## 📋 Mô tả bài thực hành
1. Tạo một Cơ sở dữ liệu mới có tên là `demo`.
2. Thiết lập CSDL `demo` làm CSDL làm việc hiện hành.
3. Tạo bảng `Student` quản lý thông tin sinh viên gồm 4 trường (thuộc tính):
   - `id`: Mã định danh sinh viên (kiểu số nguyên `INT`).
   - `name`: Họ và tên sinh viên (kiểu chuỗi `VARCHAR(200)`).
   - `age`: Tuổi sinh viên (kiểu số nguyên `INT`).
   - `country`: Quốc gia / Quê quán (kiểu chuỗi `VARCHAR(50)`).

---

## 🛠 Hướng dẫn chi tiết từng bước thực hiện

### Bước 1: Soạn thảo các câu lệnh SQL

1. Mở **MySQL Workbench** và đăng nhập vào kết nối MySQL Server của bạn.
2. Mở một tab soạn thảo mới bằng cách nhấn **`Ctrl + T`** (Windows) hoặc **`Cmd + T`** (macOS).
3. Nhập kịch bản câu lệnh SQL sau:

```sql
-- 1. Tạo cơ sở dữ liệu demo
CREATE DATABASE demo;

-- 2. Chọn cơ sở dữ liệu demo để làm việc
USE demo;

-- 3. Tạo bảng Student với 4 thuộc tính
CREATE TABLE Student (
    id INT,
    name VARCHAR(200),
    age INT,
    country VARCHAR(50)
);
```

#### 🔍 Giải thích chi tiết các thành phần câu lệnh:
- `CREATE DATABASE demo;`: Yêu cầu MySQL Server tạo một schema mới tên là `demo` để chứa các bảng dữ liệu.
- `USE demo;`: Chỉ định MySQL Server chuyển ngữ cảnh làm việc hiện tại vào database `demo`. Mọi bảng được tạo sau lệnh này sẽ tự động thuộc về database `demo`.
- `CREATE TABLE Student (...)`: Lệnh khởi tạo một cấu trúc bảng mới có tên là `Student`.
- `id INT`: Cột `id` lưu trữ giá trị số nguyên (Integer, trong khoảng từ -2 tỷ đến +2 tỷ).
- `name VARCHAR(200)`: Cột `name` lưu trữ chuỗi ký tự với độ dài tối đa 200 ký tự.
- `age INT`: Cột `age` lưu trữ số tuổi (kiểu số nguyên).
- `country VARCHAR(50)`: Cột `country` lưu trữ tên quốc gia với độ dài tối đa 50 ký tự.

---

### Bước 2: Chạy từng câu lệnh trong file

MySQL Workbench cung cấp các cách thực thi câu lệnh linh hoạt:

#### ⚡ Cách A: Chạy từng câu lệnh tuần tự bằng con trỏ chuột (Khuyến nghị)
1. Đặt con trỏ chuột vào dòng lệnh đầu tiên: `CREATE DATABASE demo;`
   - Nhấn tổ hợp phím: **`Ctrl + Enter`** (hoặc nhấp biểu tượng **Tia sét ⚡ có hình con trỏ**).
   - Nhìn xuống cửa sổ **Action Output**: Xuất hiện dấu **tick màu xanh** biểu thị CSDL `demo` đã được tạo.
2. Tiếp tục di chuyển con trỏ chuột vào dòng thứ hai: `USE demo;`
   - Nhấn **`Ctrl + Enter`**.
   - Cửa sổ Action Output xuất hiện dấu tick xanh, database `demo` được bôi đậm trong cột Schemas.
3. Di chuyển con trỏ chuột vào khối lệnh thứ ba: `CREATE TABLE Student (...);`
   - Nhấn **`Ctrl + Enter`**.
   - Cửa sổ Action Output xuất hiện dấu tick xanh thông báo bảng `Student` đã được tạo thành công!

#### ⚡ Cách B: Bôi đen từng khối lệnh để thực thi
- Dùng chuột bôi đen chính xác câu lệnh muốn chạy, sau đó nhấp vào biểu tượng **Tia sét ⚡**.

#### ⚡ Cách C: Chạy toàn bộ file kịch bản cùng lúc
- Nhấn tổ hợp phím **`Ctrl + Shift + Enter`** (hoặc nhấp vào biểu tượng **Tia sét ⚡ đầu tiên** không có con trỏ). Toàn bộ 3 câu lệnh sẽ được thực thi liên tiếp từ trên xuống dưới.

---

### Bước 3: Kiểm tra cấu trúc bảng vừa tạo

Sau khi tạo xong bảng, bạn có thể chạy các câu lệnh sau để kiểm tra cấu trúc:

```sql
-- Xem danh sách các bảng có trong database demo
SHOW TABLES;

-- Xem chi tiết các cột, kiểu dữ liệu của bảng Student
DESCRIBE Student;
-- Hoặc viết tắt:
DESC Student;
```

**Bảng kết quả mô tả cấu trúc (`DESC Student`):**
| Field | Type | Null | Key | Default | Extra |
|---|---|---|---|---|---|
| `id` | int | YES | | NULL | |
| `name` | varchar(200) | YES | | NULL | |
| `age` | int | YES | | NULL | |
| `country` | varchar(50) | YES | | NULL | |

---

## 🌟 Mở rộng: Cú pháp chuẩn hóa trong thực tế (Best Practices)

Trong các dự án thực tế, một bảng dữ liệu quan hệ nên có **Khóa chính (PRIMARY KEY)**, cơ chế **Tự động tăng (AUTO_INCREMENT)**, ràng buộc **Không được rỗng (NOT NULL)** và cấu hình **Bảng mã tiếng Việt (utf8mb4)**:

```sql
CREATE DATABASE IF NOT EXISTS demo
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE demo;

CREATE TABLE IF NOT EXISTS Student (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Khóa chính tự động tăng
    name VARCHAR(200) NOT NULL,        -- Tên bắt buộc phải có
    age INT CHECK (age > 0),           -- Ràng buộc tuổi phải là số dương
    country VARCHAR(50) DEFAULT 'Việt Nam' -- Giá trị mặc định
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

---

## 🧪 Thử nghiệm: Thêm và xem dữ liệu sinh viên

```sql
-- Thêm 3 sinh viên mẫu vào bảng
INSERT INTO Student (id, name, age, country) VALUES
(1, 'Nguyễn Văn Nam', 20, 'Việt Nam'),
(2, 'John Smith', 22, 'Hoa Kỳ'),
(3, 'Trần Thị Mai', 19, 'Việt Nam');

-- Truy vấn hiển thị toàn bộ danh sách sinh viên
SELECT * FROM Student;
```

---

## 📁 Cấu trúc thư mục dự án

```text
create-a-table-on-mysql-workbench/
├── README.md           # Hướng dẫn chi tiết các bước tạo bảng và kiểm tra
├── create_table.sql    # File script SQL mẫu hoàn chỉnh từ cơ bản đến nâng cao
└── index.html          # Trang mô phỏng trực quan tương tác bảng Student
```

---

## 🚀 Đẩy mã nguồn lên GitHub Repository

```bash
cd C:\Users\ductr\.gemini\antigravity-ide\scratch\create-a-table-on-mysql-workbench
git push -u origin main
```
