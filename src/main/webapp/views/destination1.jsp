<%@page import="java.math.BigDecimal"%>
<%@page import="com.servlet.tiasm.repository.HotelDAO"%>
<%@page import="com.servlet.tiasm.model.User"%>
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/destination.css">

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
            <h3 class="sidebar-title">Điểm đến nổi bật</h3>

            <!-- Đà Nẵng -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/destination?action=1" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/danang.jpg" alt="Đà Nẵng" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Đà Nẵng</h4>
                        <p class="destination-description">
                            Thành phố biển với cầu Rồng, Bà Nà Hills và ẩm thực độc đáo
                        </p>
                    </div>
                </a>
            </div>

            <!-- Hội An -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/destination?action=3" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/hoian.jpg" alt="Hội An" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Hội An</h4>
                        <p class="destination-description">
                            Phố cổ di sản thế giới với kiến trúc đèn lồng rực rỡ
                        </p>
                    </div>
                </a>
            </div>

            <!-- Sai Gon -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/destination?action=1" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/saigon.jpg" alt="Sai Gon" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">TP Hồ Chí Minh</h4>
                        <p class="destination-description">
                            Sài Gòn hoa lệ thủ phủ của miền Nam Việt Nam
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </aside>

    <!-- Nội dung chính -->
    <main class="main-content">
        <!-- Phần hình ảnh lớn -->
        <h1>Tại sao phải chọn Đà Nẵng để đi du lịch</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/mages/danang.jpg" alt="Đà Nẵng" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Đà Nẵng - Thành phố đáng sống 2024</h1>
                <div class="news-meta">
                    <span>🏆 Top 1 điểm đến yêu thích</span>
                    <span>🌴 50+ địa điểm check-in</span>
                    <span>🍜 100+ món ăn đặc sản</span>

                </div>

            </div>

            <!-- Box booking -->
            

<%
    int serviceId = 21; // Bạn có thể lấy serviceId từ request nếu cần
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
        <input type="hidden" name="serviceType" value="destination">
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
        <h3>Tại sao Đà Nẵng là điểm đến lý tưởng?</h3>
        <h4>Thiên đường biển xanh:</h4>
        <p>Bãi biển Mỹ Khê: Một trong những bãi biển quyến rũ nhất hành tinh,
        <p>Bán đảo Sơn Trà: Với cảnh quan hùng vĩ,Chùa Linh Ứng và những rặng san hô tuyệt đẹp.</p>
        <p>Bãi biển Non Nước: Bãi biển yên bình, lý tưởng để thư giãn và tận hưởng không gian riêng tư.</p>
        <p>Bãi Bụt: Những rặng san hô tuyệt đẹp, lặn biển ngắm san hô.</p>
        <p>Bãi biển Xuân Thiều: Nổi tiếng với bãi cát đỏ độc đáo.</p>
        <h4>Khám phá thiên nhiên kỳ vĩ:</h4>
        <p>Ngũ Hành Sơn: Quần thể núi đá vôi với những hang động huyền bí.</p>
        <p>Đèo Hải Vân: Cung đường đèo ngoạn mục, nơi giao thoa giữa núi non và biển cả.</p>
        <p>Hồ xanh Sơn Trà: Vẻ đẹp xanh biếc, không gian yên bình.</p>
        <p>Rừng dừa Bảy Mẫu: Trải nghiệm đi thuyền thúng, xem biểu diễn thúng chai.</p>
        <p>Suối Mơ: Không gian mát mẻ, trong lành, vui chơi dưới nước.</p>
        <p>Khu du lịch sinh thái Tiên Sa: Nhiều hoạt động vui chơi giải trí ngoài trời.</p>
        <h4>Thưởng thức ẩm thực đặc sắc:</h4>
        <p>Mì Quảng: Món ăn đặc trưng của Đà Nẵng, với sợi mì dai ngon và nước dùng đậm đà.</p>
        <p>Hải sản tươi sống: Đà Nẵng là thiên đường của hải sản, với nhiều nhà hàng nổi tiếng.</p>
        <p>Bún chả cá Đà Nẵng: hương vị đậm đà khó quên.</p>
        <p>Gỏi cá Nam Ô: Món ăn đặc sản với hương vị độc đáo.</p>
        <p>Bánh xèo nem lụi: Món ăn vặt hấp dẫn.</p>
        <h4>Gợi ý lịch trình:</h4>
        <p>Ngày 1: Khám phá bãi biển Mỹ Khê, tham quan bán đảo Sơn Trà và Chùa Linh Ứng.</p>
        <p>Ngày 2: Ghé thăm Ngũ Hành Sơn, di chuyển đến Hội An và khám phá phố cổ về đêm.</p>
        <p>Ngày 3: Đến với Bà Nà Hills, vui chơi và ngắm cảnh từ trên cao.</p>
        <p>Ngày 4: Thưởng thức những món ăn đặc sản của Đà Nẵng và mua sắm tại chợ Hàn.</p>


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