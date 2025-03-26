<%-- 
    Document   : destination_01
    Created on : 21 thg 3, 2025, 16:09:28
    Author     : macos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travelmng</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/destination.css">

</head>

<body>
    <header>
        <div class="header-top">
            <div class="hotline">HOTLINE: 1900 6750</div>
        </div>

        <div class="main-header">
            <div class="logo">
                <img src="Images/images.jpg " alt="Hotel Logo">
                <a href="your-target-link.html" class="brand">TravelMng</a> <!-- NEW - Đã chỉnh style -->
            </div>

            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Destination</a></li>
                    <li><a href="#">Restaurant</a></li>
                    <li><a href="#">Hotel</a></li>
                    <li><a href="#">User</a></li>
                    <li><a href="#">Booking</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>

            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm...">
                <button type="submit">🔍︎</button>
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
                    <img src="images/danang.jpg" alt="Đà Nẵng" class="destination-image">
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
                    <img src="images/hoian.jpg" alt="Hội An" class="destination-image">
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
                    <img src="Images/saigon.jpg" alt="Sai Gon" class="destination-image">
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
            <img src="Images/danang.jpg" alt="Đà Nẵng" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Đà Nẵng - Thành phố đáng sống 2024</h1>
                <div class="news-meta">
                    <span>🏆 Top 1 điểm đến yêu thích</span>
                    <span>🌴 50+ địa điểm check-in</span>
                    <span>🍜 100+ món ăn đặc sản</span>

                </div>

            </div>

            <!-- Box booking -->
            <div class="booking-box">
                <div class="price-tag">
                    Chỉ từ <br>
                    <span style="font-size: 36px;">25$</span>
                </div>
                <button class="booking-button">
                    ĐẶT TOUR NGAY
                    <span style="display: block; font-size: 14px; margin-top: 5px;">(Ưu đãi 15% hôm nay)</span>
                </button>
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

