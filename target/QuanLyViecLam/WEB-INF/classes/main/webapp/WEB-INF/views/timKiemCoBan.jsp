<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm cơ bản</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="container">
    <h2>Tìm kiếm cơ bản</h2>
    <form action="${pageContext.request.contextPath}/timKiemCoBan/search" method="get">
        <label>CMND:</label>
        <input name="soCMND" placeholder="Nhập số CMND để tìm kiếm..." />
        
        <label>Họ tên:</label>
        <input name="hoTen" placeholder="Nhập họ tên để tìm kiếm..." />
        
        <input type="submit" value="Tìm kiếm" />
    </form>
    
    <a href="${pageContext.request.contextPath}/" class="back-link">← Trở lại trang chủ</a>
</div>
</body>
</html>