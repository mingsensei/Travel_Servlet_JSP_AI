<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body>
    <h1>Trang chủ</h1>
    <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
    <button onclick="location.href='${pageContext.request.contextPath}/cart'">Đi đến giỏ hàng</button><br>
    <a href="${pageContext.request.contextPath}/hotels">Khách sạn</a>
    <button onclick="location.href='${pageContext.request.contextPath}/hotels'">Đi đến khách sạn</button><br>
    <a href="${pageContext.request.contextPath}/destination">Điểm đến</a>
    <button onclick="location.href='${pageContext.request.contextPath}/destination'">Đi đến điểm đến</button><br>
</body>
</html>