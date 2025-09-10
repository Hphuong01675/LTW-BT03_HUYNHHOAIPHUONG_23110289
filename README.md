# LTW – User Management Web Application

**Mô tả:** LTW là ứng dụng web quản lý người dùng, hỗ trợ đăng nhập/đăng ký, phân quyền theo Role (Manager, Admin, User) và quản lý Category (thêm/sửa/xóa). Giao diện responsive dùng Bootstrap 5, dữ liệu lưu trên SQL Server, truy xuất bằng Hibernate JPA.

**Công nghệ:** Java 17+, Jakarta Servlet & JSP, Hibernate ORM, SQL Server, Bootstrap 5, Maven.

**Cấu trúc chính:** 
- `Controller/` – xử lý request
- `Models/` – User, Category
- `Service/` – logic nghiệp vụ
- `WebContent/Views/` – giao diện JSP
- `META-INF/persistence.xml` – cấu hình DB

**Cài đặt & chạy:** 
1. Tạo DB SQL Server `LTW_TH03`.
2. Cập nhật `persistence.xml` với username/password.
3. Build: `mvn clean install`.
4. Deploy trên Tomcat 9+ với context `/LTW`.
5. Login: `http://localhost:8080/LTW/login`, Register: `http://localhost:8080/LTW/Register.jsp`.

**Tính năng:** Phân quyền Role, quản lý session, quản lý Category, UI responsive, Hibernate ORM tự động mapping bảng.
