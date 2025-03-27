<%@page import="java.math.BigDecimal"%>
<%@ page import="java.util.*, com.servlet.tiasm.model.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sessionUser = request.getSession(false);
    User user = (sessionUser != null) ? (User) sessionUser.getAttribute("user") : null;

    if (user == null) {
        response.sendRedirect("/login");
        return;
    }

    List<BookingEntry> cart = (sessionUser != null) ? (List<BookingEntry>) sessionUser.getAttribute("cart") : new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        header {
            background-color: #007BFF;
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .header-top {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 15px;

        }
        .text-sm {
            margin-right: 15px;
            color: aliceblue;
        }
        .text-sm:hover {
            color: rgb(253, 140, 140);
            text-shadow: 1px 1px 5px rgba(255, 0, 0, 0.6);
        }

        .hotline {
            color: #fff;
            background-color: #0056b3;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: bold;
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            /* NEW - khoảng cách giữa logo và chữ */
        }

        .logo img {
            height: 45px;
            /* NEW - điều chỉnh kích thước */
            width: auto;
            margin-right: 0;
            /* NEW - xóa margin cũ */
            border-radius: 30px;
        }

        /* NEW - Style mới cho chữ TravelMng */
        .brand {
            color: white;
            font-size: 28px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            text-decoration: none;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
            transition: color 0.3s ease;
        }

        .brand:hover {
            color: #e6f0ff;
            /* NEW - hiệu ứng hover */
        }

        nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            margin: 0 20px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
            padding: 10px;
        }

        nav a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }

        .search-box {
            display: flex;
            align-items: center;
            background: white;
            border-radius: 25px;
            padding: 5px 15px;
        }

        .search-box input {
            border: none;
            outline: none;
            padding: 8px;
            width: 200px;
        }

        .search-box button {
            background: none;
            border: none;
            cursor: pointer;
            color: #007BFF;
        }
        .cart-container {
            max-width: 800px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .cart-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .cart-table th, .cart-table td {
            text-align: center;
            vertical-align: middle;
        }
        .cart-total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
        }
        .btn-remove {
            color: red;
            cursor: pointer;
        }

        footer {
            background-color: #007BFF;
            color: white;
            padding: 20px 0;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        footer a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        footer a:hover {
            text-decoration: underline;
        }

        .footer-content {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<header>
    <div class="header-top">
        <%
            // Get user from session
            
            User user1 = (User) session.getAttribute("user");
            if (user1 != null) {
        %>
        <!-- If user is logged in -->
        <span class="text-sm font-bold">Xin chào, <%= user.getEmail() %>!</span>
        <a class="text-sm text-red-500" href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
        <%
        } else {
        %>
        <!-- If user is not logged in -->
        <a class="text-sm" href="<%= request.getContextPath() %>/login">Đăng nhập</a>
        <a class="text-sm" href="<%= request.getContextPath() %>/register">Đăng ký</a>
        <%
            }
        %>

        <a class="text-sm" href="<%= request.getContextPath() %>/guide">Hướng dẫn</a>
    </div>

    <div class="main-header">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/images.jpeg" alt="Hotel Logo">
            <a href="<%= request.getContextPath() %>/home" class="brand">TravelMng</a>
        </div>

        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/home">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/destination">Destination</a></li>
                <li><a href="<%= request.getContextPath() %>/restaurant">Restaurant</a></li>
                <li><a href="<%= request.getContextPath() %>/hotel">Hotel</a></li>
                <li><a href="<%= request.getContextPath() %>/customer">User</a></li>
                <li><a href="<%= request.getContextPath() %>/cart">Booking</a></li>
                <li><a href="<%= request.getContextPath() %>/contact">Contact</a></li>
            </ul>
        </nav>

        <div class="search-box">
            <form action="<%= request.getContextPath() %>/search" method="get">
                <input type="text" name="query" placeholder="Tìm kiếm...">
                <button type="submit">🔍︎</button>
            </form>
        </div>
    </div>
</header>

<div class="cart-container">
    <h2 class="cart-title">🛒 Your Cart</h2>

    <% if (cart != null && !cart.isEmpty()) { %>
        <table class="table table-bordered cart-table">
            <thead class="table-dark">
                <tr>
                    <th>Service Type</th>
                    <th>Service Name</th>
                    <th>Booking Time</th>
                    <th>Check-out</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    BigDecimal totalPrice = BigDecimal.ZERO;  // Biến tổng giá trị
                    for (BookingEntry entry : cart) { 
                        BaseModel service = entry.getService();
                        BigDecimal servicePrice = BigDecimal.ZERO;
                %>
                <tr>
                    <td><%= service.getClass().getSimpleName() %></td>
                    <td><%= service.getTravelName() %></td>
                    <td>
                        <% if (service instanceof Hotel) { %>
                            <%= entry.getBookingStartDate() %>
                        <% } else { %>
                            <%= entry.getBookingTime() %>
                        <% } %>
                    </td>
                    <td>
                        <% if (service instanceof Hotel) { %>
                            <%= entry.getBookingEndDate() %>
                        <% } else { %>
                            N/A
                        <% } %>
                    </td>
                    <td>
                        <% 
                            // Lấy giá của dịch vụ tương ứng
                            if (service instanceof Destination) {
                                servicePrice = ((Destination) service).getPricePerPerson();
                            } else if (service instanceof Hotel) {
                                servicePrice = ((Hotel) service).getPricePerPerson();
                            } else if (service instanceof Restaurant) {
                                servicePrice = ((Restaurant) service).getPricePerPerson();
                            }
                        %>
                        <%= servicePrice %> $
                    </td>
                    <td>
                        <form action="<%= request.getContextPath() %>/cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="serviceId" value="<%= service.getTravelId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </td>
                </tr>
                <%
                    // Cộng dồn tổng giá trị
                    totalPrice = totalPrice.add(servicePrice);
                    }
                %>
            </tbody>
        </table>

        <div class="cart-total">
            Total Items: <%= cart.size() %> <br>
            Total Price: <%= totalPrice %> $
        </div>

        <form action="<%= request.getContextPath() %>/cart" method="post">
            <input type="hidden" name="action" value="checkout">
            <button type="submit" class="btn btn-success w-100 mt-3">Proceed to Checkout</button>
        </form>

    <% } else { %>
        <div class="alert alert-warning text-center">Your cart is empty.</div>
    <% } %>

    <div class="text-center mt-3">
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">Continue Shopping</a>
    </div>
    <div class="text-center" style="margin-top: 50px;">
    <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">My Booking</a>
</div>

</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<footer>
    <div class="footer-links">
        <a href="#">Trang chủ</a>
        <a href="#">Giới thiệu</a>
        <a href="#">Tour du lịch</a>
        <a href="#">Tin tức</a>
        <a href="#">Liên hệ</a>
        <a href="#">Dịch vụ</a>
    </div>
    <div class="footer-content">
        © 2025 BeeTravel | Cung cấp bởi Sapo
    </div>
</footer>
</body>
</html>
