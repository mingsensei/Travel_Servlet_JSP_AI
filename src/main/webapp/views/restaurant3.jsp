<%@page import="com.servlet.tiasm.repository.RestaurantDAO"%>
<!DOCTYPE html><%@page import="java.math.BigDecimal"%>
<%@page import="com.servlet.tiasm.repository.HotelDAO"%>
<%@page import="com.servlet.tiasm.model.BookingEntry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.servlet.tiasm.model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travelmng</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurant_03.css">
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
                <a href="<%= request.getContextPath() %>/restaurant?action=1" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/khonggianSeaFood.jpg" alt="Saigon Street Eats" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Golden Dragon Seafood</h4>
                        <p class="destination-description">
                            "Thưởng thức hải sản tươi ngon, đậm đà hương vị rồng vàng."
                    </div>
                </a>
            </div>

            <!-- Hội An -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/restaurant?action=2" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/HaLongBaySeafoodDelight.jpg" alt="Ha Long Bay" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Ha Long Bay Seafood Delight</h4>
                        <p class="destination-description">
                            "Trải nghiệm hương vị biển cả Hạ Long trong từng món hải sản tinh tế."
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </aside>

    <!-- Nội dung chính -->
    <main class="main-content">
        <!-- Phần hình ảnh lớn -->
        <h1>Saigon Street Eats</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/SaigonStreetEats.jpg" alt="" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Saigon Street Eats-Ăn uống đường phố</h1>
                <div class="news-meta">
                    <span>Sun, 25/02/2018</span>
                    <span>📍 084511, Hải Châu District, Zone of the Villas of Green Island, Lot A1</span>
                </div>

            </div>

            <!-- Box booking -->
             <%
    int serviceId = 12; // Bạn có thể lấy serviceId từ request nếu cần
    RestaurantDAO resDAO = new RestaurantDAO();
    BigDecimal price = resDAO.read(serviceId).getPricePerPerson();
%>

<div class="booking-box">
    <div class="price-tag">
        Chỉ từ <br>
        <span style="font-size: 36px;"><%= price %>$</span>
    </div>

    <form action="<%= request.getContextPath() %>/cart" method="post">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="serviceId" value="<%= serviceId %>">
        <input type="hidden" name="serviceType" value="restaurant">
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
        </section>
        <h1>Saigon Street Eats: Hành Trình Khám Phá Hương Vị Đặc Sắc Của Ẩm Thực Việt Nam Và Hải Sản</h1>
        <h3>Tại sao Golden Dragon Seafood là điểm đến lý tưởng?</h3>
        <h4>Vị trí thuận tiện:</h4>
        <p class="text-center">
            Saigon Street Eats tọa lạc tại trung tâm thành phố, là một điểm hẹn không thể bỏ qua cho những ai yêu thích khám phá hương vị đặc trưng của ẩm thực Việt Nam và hải sản tươi ngon. Với không gian hiện đại nhưng gần gũi, nhà hàng mang đến những món ăn đậm đà bản sắc văn hóa Việt. Các món ăn nổi bật như bún riêu cua, hủ tiếu Sài Gòn, gỏi cuốn tươi mát cùng hải sản tươi ngon như tôm nướng muối ớt, cua rang me, hay hàu sống sốt chanh dây đều khiến thực khách nhớ mãi. Không gian của Saigon Street Eats được thiết kế để mang lại trải nghiệm ăn uống thoải mái và thư giãn, với đội ngũ nhân viên nhiệt tình luôn sẵn sàng phục vụ.</p>
        <h4>Khám Phá Hương Vị Việt Nam Trong Không Gian Đậm Chất Địa Phương</h4>
        <p class="text-center">Saigon Street Eats không chỉ là nơi để thưởng thức những món ăn đường phố nổi tiếng của Sài Gòn mà còn mang đến một trải nghiệm đầy mới mẻ với các món hải sản tươi ngon. Mỗi món ăn tại đây đều được chế biến từ nguyên liệu tươi ngon nhất, từ gạo, rau củ, cho đến hải sản, đảm bảo giữ trọn vẹn hương vị tự nhiên. Bạn có thể thưởng thức những món như bún riêu cua nóng hổi, hủ tiếu sợi mềm dai kết hợp với nước dùng ngọt thanh, gỏi cuốn tươi mát cuốn cùng tôm và thịt, hay những món hải sản được chế biến vừa miệng như cua sốt me, tôm nướng muối ớt cay nồng, hay hàu sống sốt chanh dây vừa chua vừa ngọt. Không gian nhà hàng được thiết kế mang đậm dấu ấn văn hóa Việt với những họa tiết truyền thống và nội thất đơn giản nhưng tinh tế, tạo ra một không gian ăn uống thư giãn và dễ chịu.</p>
        <h4>Top những món hot của quán</h4>
        <table width="600" style="margin: 0 auto;">
            <tr>
                <td align="right" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/Bún riêu cua.webp" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
                <td align="center" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/Hủ tiếu Sài Gòn.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
                <td align="left" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/Gỏi cuốn tươi mát.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
            </tr>
            <tr>
                <td align="center" style="padding: 10px;">Bún riêu cua – Nước dùng ngọt thanh, cua tươi ngon, đậm đà hương vị Sài Gòn.</td>
                <td align="center" style="padding: 10px;">Hủ tiếu Sài Gòn – Sợi hủ tiếu mềm mịn, nước dùng ngọt dịu, tròn vị đặc trưng.</td>
                <td align="center" style="padding: 10px;">Gỏi cuốn tươi mát – Tôm, thịt cuốn rau sống, chấm nước mắm chua ngọt.</td>
            </tr>
        </table>
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
        © 2025 TravelMng | Cung cấp bởi Sapo
    </div>
</footer>
</body>

</html>