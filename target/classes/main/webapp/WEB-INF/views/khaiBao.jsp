<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Khai báo thông tin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="container">
    <h2>Khai báo thông tin sinh viên tốt nghiệp</h2>
    <form:form method="post" modelAttribute="khaiBaoForm" action="${pageContext.request.contextPath}/khaiBao">
        <fieldset>
            <legend>Thông tin cá nhân</legend>
            <label>Số CMND (*):</label>
            <form:input path="sinhVien.soCMND" placeholder="Nhập số CMND" />
            <form:errors path="sinhVien.soCMND" cssClass="error" />

            <label>Họ tên:</label>
            <form:input path="sinhVien.hoTen" placeholder="Nhập họ tên" />
            
            <label>Email:</label>
            <form:input path="sinhVien.email" placeholder="example@mail.com" />
            
            <label>Số điện thoại:</label>
            <form:input path="sinhVien.soDT" placeholder="Nhập số điện thoại" />
            
            <label>Địa chỉ:</label>
            <form:input path="sinhVien.diaChi" placeholder="Nhập địa chỉ" />
        </fieldset>

        <fieldset>
            <legend>Thông tin tốt nghiệp</legend>
            <label>Trường (*):</label>
            <form:select path="totNghiep.maTruong">
                <form:option value="" label="-- Chọn trường --" />
                <form:options items="${dsTruong}" itemValue="maTruong" itemLabel="tenTruong" />
            </form:select>
            <form:errors path="totNghiep.maTruong" cssClass="error" />

            <label>Ngành (*):</label>
            <form:select path="totNghiep.maNganh">
                <form:option value="" label="-- Chọn ngành --" />
                <form:options items="${dsNganh}" itemValue="maNganh" itemLabel="tenNganh" />
            </form:select>
            <form:errors path="totNghiep.maNganh" cssClass="error" />

            <label>Hệ tốt nghiệp:</label>
            <form:select path="totNghiep.heTN">
                <form:option value="" label="-- Chọn --" />
                <form:options items="${heTNList}" />
            </form:select>

            <label>Ngày tốt nghiệp (dd/MM/yyyy):</label>
            <form:input path="totNghiep.ngayTN" placeholder="dd/MM/yyyy" />
            <form:errors path="totNghiep.ngayTN" cssClass="error" />

            <label>Loại tốt nghiệp:</label>
            <form:select path="totNghiep.loaiTN">
                <form:option value="" label="-- Chọn --" />
                <form:options items="${loaiTNList}" />
            </form:select>
        </fieldset>

        <div style="margin-top: 20px;">
            <input type="submit" value="Khai báo" />
            <c:if test="${param.success ne null}">
                <span class="success-msg">Khai báo thành công!</span>
            </c:if>
        </div>
    </form:form>
    
    <a href="${pageContext.request.contextPath}/" class="back-link">← Trở lại trang chủ</a>
</div>
</body>
</html>