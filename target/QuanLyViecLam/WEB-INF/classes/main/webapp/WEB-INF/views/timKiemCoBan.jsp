<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm cơ bản</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="centered-wrapper">
    <div class="search-box">
        <h2>Tìm kiếm cơ bản</h2>
        <form action="${pageContext.request.contextPath}/timKiemCoBan/search" method="get">
            <label for="cmnd">CMND</label>
            <input type="text" id="cmnd" name="soCMND" placeholder="Nhập số CMND">

            <label for="hoten">Họ tên</label>
            <input type="text" id="hoten" name="hoTen" placeholder="Nhập họ tên">

            <input type="submit" value="Tìm kiếm">
        </form>
    </div>
    <div class="back-home">
        <a href="${pageContext.request.contextPath}/">← Trở lại trang chủ</a>
    </div>
</div>
</body>
</html>