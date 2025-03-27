<%@page import="com.servlet.tiasm.model.Customer"%>
<%@page import="com.servlet.tiasm.repository.CustomerDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.servlet.tiasm.repository.HotelDAO"%>
<%@page import="com.servlet.tiasm.model.BookingEntry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.servlet.tiasm.model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><html lang="vi">
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>Cập Nhật Thông Tin Khách Hàng</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
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
      color: white;
      background-color: #004aad;
      padding: 8px 15px;
      border-radius: 20px;
      font-weight: bold;
    }

    .main-header0 {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      display: flex;
      align-items: center;
      gap: 15px;
    }

    .logo img {
      height: 45px;
      width: auto;
      border-radius: 30px;
    }

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
      color: #004aad;
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
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
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

    .container {
      display: flex;
      flex-wrap: wrap;
    }

    aside {
      background-color: #ecf0f1;
      padding: 1.5rem;
      width: 100%;
      max-width: 280px;
      flex: 1;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    aside ul {
      list-style: none;
      padding: 0;
    }

    aside ul li {
      margin-bottom: 1.5rem;
    }

    aside ul li a {
      color: #34495e;
      font-size: 1.2rem;
      text-decoration: none;
      display: block;
      padding: 0.5rem;
      border-radius: 5px;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    aside ul li a:hover {
      background-color: #3498db;
      color: white;
    }

    main {
      background-color: #ffffff;
      padding: 2rem;
      flex: 3;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .main-header {
      background-color: #3498db;
      color: white;
      padding: 1rem;
      text-align: center;
      font-weight: bold;
      border-radius: 5px;
      margin-bottom: 1.5rem;
    }

    .main-info {
      background-color: #ecf0f1;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .main-info form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .main-info label {
      font-weight: bold;
      margin-bottom: 5px;
    }

    .main-info input,
    .main-info select {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1rem;
      width: 100%;
      max-width: 400px;
    }

    .main-info input[disabled] {
      background-color: #e0e0e0;
      color: #666;
    }

    .main-info button {
      background-color: #3498db;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1rem;
      width: fit-content;
      transition: background-color 0.3s ease;
    }

    .main-info button:hover {
      background-color: #2980b9;
    }

    .success-message {
      display: none;
      color: #27ae60;
      font-weight: bold;
      text-align: center;
      margin-top: 15px;
    }

    footer {
      background-color: #2c3e50;
      color: white;
      padding: 1.5rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 2rem;
      flex-wrap: wrap;
    }

    footer .contact-info {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    footer .social-icons a {
      color: white;
      text-decoration: none;
      margin-left: 1rem;
      font-size: 1.5rem;
      transition: color 0.3s ease;
    }

    footer .social-icons a:hover {
      color: #3498db;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
      }

      aside {
        max-width: 100%;
      }

      nav {
        flex-direction: column;
      }

      footer {
        flex-direction: column;
        text-align: center;
      }
    }
  </style>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</head>
<body>
  <header>
    <div class="header-top">
        <%
            // Get user from session
            User user = (User) session.getAttribute("user");
            if (user != null) {
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

    <div class="main-header0">
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
  
  <div class="container">
    <aside>
    <ul>
        <li><a href="javascript:void(0);" class="nav-link" data-action="view" onclick="navigate('view')" style="color: black; text-decoration: none; padding: 5px;">1. Thông tin tài khoản</a></li>
        <li><a href="javascript:void(0);" class="nav-link" data-action="changePassword" onclick="navigate('changePassword')" style="color: black; text-decoration: none; padding: 5px;">2. Đổi mật khẩu</a></li>
        <li><a href="javascript:void(0);" class="nav-link" data-action="security" onclick="navigate('security')" style="color: black; text-decoration: none; padding: 5px;">3. Cài đặt bảo mật</a></li>
        <li><a href="javascript:void(0);" class="nav-link" data-action="notifications" onclick="navigate('notifications')" style="color: black; text-decoration: none; padding: 5px;">4. Quản lý thông báo</a></li>
        <li><a href="javascript:void(0);" class="nav-link" data-action="update" onclick="navigate('update')" style="color: black; text-decoration: none; padding: 5px;">5. Cập nhật thông tin</a></li>
    </ul>
</aside>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const currentAction = urlParams.get("action") || "view"; // Mặc định "view"
        const links = document.querySelectorAll(".nav-link");

        links.forEach(link => {
            if (link.dataset.action === currentAction) {
                link.style.fontWeight = "bold";  // Làm đậm
                link.style.color = "blue";      // Đổi màu xanh
            }
        });
    });

    function navigate(action) {
        window.location.href = "/customer?action=" + action;
    }
</script>
    

<main>
      <div class="main-header">Cập Nhật Thông Tin Khách Hàng</div>
      <div class="main-info">
        <form id="updateForm">
    <label for="customerId">Mã khách hàng:</label>
    <input type="text" id="customerId" name="customerId" readonly />

    <label for="fullname">Họ và tên:</label>
    <input type="text" id="fullname" name="fullname" required />

    <label for="dob">Ngày sinh:</label>
    <input type="date" id="dob" name="dob" required />

    <label for="gender">Giới tính:</label>
    <select id="gender" name="gender">
        <option value="Nam">Nam</option>
        <option value="Nữ">Nữ</option>
        <option value="Khác">Khác</option>
    </select>

    <label for="phone">Số điện thoại:</label>
    <input type="text" id="phone" name="phone" required />

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" readonly />

    <button type="submit">Cập nhật</button>
</form>
        <div id="successMessage" class="success-message">Cập nhật thành công!</div>
      </div>
    </main>

  </div>
  <footer>
    <div class="contact-info">
      <img alt="Logo công ty" src="" />
      <div>
        <p><i class="fas fa-building"></i> </p>
        <p><i class="fas fa-envelope"></i> </p>
        <p><i class="fas fa-phone"></i> </p>
      </div>
    </div>
    <div class="social-icons">
      <a href="#"><i class="fab fa-facebook"></i></a>
      <a href="#"><i class="fab fa-instagram"></i></a>
      <a href="#"><i class="fab fa-twitter"></i></a>
      <a href="#"><i class="fab fa-linkedin"></i></a>
    </div>
  </footer>
<% if (request.getAttribute("success") != null) { %>
    <div class="alert alert-success"><%= request.getAttribute("success") %></div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
<% } %>

  <script>
 document.addEventListener("DOMContentLoaded", function () {
    // Gọi API lấy thông tin khách hàng
    fetch("/customer?format=json")
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById("customerId").value = data.customer.id;
                document.getElementById("fullname").value = data.customer.name;
                document.getElementById("dob").value = data.customer.dob;
                document.getElementById("gender").value = data.customer.gender;
                document.getElementById("phone").value = data.customer.phone;
                document.getElementById("email").value = data.customer.email;
            } else {
                alert("Không thể tải dữ liệu khách hàng!");
            }
        })
        .catch(error => console.error("Lỗi khi lấy dữ liệu:", error));

    const form = document.getElementById("updateForm");

    form.addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn form gửi theo cách mặc định

    const formData = new FormData(form);
    formData.delete("customerId"); // Không gửi ID
    formData.delete("email"); // Không gửi email

    const jsonData = {};
    formData.forEach((value, key) => {
        jsonData[key] = value;
    });

    console.log("Dữ liệu JSON sẽ gửi:", jsonData); // Kiểm tra JSON trước khi gửi

    fetch("/customer?action=update", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(jsonData)
    })
    .then(response => response.json())
    .then(data => {
        console.log("Phản hồi từ server:", data); // Xem phản hồi từ server
        if (data.success) {
            alert("Cập nhật thông tin thành công!");
            location.reload();
        } else {
            alert("Lỗi: " + data.error);
        }
    })
    .catch(error => alert("Có lỗi xảy ra!"));
});

});

  </script>
</body>
</html>