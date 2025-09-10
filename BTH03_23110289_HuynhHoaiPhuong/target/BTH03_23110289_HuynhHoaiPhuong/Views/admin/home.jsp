<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light container mt-4">

<h1 class="mb-4">Trang Admin</h1>
<!-- Chào fullname admin -->
<h4>Chào, ${currentUser.fullname}!</h4>
<!-- Nút Thêm Category -->
<a href="${pageContext.request.contextPath}/category?action=add" class="btn btn-success mb-3">Thêm Category</a>

<!-- Hiển thị danh sách Category -->
<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên Category</th>
        <th>Ảnh</th>
        <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${categories}">
        <tr>
            <td>${c.id}</td>
            <td>${c.name}</td>
            <td>
                <c:if test="${not empty c.imageBase64}">
                    <img src="data:image/jpeg;base64,${c.imageBase64}" width="80" />
                </c:if>
            </td>
            <td>
                <!-- Chỉ được sửa/xóa category của chính admin -->
                <c:if test="${c.userid == currentUser.id}">
                    <a href="${pageContext.request.contextPath}/category?action=edit&id=${c.id}" 
                       class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/category?action=delete&id=${c.id}" 
                       class="btn btn-sm btn-danger" 
                       onclick="return confirm('Xóa category này?');">Xóa</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
