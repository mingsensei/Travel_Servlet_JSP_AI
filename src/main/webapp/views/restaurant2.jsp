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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurant_02.css">
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
                <a href="<%= request.getContextPath() %>/restaurant?action=1" class="destination-link">
                    <img src="<%= request.getContextPath() %>/images/khonggianSeaFood.jpg" alt="Ha Long Bay" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Golden Dragon Seafood</h4>
                        <p class="destination-description">
                            "Trải nghiệm hương vị hải sản vàng, đậm đà như rồng vàng giữa biển cả."
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </aside>

    <!-- Nội dung chính -->
    <main class="main-content">
        <!-- Phần hình ảnh lớn -->
        <h1>Ha Long Bay Seafood Delight</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/HaLongBaySeafoodDelight.jpg" alt="" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Ha Long Bay Seafood Delight-Nhà hàng hải sản</h1>
                <div class="news-meta">
                    <span>Sun, 25/02/2018</span>
                    <span>📍 084511, Hải Châu District, Zone of the Villas of Green Island, Lot A1</span>
                </div>

            </div>

            <!-- Box booking -->
             <%
    int serviceId = 13; // Bạn có thể lấy serviceId từ request nếu cần
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
        <h1>Ha Long Bay Seafood Delight: Điểm Đến Lý Tưởng Cho Tín Đồ Hải Sản Và Ẩm Thực Ý</h1>
        <h3>Tại sao Ha Long Bay Seafood Delight là điểm đến lý tưởng?</h3>
        <h4>Vị trí thuận tiện:</h4>
        <p class="text-center">Nằm ở vị trí trung tâm thuận tiện, Ha Long Bay Seafood Delight chính là điểm đến không thể bỏ qua cho những tín đồ hải sản và ẩm thực Ý. Nhà hàng mang đến những món ăn tươi ngon từ biển cả Hạ Long, kết hợp với các món Ý đậm đà hương vị. Bạn có thể thưởng thức những món như tôm hùm nướng bơ tỏi, cua sốt hải sản đặc biệt, hay pizza Italia với lớp vỏ mỏng giòn tan, pasta sốt kem Parmesan ngậy béo. Với không gian sang trọng, ấm cúng và đội ngũ nhân viên chu đáo, Ha Long Bay Seafood Delight sẽ mang đến cho bạn một trải nghiệm ăn uống khó quên. Nhà hàng cũng có phòng VIP riêng tư lý tưởng cho những buổi gặp gỡ bạn bè, đối tác hay tổ chức tiệc.</p>
        <h4>Tinh Hoa Ẩm Thực Trong Không Gian Thư Giãn</h4>
        <p class="text-center">Không chỉ nổi bật với hải sản tươi sống, Ha Long Bay Seafood Delight còn làm say lòng thực khách với những món Ý truyền thống. Pizza tại đây có lớp vỏ giòn, sốt cà chua tươi ngon và phô mai béo ngậy. Pasta mềm mịn, sốt kem thơm lừng kết hợp với hải sản tươi ngon mang lại hương vị tuyệt vời. Bên cạnh đó, món risotto đậm đà, hòa quyện giữa hải sản và gạo Arborio, chắc chắn sẽ khiến bạn hài lòng. Không gian nhà hàng được thiết kế tinh tế với sự kết hợp giữa phong cách hiện đại và nét đẹp Á Đông. Nội thất gỗ cao cấp, đèn lồng lụa và tiểu cảnh nước tạo nên một không gian thư thái và đầy cảm hứng. Bạn có thể chọn ngồi trong không gian chung ấm cúng, hay tìm một góc riêng tư trong phòng VIP, hoặc thoải mái thưởng thức bữa ăn ngoài trời mát mẻ.</p>
        <h4>Top những món hot của quán</h4>
        <table width="600" style="margin: 0 auto;">
            <tr>
                <td align="right" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/Pizza.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
                <td align="center" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/Pasta.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
                <td align="left" style="padding: 10px;">
                    <img src="<%= request.getContextPath() %>/images/Risotto.jpg" alt="" style="width: 300px; height: auto; border-radius: 8px;">
                </td>
            </tr>
            <tr>
                <td align="center" style="padding: 10px;">Pizza – Vị đậm đà, giòn tan, thỏa mãn mọi giác quan.</td>
                <td align="center" style="padding: 10px;">Pasta – Sợi mì mềm mịn, hòa quyện với sốt thơm ngon.</td>
                <td align="center" style="padding: 10px;">Risotto – Cơm gạo Arborio béo ngậy, đậm đà hương vị Ý.</td>
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