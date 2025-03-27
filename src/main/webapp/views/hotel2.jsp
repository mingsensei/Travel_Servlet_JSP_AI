<%@page import="java.math.BigDecimal"%>
<%@page import="com.servlet.tiasm.repository.HotelDAO"%>
<%@page import="com.servlet.tiasm.model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travelmng</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/hotel.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

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

</body>
<div class="main-container">
    <aside class="sidebar">
        <!-- NEW - Phần Điểm đến nổi bật -->
        <div class="sidebar-section">
            <h3 class="sidebar-title">Hotels nổi bật</h3>

            <!-- Đà Nẵng -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/hotel?action=3" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/TMS.jpeg" alt="TMS Hotel" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">TMS Hotel Da Nang Beach</h4>
                        <p class="destination-description">
                            Tận hưởng dịch vụ đỉnh cao, đẳng cấp thế giới tại TMS Hotel Da Nang Beach
                        </p>
                    </div>
                </a>
            </div>

            <!-- Hội An -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/hotel?action=1" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/Halongbay.jpeg" alt="Ha Long Bay" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Ha Long Bay</h4>
                        <p class="destination-description">
                            Trải nghiệm dịch vụ đẳng cấp thế giới ở Vinpearl Resort & Spa Ha Long
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </aside>

    <!-- Nội dung chính -->
    <main class="main-content">
        <!-- Phần hình ảnh lớn -->
        <h1>Sai Gon Night Hotel</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/saigon.jpeg" alt="Sai Gon Night Hotel" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Sai Gon Night Hotel một nơi với những dịch vụ đa dạng và sang trọngtrọng</h1>
                <div class="news-meta">
                    <span>🏆 Top 1 điểm đến yêu thích</span>
                    <span>🌴 50+ địa điểm check-in</span>
                    <span>🍜 Món ăn được phụ vụ đa dạng</span>

                </div>

            </div>

            <!-- Box booking -->
 <!-- Box booking -->

<%
    int serviceId = 2; // Bạn có thể lấy serviceId từ request nếu cần
    HotelDAO hotelDAO = new HotelDAO();
    BigDecimal price = hotelDAO.read(serviceId).getPricePerPerson();
%>

<div class="booking-box">
    <div class="price-tag">
        Chỉ từ <br>
        <span style="font-size: 36px;"><%= price %>$</span>
    </div>

    <form action="<%= request.getContextPath() %>/cart" method="post">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="serviceId" value="<%= serviceId %>">
        <input type="hidden" name="serviceType" value="hotel">
        <button type="submit" class="booking-button">
            ĐẶT TOUR NGAY
            <span style="display: block; font-size: 14px; margin-top: 5px;">(Ưu đãi 15% hôm nay)</span>
        </button>
    </form>
        
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("form").addEventListener("submit", function () {
                this.querySelector("button[type=submit]").disabled = true;
            });
        });
    </script>
