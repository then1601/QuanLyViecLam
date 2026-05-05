<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Kết quả tìm kiếm cơ bản</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="container">
    <h2>Kết quả tìm kiếm cơ bản</h2>
    <table>
        <thead>
            <tr>
                <th>Số CMND</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Số ĐT</th>
                <th>Địa chỉ</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ketQua}" var="sv">
                <tr>
                    <td>${sv.soCMND}</td>
                    <td>${sv.hoTen}</td>
                    <td>${sv.email}</td>
                    <td>${sv.soDT}</td>
                    <td>${sv.diaChi}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty ketQua}">
                <tr>
                    <td colspan="5" style="text-align: center;">Không tìm thấy kết quả nào.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
    <a href="${pageContext.request.contextPath}/timKiemCoBan" class="back-link">← Trở lại tìm kiếm</a>
</div>
</body>
</html>