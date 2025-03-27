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
                <a href="<%= request.getContextPath() %>/hotel?action=2" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/saigon.jpeg" alt="Saigon Night Hotel" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Saigon Night Hotel</h4>
                        <p class="destination-description">
                            Saigon Night Hotel địa điểm nghỉ dưỡng đáng thử khi đến Sài Gòn
                        </p>
                    </div>
                </a>
            </div>

            <!-- Hội An -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/hotel?action=1" class="destination-link">
                    <img src="i<%= request.getContextPath() %>/images/Halongbay.jpeg" alt="Ha Long Bay" class="destination-image">
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
        <h1>TMS Hotel Da Nang Beach</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/TMS.jpeg" alt="Đà Nẵng" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">TMS Hotel Da Nang Beach một nơi đáng để thử khi đến Đà Nẵng</h1>
                <div class="news-meta">
                    <span>🏆 Top 1 điểm đến yêu thích</span>
                    <span>🌴 50+ địa điểm check-in</span>
                    <span>🍜 Món ăn được phụ vụ đa dạng</span>

                </div>

            </div>

            <!-- Box booking -->
      <!-- Box booking -->
<%
    int serviceId = 1; // Bạn có thể lấy serviceId từ request nếu cần
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


        </section>
        <h1>Tận hưởng dịch vụ đỉnh cao, đẳng cấp thế giới tại TMS Hotel Da Nang Beach</h1>
        <h3>Tại sao TMS Hotel Da Nang Beach là điểm đến lý tưởng?</h3>
        <h4>Vị trí thuận tiện:</h4>
        <p class="text-center">TMS Hotel Da Nang Beach tọa lạc tại vị trí lý tưởng ở Đà Nẵng, chỉ cách Bãi biển Mỹ Khê vài bước chân và Bãi biển Bắc Mỹ An 9 phút đi bộ, giúp khách dễ dàng tận hưởng không gian biển tuyệt vời. Khách sạn cũng gần các điểm tham quan nổi tiếng của thành phố, như Bảo tàng Chứng tích Chiến tranh và Dinh Thống Nhất. Với vị trí thuận lợi, du khách có thể khám phá các điểm du lịch hấp dẫn của Đà Nẵng như Trung Tâm Thương Mại Diamond Plaza hay Chợ Hàn, chỉ trong vài phút di chuyển.</p>
        <h4>Tiện nghi phòng:</h4>
        <p class="text-center">TMS Hotel Da Nang Beach có xe đạp miễn phí, hồ bơi ngoài trời, trung tâm thể dục và nhà hàng ở Đà Nẵng. Ngoài dịch vụ phòng, chỗ nghỉ này còn có sân chơi trẻ em. Chỗ nghỉ cung cấp lễ tân 24/24, dịch vụ đưa đón sân bay, câu lạc bộ trẻ em và Wi-Fi miễn phí ở toàn bộ chỗ nghỉ.</p>
        <p class="text-center">Tất cả các căn tại TMS Hotel Da Nang Beach đều được trang bị những tiện nghi hiện đại và đầy đủ để mang lại sự thoải mái tối đa cho khách hàng. Mỗi phòng đều có hệ thống điều hòa không khí, giúp duy trì không gian mát mẻ và dễ chịu trong suốt kỳ nghỉ. Khu vực ghế ngồi được thiết kế rộng rãi, lý tưởng cho những buổi tối thư giãn hoặc tiếp khách. TV màn hình phẳng với truyền hình cáp sẽ là lựa chọn tuyệt vời để bạn thưởng thức những chương trình yêu thích.</p>
        <p class="text-center">Khách tại TMS Hotel Da Nang Beach có thể thưởng thức bữa sáng thực đơn buffet hoặc kiểu lục địa. Đặc biệt, tất cả các phòng đều được trang bị ấm đun nước, phục vụ cho nhu cầu pha trà hoặc cà phê. Một số phòng còn có bếp với đầy đủ tiện nghi như tủ lạnh và lò vi sóng, giúp khách có thể tự chuẩn bị những bữa ăn nhẹ tại phòng. Phòng khách rộng rãi và được trang bị bàn làm việc, là không gian lý tưởng cho những ai cần làm việc trong kỳ nghỉ.</p>
        <p class="text-center">Khách có thể sử dụng dịch vụ văn phòng hoặc thư giãn tại quầy bar. Khách sạn còn cung cấp dịch vụ dọn phòng hàng ngày và hỗ trợ mọi yêu cầu của khách, đảm bảo rằng bạn sẽ có một kỳ nghỉ thư giãn và dễ chịu tại TMS Hotel Da Nang Beach.</p>
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

</html>