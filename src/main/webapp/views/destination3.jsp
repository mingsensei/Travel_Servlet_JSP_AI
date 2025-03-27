<%@page import="com.servlet.tiasm.repository.DestinationDAO"%>
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
                <a href="lamlai.html" class="destination-link">
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
                <a href="lamlai3.html" class="destination-link">
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
                <a href="lamlai2.html" class="destination-link">
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
        <h1>Tại sao phải chọn Hội An để đi du lịch</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/hoian.jpg" alt="Đà Nẵng" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Hội An thành phố cổ</h1>
                <div class="news-meta">
                    <span>🏆 Top 1 điểm đến yêu thích</span>
                    <span>🌴 50+ địa điểm check-in</span>
                    <span>🍜 100+ món ăn đặc sản</span>

                </div>

            </div>

            <!-- Box booking -->
  
<%
    int serviceId = 21; // Bạn có thể lấy serviceId từ request nếu cần
    DestinationDAO desDAO = new DestinationDAO();
    BigDecimal price = desDAO.read(serviceId).getPricePerPerson();
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
        </section>
        <h3>Tại sao nên chọn Hội An là điểm đến lý tưởng?</h3>
        <h4>Vẻ đẹp cổ kính:</h4>
        <p>Phố cổ Hội An: Di sản văn hóa thế giới được UNESCO công nhận, với những dãy nhà cổ kính màu vàng đặc trưng,
            những con phố đèn lồng lung linh về đêm.</h4>
        <p>Chùa Cầu: Biểu tượng kiến trúc độc đáo, kết nối văn hóa Việt - Nhật.</p>
        <p>Những ngôi nhà cổ: Nhà cổ Tấn Ký, nhà cổ Phùng Hưng, nhà cổ Quân Thắng... mang đậm dấu ấn lịch sử.</p>
        <p>Các hội quán cổ: Hội quán Phúc Kiến, hội quán Quảng Đông, hội quán Triều Châu... nơi sinh hoạt cộng đồng của
            người Hoa.</p>
        <p>Những con hẻm nhỏ rêu phong, những mái ngói cổ kính, những bức tường vàng nhuốm màu thời gian.</p>
        <h4>Trải nghiệm văn hóa đa dạng:</h4>
        <p>Dạo thuyền trên sông Hoài, thả đèn hoa đăng, cầu nguyện những điều tốt đẹp.</p>
        <p>Thưởng thức những màn trình diễn nghệ thuật truyền thống: Hát bài chòi, múa rối nước...</p>
        <p>Tham quan các làng nghề truyền thống: Làng gốm Thanh Hà, làng rau Trà Quế, làng lụa Hội An...</p>
        <p>Khám phá chợ Hội An, nơi bày bán các mặt hàng thủ công mỹ nghệ, đồ lưu niệm và đặc sản địa phương.</p>
        <p>Tham gia các lớp học nấu ăn, học làm đèn lồng, học may áo dài...</p>
        <h4>Thiên đường ẩm thực:</h4>
        <h4>Hội An nổi tiếng với những món ăn đặc sản như:</h4>
        <p>Mì Quảng: Món ăn đặc trưng của Hội An, với sợi mì dai ngon và nước dùng đậm đà. </p>
        <p>Cao lầu: Món ăn độc đáo, chỉ có ở Hội An, với sợi mì dai ngon, thịt xíu và rau sống.</p>
        <P>Bánh mì Hội An: Bánh mì giòn rụm, kẹp thịt, chả, pate, rau thơm và nước sốt đậm đà.
        </P>
        <p>Các món hải sản tươi ngon: Tôm, cua, mực, cá... được chế biến theo nhiều cách khác nhau.</p>
        <p> Các món chè: Chè bắp, chè đậu xanh, chè mè đen...</p>
        <h4>Gợi ý lịch trình:</h4>
        <p>Buổi sáng: Khám phá phố cổ, tham quan các di tích lịch sử.</p>
        <p>Buổi chiều: Thư giãn tại các bãi biển hoặc tham gia các lớp học nấu ăn.</p>
        <p>Buổi tối: Dạo chơi phố đèn lồng, thưởng thức ẩm thực địa phương, thả đèn hoa đăng.</p>
        <p>Tham quan Cù lao Chàm 1 ngày.</p>
        <p>Hội An chắc chắn sẽ mang đến cho quý khách những trải nghiệm đáng nhớ về một thành phố cổ kính, lãng mạn và
            đầy sức quyến rũ.</p>


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