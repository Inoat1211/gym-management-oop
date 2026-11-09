# Quản lý phòng tập Gym (Java Swing + MySQL)

## Cấu trúc
- `src/` gồm 6 package: model, dao, controller, view, exception, util
- `lib/` đặt tệp driver `mysql-connector-j-26.10.0.jar`
- `sql/schema.sql` tạo cơ sở dữ liệu và 3 bảng (nguồn chuẩn duy nhất, không tự đổi tên cột)
- `docs/uml/` lưu tệp gốc `.drawio` của các sơ đồ
- `config.properties.example` sao chép thành `config.properties` rồi sửa mật khẩu MySQL

## Biên dịch và chạy (Windows, JDK 21)
```
dir /s /b src\*.java > sources.txt
javac -encoding UTF-8 -cp "lib/*" -d out @sources.txt
java -cp "out;lib/*" view.MainFrame
```
(`view.MainFrame` chạy được sau khi TV4 đẩy MainFrame.java lên.)

## Quy tắc nhánh
Mỗi người một nhánh riêng, xong báo Lead merge vào `main`. Không sửa file của người khác.
