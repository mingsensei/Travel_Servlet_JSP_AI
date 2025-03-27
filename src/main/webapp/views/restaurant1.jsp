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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurant_01.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

</head>

<body>
    <header>
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
                <a href="<%= request.getContextPath() %>/restaurant?action=3" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/SaigonStreetEats.jpg" alt="Saigon Street Eats" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Saigon Street Eats</h4>
                        <p class="destination-description">
                            "Tận hưởng trọn vị Sài Gòn qua từng món ăn đường phố."
                        </p>
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
        <h1>Golden Dragon Seafood</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/khonggianSeaFood.jpg" alt="" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Golden Dragon Seafood-Nhà hàng hải sản</h1>
                <div class="news-meta">
                    <span>Sun, 25/02/2018</span>
                    <span>📍 084511, Hải Châu District, Zone of the Villas of Green Island, Lot A1</span>
                </div>

            </div>

            <!-- Box booking -->
            <%
    int serviceId = 11; // Bạn có thể lấy serviceId từ request nếu cần
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
</div>
        </section>
        <h1>Golden Dragon Seafood: Điểm Đến Lý Tưởng Cho Tín Đồ Hải Sản</h1>
        <h3>Tại sao Golden Dragon Seafood là điểm đến lý tưởng?</h3>
        <h4>Vị trí thuận tiện:</h4>
        <p class="text-center">Tọa lạc tại trung tâm thành phố, Golden Dragon Seafood là điểm hẹn lý tưởng cho những ai yêu thích hải sản tươi sống. Với nguồn nguyên liệu tuyển chọn kỹ lưỡng, nhà hàng mang đến những món ăn đặc sắc như tôm hùm nướng bơ tỏi, cua sốt Singapore, hàu sống sốt chanh dây. Không gian sang trọng kết hợp phong cách Á Đông hiện đại, cùng đội ngũ nhân viên chuyên nghiệp, đảm bảo trải nghiệm tuyệt vời cho thực khách. Ngoài ra, nhà hàng còn có phòng VIP riêng tư, thích hợp cho những buổi tiệc hoặc gặp gỡ đối tác. Golden Dragon Seafood cũng thường xuyên có ưu đãi hấp dẫn, từ giảm giá giờ vàng đến buffet hải sản đặc biệt. Hãy đến ngay để tận hưởng hương vị biển cả trong không gian đẳng cấp!</p>
        <h4>Tinh Hoa Ẩm Thực Trong Không Gian Nghệ Thuật</h4>
        <p class="text-center">Golden Dragon Seafood không chỉ nổi bật với hải sản tươi ngon mà còn sở hữu thiết kế sang trọng, kết hợp tinh tế giữa truyền thống Á Đông và phong cách hiện đại. Không gian rộng rãi với nội thất gỗ cao cấp, đèn lồng lụa và tiểu cảnh nước tạo nên trải nghiệm thư thái. Nhà hàng có khu vực ăn chung ấm cúng, phòng VIP riêng tư và không gian ngoài trời thoáng đãng. Đây là điểm đến lý tưởng để thưởng thức ẩm thực trong không gian đầy cảm hứng.</p>
        <h4>Top những món hot của quán</h4>
        <table width="600" style="margin: 0 auto;">
            <tr>
                <td align="right" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/shushi.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
                <td align="center" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/takoyaki.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
                <td align="left" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/tempura.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
            </tr>
            <tr>
                <td align="center" style="padding: 10px;">Thưởng Thức Sushi Tươi Ngon Tại Golden Dragon Seafood</td>
                <td align="center" style="padding: 10px;">Takoyaki bùng nổ vị giác</td>
                <td align="center" style="padding: 10px;">Giòn Tan Hấp Dẫn – Tempura Tại Golden Dragon Seafood</td>
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
        © 2025 BeeTravel | Cung cấp bởi Sapo
    </div>
</footer>
</body>

</html>