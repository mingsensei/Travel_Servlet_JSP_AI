<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.servlet.tiasm.model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/payment.css">
    <script>
        function confirmPayment() {
            document.getElementById('popup').style.display = 'block';
        }
        function closePopup() {
            document.getElementById('popup').style.display = 'none';
        }
        function processPayment() {
            alert('Payment Successful!');
            closePopup();
        }
    </script>
</head>
<body>
    <nav class="navbar">
        <img src="logo.png" alt="Logo" class="logo">
        <a href="index.jsp">Home</a>
        <a href="user.jsp">User</a>
    </nav>

    <div class="container">
        <h1>Payment Page</h1>
        <%
            HttpSession sessionObj = request.getSession(false);
            User user = null;
            if (sessionObj != null) {
                user = (User) sessionObj.getAttribute("user");
            }
        %>

        <%
            if (user == null) {
                response.sendRedirect("login"); // Chuyển hướng nếu chưa đăng nhập
                return; // Dừng xử lý tiếp theo để tránh lỗi
            }
        %>

        <h2>Service Information</h2>
        <p>Service Name: Premium Subscription</p>
        <p>Total Amount: $49.99</p>

        <h2>Select Payment Method</h2>
        <div class="payment-methods">
            <div class="method"><img src="card.png" alt="Credit Card"></div>
            <div class="method"><img src="paypal.png" alt="PayPal"></div>
            <div class="method"><img src="bank.png" alt="Bank Transfer"></div>
            <div class="method"><img src="applepay.png" alt="Apple Pay"></div>
            <div class="method"><img src="googlepay.png" alt="Google Pay"></div>
        </div>

        <button onclick="window.location.href='cart.jsp'">Back to Cart</button>
        <button onclick="confirmPayment()">Pay</button>
    </div>

    <div id="popup" class="popup">
        <p>Are you sure you want to proceed with the payment?</p>
        <button onclick="processPayment()">Yes</button>
        <button onclick="closePopup()">No</button>
    </div>
</body>
</html>
