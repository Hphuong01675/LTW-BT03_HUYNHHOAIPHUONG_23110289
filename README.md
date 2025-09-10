LTW Project – User Management Web Application
1. Mô tả dự án

Dự án LTW là một ứng dụng web cho phép:

Đăng nhập, đăng ký người dùng.

Phân quyền người dùng theo Role:

Manager (roleId = 1)

Admin (roleId = 2)

User (roleId = 3)

Quản lý Category (thêm, sửa, xóa) bởi người dùng tương ứng.

Giao diện responsive sử dụng Bootstrap 5.

Tương tác cơ sở dữ liệu bằng Hibernate JPA với SQL Server.

2. Công nghệ sử dụng

Java 17+

Jakarta Servlet & JSP

Hibernate ORM 6.4.4.Final

SQL Server

Bootstrap 5

Maven làm build tool

Eclipse / Spring Tools làm IDE

3. Cấu trúc project
LTW/
│
├─ src/
│   ├─ Controller/
│   │    └─ UserController.java
│   ├─ Models/
│   │    ├─ User.java
│   │    └─ Category.java
│   ├─ Service/
│   │    ├─ IUserService.java
│   │    └─ impl/UserServiceImpl.java
│   └─ Utils/
│        └─ JpaUtil.java
│
├─ WebContent/Views/
│   ├─ Login.jsp
│   ├─ Register.jsp
│   ├─ ForgotPassword.jsp
│   ├─ Admin/Home.jsp
│   ├─ Manager/Home.jsp
│   └─ User/Home.jsp
│
├─ META-INF/
│   └─ persistence.xml
│
└─ pom.xml

4. Hướng dẫn cài đặt
4.1. Cấu hình cơ sở dữ liệu

Tạo database SQL Server tên LTW_TH03

Hibernate sẽ tạo tự động bảng Users, Roles và Categories khi chạy ứng dụng.

persistence.xml:

<property name="jakarta.persistence.jdbc.url" value="jdbc:sqlserver://HOAIPHUONG\\SQLEXPRESS01:1433;databaseName=LTW_TH03;encrypt=false"/>
<property name="jakarta.persistence.jdbc.user" value="username"/>
<property name="jakarta.persistence.jdbc.password" value="password"/>
<property name="hibernate.hbm2ddl.auto" value="update"/>
<property name="hibernate.dialect" value="org.hibernate.dialect.SQLServer2012Dialect"/>

4.2. Build project
mvn clean install

4.3. Deploy

Chạy trên Tomcat 9+ hoặc server Java EE khác.

Project được deploy dưới context path: /LTW

5. Sử dụng ứng dụng
5.1. Login

URL: http://localhost:8080/LTW/login

Nhập username và password.

Hệ thống tự động phân quyền:

Manager → /Manager/Home.jsp

Admin → /Admin/Home.jsp

User → /User/Home.jsp

5.2. Register

URL: http://localhost:8080/LTW/Register.jsp

Tạo tài khoản mới.

5.3. Quản lý Category

Chỉ user có quyền tạo/sửa/xóa category.

Category lưu thông tin: name, description, image, byUserId.

6. Các tính năng nổi bật

Phân quyền theo role

Session management – giữ user đã login

Bootstrap responsive UI

Hibernate ORM – tự động mapping bảng, query dễ dàng

7. Lưu ý

Đảm bảo SQL Server chạy trên cổng 1433 và cho phép remote connections.

Cập nhật persistence.xml nếu server khác hoặc username/password khác.

Xem log Hibernate để debug tạo bảng hoặc kết nối DB.
