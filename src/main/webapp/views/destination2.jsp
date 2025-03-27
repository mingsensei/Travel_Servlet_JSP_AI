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
                <a href="<%= request.getContextPath() %>/destination?action=2" class="destination-link">
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
        <h1>Tại sao phải chọn Hồ Chí Minh để đi du lịch</h1>
        <section class="hero-section">
            <img src="<%= request.getContextPath() %>/images/saigon.jpg" alt="Đà Nẵng" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">TP Hồ Chí Minh-Sôi động và hấp dẫn</h1>
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
        <h3>Tại sao nên chọn Hồ Chí Minh là điểm đến lý tưởng?</h3>
        <h4>Khám phá lịch sử và văn hóa:</h4>
        <p>Dinh Độc Lập: Chứng nhân lịch sử, nơi ghi dấu sự kiện thống nhất đất nước.</p>
        <p>Nhà thờ Đức Bà: Biểu tượng kiến trúc Pháp cổ kính giữa lòng thành phố.</p>
        <p>Bưu điện Thành phố: Công trình kiến trúc độc đáo, </p>
        <p>Chợ Bến Thành: Khu chợ truyền thống sầm uất, nơi du khách có thể tìm thấy đủ loại hàng hóa và đặc sản địa
            phương.</p>
        <p>Bến Nhà Rồng – Bảo tàng Hồ Chí Minh: Nơi Bác Hồ ra đi tìm đường cứu nước.</p>
        <p>Địa đạo Củ Chi: Tìm hiểu về hệ thống địa đạo kháng chiến độc đáo.</p>
        <h4>Trải nghiệm nhịp sống sôi động:</h4>
        <p>Phố Tây Bùi Viện: Khu phố sôi động với nhiều quán bar, pub, nhà hàng và khách sạn.</p>
        <p>Khu phố người Hoa (Chợ Lớn): Khám phá văn hóa và ẩm thực độc đáo của cộng đồng người Hoa.</p>
        <p>Các trung tâm thương mại hiện đại: Vincom Center, Takashimaya, Diamond Plaza...</p>
        <p>Các quán cà phê độc đáo: Thưởng thức cà phê Sài Gòn trong không gian độc đáo và sáng tạo.</p>
        <p>Du thuyền trên sông Sài Gòn: Ngắm nhìn thành phố lung linh về đêm.</p>
        <p>Phố đi bộ Nguyễn Huệ: Nơi tập trung đông đảo người dân và du khách, đặc biệt là vào buổi tối.</p>
        <h4>Thưởng thức ẩm thực đặc sắc:</h4>
        <h4>Sài Gòn là thiên đường ẩm thực với vô vàn món ngon từ khắp mọi miền đất nước.
        </h4>
        <h4>Đừng quên thưởng thức những món đặc sản như:</h4>
        <p>Phở Sài Gòn: Hương vị đặc trưng, với nước dùng ngọt thanh và bánh phở mềm.</p>
        <p>Cơm tấm: Món ăn bình dân, với sườn nướng, bì, chả trứng và cơm tấm.</p>
        <P>Bánh mì Sài Gòn: Bánh mì giòn rụm, kẹp thịt, chả, pate, rau thơm và nước sốt đậm đà.</P>
        <p>Hủ tiếu Nam Vang: Món ăn có nguồn gốc từ Campuchia, với sợi hủ tiếu dai ngon, thịt heo, tôm, mực và nước dùng
            ngọt thanh.</p>

        <p>Các món ốc: Sài Gòn là thiên đường của các món ốc, với nhiều loại ốc tươi ngon và cách chế biến đa dạng.</p>
        <p> Các món hải sản tươi ngon</p>
        <h4>Gợi ý lịch trình:</h4>
        <p>Ngày 1: Khám phá các công trình kiến trúc lịch sử như Dinh Độc Lập, Nhà thờ Đức Bà, Bưu điện Thành phố.</p>
        <p>Ngày 2: Tham quan Bảo tàng Chứng tích Chiến tranh, Chợ Bến Thành và thưởng thức ẩm thực đường phố.</p>
        <p>Ngày 3: Dạo chơi trên phố đi bộ Nguyễn Huệ, khám phá khu phố người Hoa và mua sắm tại các trung tâm thương
            mại.</p>
        <p>Ngày 4: Khám phá các khu vui chơi giải trí như khu du lịch Suối Tiên, Thảo cầm viên Sài Gòn.</p>
        <p>Sài Gòn chắc chắn sẽ mang đến cho du khách những trải nghiệm khó quên và những kỷ niệm đẹp về một thành phố
            năng động, thân thiện và đầy sức sống.</p>


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