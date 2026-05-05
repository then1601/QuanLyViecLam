<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Kết quả tìm kiếm tốt nghiệp & việc làm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="container">
    <h2>Kết quả tìm kiếm tốt nghiệp & việc làm</h2>
    <table>
        <thead>
            <tr>
                <th>Số CMND</th>
                <th>Họ tên</th>
                <th>Ngành TN</th>
                <th>Trường</th>
                <th>Ngành CV</th>
                <th>Công ty</th>
                <th>Thời gian làm</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ketQua}" var="row">
                <tr>
                    <td>${row.soCMND}</td>
                    <td>${row.hoTen}</td>
                    <td>${row.maNganhTN}</td>
                    <td>${row.maTruong}</td>
                    <td>${row.maNganhCV}</td>
                    <td>${row.tenCongTy}</td>
                    <td>${row.thoiGianLamViec}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty ketQua}">
                <tr>
                    <td colspan="7" style="text-align: center;">Không tìm thấy kết quả nào.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
    <a href="${pageContext.request.contextPath}/timKiemTotNghiep" class="back-link">← Trở lại tìm kiếm</a>
</div>
</body>
</html>