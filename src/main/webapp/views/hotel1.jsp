<%@page import="java.math.BigDecimal"%>
<%@page import="com.servlet.tiasm.repository.HotelDAO"%>
<%@page import="com.servlet.tiasm.model.BookingEntry"%>
<%@page import="java.util.ArrayList"%>
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
        </div>
    </aside>

    <!-- Nội dung chính -->
    <main class="main-content">
        <!-- Phần hình ảnh lớn -->
        <h1>Vinpearl Resort & Spa Ha Long</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/Halongbay.jpeg" alt="Hạ LongLong" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Vinpearl Resort & Spa Ha Long </h1>
                <div class="news-meta">
                    <span>🏆 Top 1 điểm đến yêu thích</span>
                    <span>🌴 50+ địa điểm check-in</span>
                    <span>🍜 Món ăn được phụ vụ đa dạng</span>

                </div>

            </div>

<!-- Box booking -->
<%
    int serviceId = 3; // Bạn có thể lấy serviceId từ request nếu cần
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
        <h1>Trải nghiệm những dịch vụ đẳng cấp tại Vinpearl Resort & Spa Ha Long</h1>
        <h3>Vinpearl Resort & Spa đắm chìm trong vẻ đẹp mê hồn của Vịnh Hạ Long</h3>
        <h4>Vị trí thuận tiện:</h4>
        <p class="text-center">Hãy lánh khỏi cuộc sống thường nhật và đắm chìm trong sự sang trọng tại Vinpearl Resort & Spa Ha Long, nơi chỉ cách bờ biển của Vịnh Hạ Long 5 phút đi thuyền cao tốc. Với những dãy núi đá vôi vô cùng hùng vĩ bao quanh, khu nghỉ dưỡng 5 sao sang trọng này nằm trên một hòn đảo riêng và có ba bãi biển riêng, những khu vườn xanh mướt, những hồ bơi ngoài trời và trong nhà rộng lớn cùng một spa thư giãn. Du khách có thể thưởng thức các món ăn Việt Nam hoặc quốc tế ngon tại một trong ba nhà hàng hoặc đơn giản là thư giãn trong phòng hoặc suite rộng rãi có ban công riêng, đồng thời ngắm nhìn khung cảnh tuyệt đẹp. Cho dù du khách đang tìm kiếm một nơi lánh mình lãng mạn, kỳ nghỉ gia đình, chỗ nghỉ sang trọng, Vinpearl Resort & Spa Ha Long hứa hẹn sẽ mang đến một trải nghiệm không thể nào quên được. Sân bay gần nhất là sân bay quốc tế Cát Bi.</p>
        <h4>Tiện nghi phòng:</h4>
        <p class="text-center">Mỗi phòng nghỉ tại Vinpearl Resort & Spa Ha Long đều được trang bị đầy đủ các tiện nghi cao cấp nhằm mang lại sự thoải mái tuyệt đối cho du khách. Các phòng rộng rãi đều có máy điều hòa, ban công riêng để du khách có thể thư giãn và ngắm nhìn khung cảnh tuyệt đẹp của Vịnh Hạ Long. TV màn hình phẳng với truyền hình cáp, két an toàn, minibar và Wi-Fi miễn phí cũng được trang bị trong mọi phòng để khách có thể tiện lợi sử dụng.</p>
        <p class="text-center">Phòng tắm riêng hiện đại với bồn tắm sang trọng, vòi sen, máy sấy tóc và đồ vệ sinh cá nhân cao cấp đảm bảo mang lại sự thư giãn tối đa. Những tiện nghi trong phòng còn bao gồm một chiếc bàn làm việc, tạo điều kiện cho khách có thể làm việc hoặc tận hưởng một không gian yên tĩnh.</p>
        <p class="text-center">Ngoài ra, một số phòng còn có các dịch vụ cao cấp như dịch vụ phòng 24/7, giúp du khách có thể tận hưởng những bữa ăn ngon ngay tại phòng của mình mà không cần phải ra ngoài. Các suite cao cấp có thể có bể bơi riêng hoặc bồn tắm jacuzzi để mang lại cảm giác thư giãn tuyệt vời.</p>
        <p class="text-center">Đặc biệt, trung tâm thể dục hiện đại, các sân tennis và sân golf gần đó, cùng với sân chơi ngoài trời và CLB trẻ em cũng nằm trong số các tiện nghi mà khu nghỉ dưỡng cung cấp, đảm bảo rằng mọi thành viên trong gia đình đều có thể tận hưởng kỳ nghỉ một cách trọn vẹn.</p>
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