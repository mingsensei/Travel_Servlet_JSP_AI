<%@page import="com.servlet.tiasm.model.User"%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelMng - Liên Hệ Với Chúng Tôi</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/contact.css">
</head>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        let elements = document.querySelectorAll(".reveal");
        function reveal() {
            let windowHeight = window.innerHeight;
            elements.forEach(el => {
                let position = el.getBoundingClientRect().top;
                if (position < windowHeight - 300) {
                    el.classList.add("active");
                }
            });
        }
        window.addEventListener("scroll", reveal);
        reveal();
    });
</script>

<body>
    <!-- Header -->
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

    <!-- Main Content - Contact Us -->
    <main>
        <section class="container mx-auto mt-8 px-4">
            <!-- Đội Ngũ Của Chúng Tôi với "Contact Us" làm background -->
            <div class="team-section relative">
                <h1 class="text-3xl font-bold text-center mb-6 reveal">Đội Ngũ Của Chúng Tôi</h1>
                <div class="grid grid-cols-2 md:grid-cols-3 gap-6 mb-12">
                    <!-- Thành viên 1 -->
                    <div class="text-center">
                        <img src="<%= request.getContextPath() %>/images/member1.jpg" alt="Thành viên 1" class="w-32 h-32 object-cover rounded-full mx-auto">
                        <p class="mt-2 font-semibold">Dương Hồng Minh</p>
                    </div>
                    <!-- Thành viên 2 -->
                    <div class="text-center">
                        <img src="<%= request.getContextPath() %>/images/member2.jpg" alt="Thành viên 2" class="w-32 h-32 object-cover rounded-full mx-auto">
                        <p class="mt-2 font-semibold">Hồ Trung Hiếu</p>
                    </div>
                    <!-- Thành viên 3 -->
                    <div class="text-center">
                        <img src="<%= request.getContextPath() %>/images/member3.jpg" alt="Thành viên 3" class="w-32 h-32 object-cover rounded-full mx-auto">
                        <p class="mt-2 font-semibold">Phạm Châu Vinh</p>
                    </div>
                    <!-- Thành viên 4 -->
                    <div class="text-center">
                        <img src="<%= request.getContextPath() %>/images/member4.jpg" alt="Thành viên 4" class="w-32 h-32 object-cover rounded-full mx-auto">
                        <p class="mt-2 font-semibold">Võ Đình Hoàng</p>
                    </div>
                    <!-- Thành viên 5 -->
                    <div class="text-center">
                        <img src="<%= request.getContextPath() %>/images/member5.jpg" alt="Thành viên 5" class="w-32 h-32 object-cover rounded-full mx-auto">
                        <p class="mt-2 font-semibold">Lê Vĩnh Tiến</p>
                    </div>
                    <!-- Thành viên 6 -->
                    <div class="text-center">
                        <img src="<%= request.getContextPath() %>/images/member6.jpg" alt="Thành viên 6" class="w-32 h-32 object-cover rounded-full mx-auto">
                        <p class="mt-2 font-semibold">Cao Nguyễn Đăng Khoa</p>
                    </div>
                </div>
            </div>

            <!-- Liên Hệ Với Chúng Tôi (Form liên hệ) -->
            <h1 class="text-3xl font-bold text-center mb-6 reveal">Liên Hệ Với Chúng Tôi</h1>
            <div class="bg-white shadow-md rounded-lg p-6 max-w-2xl mx-auto mb-12">
                <form action="#" method="POST">
                    <div class="mb-4">
                        <label for="name" class="block text-sm font-medium">Họ và tên</label>
                        <input type="text" id="name" name="name" class="w-full p-2 border rounded-md" placeholder="Nhập họ và tên" required>
                    </div>
                    <div class="mb-4">
                        <label for="email" class="block text-sm font-medium">Email</label>
                        <input type="email" id="email" name="email" class="w-full p-2 border rounded-md" placeholder="Nhập email" required>
                    </div>
                    <div class="mb-4">
                        <label for="phone" class="block text-sm font-medium">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone" class="w-full p-2 border rounded-md" placeholder="Nhập số điện thoại" required>
                    </div>
                    <div class="mb-4">
                        <label for="message" class="block text-sm font-medium">Tin nhắn</label>
                        <textarea id="message" name="message" class="w-full p-2 border rounded-md" rows="4" placeholder="Nhập tin nhắn của bạn" required></textarea>
                    </div>
                    <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded-md hover:bg-blue-600">Gửi Tin Nhắn</button>
                </form>
            </div>

            <!-- Về Chúng Tôi  -->
            <div class="about-section max-w-2xl mx-auto reveal">
                <h2 class="text-2xl font-bold text-center mb-6" style="animation: sparkle 1.5s infinite alternate;">
                    Về Chúng Tôi
                  </h2>
                  
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Khối 1 -->
                    <div class="about-card bg-white shadow-md rounded-lg p-4 text-center transition-all duration-300 hover:shadow-lg hover:-translate-y-2">
                        <i class="fas fa-globe fa-2x mb-2 text-blue-500"></i>
                        <h3 class="text-lg font-semibold">Sứ Mệnh</h3>
                        <p class="text-sm text-gray-600">Mang đến những chuyến du lịch đẳng cấp và trải nghiệm tuyệt vời cho mọi người.</p>
                    </div>
                    <!-- Khối 2 -->
                    <div class="about-card bg-white shadow-md rounded-lg p-4 text-center transition-all duration-300 hover:shadow-lg hover:-translate-y-2">
                        <i class="fas fa-users fa-2x mb-2 text-blue-500"></i>
                        <h3 class="text-lg font-semibold">Đội Ngũ</h3>
                        <p class="text-sm text-gray-600">Chúng tôi là nhóm 6 người đam mê du lịch và sáng tạo. Hãy cùng chúng tôi khám phá những điều mới mẻ.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <div class="contact-info">
          <img alt="Logo công ty" src="" />
          <div>
            <p><i class="fas fa-building"></i> We Bare Bears </p>
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
    
</body>
</html>