</div>
</div>


        </section>
        <h1>Tận hưởng dịch vụ đa dạng, phong phú và sang trọng tại Sai Gon Night Hotel</h1>
        <h3>Tại sao Sai Gon Night Hotel là điểm đến lý tưởng?</h3>
        <h4>Vị trí thuận tiện:</h4>
        <p class="text-center">Nằm tại vị trí thuận tiện ở Quận Phú Nhuận, TP. Hồ Chí Minh, SaiGon Night Hotel mang đến sự kết hợp hoàn hảo giữa sự tiện nghi và vị trí lý tưởng cho những ai muốn khám phá thành phố năng động này. Với vị trí chỉ cách Bảo tàng Chứng tích chiến tranh 3.4 km, Dinh Thống Nhất 3.6 km và Trung Tâm Thương Mại Diamond Plaza 4 km, khách sạn dễ dàng tiếp cận các điểm du lịch nổi tiếng của thành phố. Đặc biệt, khách sạn còn chỉ cách Chợ Tân Định 2.4 km, nơi khách có thể trải nghiệm các món ăn đặc sản địa phương và mua sắm các mặt hàng thủ công độc đáo.</p>
        <p class="text-center">Khách sạn cũng chỉ cách Bưu điện Trung tâm 4.1 km và Chợ Bến Thành 4.3 km, nơi bạn có thể tận hưởng không khí sôi động của thành phố và mua sắm những món quà lưu niệm đặc trưng.</p>
        <h4>Tiện nghi phòng:</h4>
        <p class="text-center">Khách sạn 3 sao này không chỉ nổi bật với dịch vụ phòng và quầy lễ tân hoạt động 24 giờ, mà còn cung cấp môi trường nghỉ ngơi thoải mái, không hút thuốc, đảm bảo không gian trong lành và yên tĩnh cho khách hàng.</p>
        <p class="text-center">Các phòng khách tại SaiGon Night Hotel đều được trang bị đầy đủ tiện nghi hiện đại, bao gồm điều hòa không khí, TV màn hình phẳng với các kênh truyền hình vệ tinh, và ấm đun nước để phục vụ nhu cầu pha trà hoặc cà phê. Phòng tắm riêng được trang bị vòi sen, đồ vệ sinh cá nhân miễn phí và máy sấy tóc, mang đến sự tiện lợi tối đa cho khách. Bàn làm việc trong mỗi phòng là lựa chọn lý tưởng cho những khách có nhu cầu làm việc trong suốt kỳ nghỉ. Ngoài ra, tất cả các phòng đều có ga trải giường sạch sẽ và thoải mái, tạo nên không gian nghỉ ngơi lý tưởng cho khách.</p>
        <p class="text-center">Khách sạn cũng cung cấp dịch vụ thư giãn tại quầy bar, nơi bạn có thể thưởng thức những ly đồ uống nhẹ nhàng, hoặc sử dụng dịch vụ văn phòng nếu có công việc cần giải quyết. Dù bạn đến để công tác hay nghỉ dưỡng, SaiGon Night Hotel đều là sự lựa chọn hoàn hảo cho những ai muốn trải nghiệm vẻ đẹp của TP. Hồ Chí Minh.</p>
        <p class="text-center"><strong>Các cặp đôi đặc biệt thích vị trí xuất sắc</strong> — họ cho điểm <strong>9,6</strong> khi đánh giá chuyến đi hai người.</p>

<h2 class="text-center">Các tiện nghi được ưa chuộng nhất</h2>
<div class="amenities">
    <div class="amenity-item">
        <i class="fas fa-swimmer" style="color: #0056b3;"></i> Hồ bơi ngoài trời
    </div>
    <div class="amenity-item">
        <i class="fas fa-wifi" style="color: #0056b3;"></i> WiFi miễn phí
    </div>
    <div class="amenity-item">
        <i class="fas fa-shuttle-van" style="color: #0056b3;"></i> Xe đưa đón sân bay
    </div>
    <div class="amenity-item">
        <i class="fas fa-users" style="color: #0056b3;"></i> Phòng gia đình
    </div>
    <div class="amenity-item">
        <i class="fas fa-umbrella-beach" style="color: #0056b3;"></i> Giáp biển
    </div>
    <div class="amenity-item">
        <i class="fas fa-spa" style="color: #0056b3;"></i> Trung tâm Spa & chăm sóc sức khỏe
    </div>
    <div class="amenity-item">
        <i class="fas fa-dumbbell" style="color: #0056b3;"></i> Trung tâm thể dục
    </div>
    <div class="amenity-item">
        <i class="fas fa-smoking-ban" style="color: #0056b3;"></i> Phòng không hút thuốc
    </div>
    <div class="amenity-item">
        <i class="fas fa-cocktail" style="color:#0056b3;"></i> Quầy bar
    </div>
    <div class="amenity-item">
        <i class="fas fa-utensils" style="color: #0056b3;"></i> Bữa sáng tuyệt hảo
    </div>
</div>
        <section class="comment-section">
            <div class="comment-header">
                <h3>Bình luận của bạn:</h3>
            </div>
            <div class="comment-content">
                <form>
                    <label for="name">Họ và tên:</label>
                    <input type="text" id="name" name="name" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="message">Nội dung:</label>
                    <textarea id="message" name="message" rows="4" required></textarea>

                    <button type="submit" class="submit-button">Gửi bình luận</button>
                </form>
            </div>
        </section>
    </main>
</div>
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

</html>q