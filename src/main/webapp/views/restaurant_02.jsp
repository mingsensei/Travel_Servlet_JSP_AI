<%--
  Created by IntelliJ IDEA.
  User: macos
  Date: 15/3/25
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ha Long Bay Seafood Delight</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurant_02.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
</head>
<body>

<!-- Phần đầu trang - Header -->
<header class="bg-white shadow-md">
    <div class="container top-header">
        <div class="text-sm">
            <img src="<%= request.getContextPath() %>/images/covnam.jpg" alt="Cờ Việt Nam">
            <span> Hotline: 1900 6750</span>
        </div>
        <div class="menu">
            <a href="#">Đăng nhập</a>
            <a href="#">Đăng ký</a>
            <a href="#">Hướng dẫn</a>
            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm...">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>
    </div>
    <nav class="main-nav">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/images/logoHaLong.png" alt="Logo Ha Long Bay Seafood">
            <div class="brand-text">
                <strong class="brand-name">Ha Long Bay Seafood Delight</strong>
                <span class="slogan">Hương vị Hạ Long – Tinh hoa đại dương!</span>
            </div>
        </div>
        <ul class="nav-links">
            <li><a href="/home">Trang chủ</a></li>
            <li><a href="/about">Giới thiệu</a></li>
            <li><a href="/">Địa điểm du lịch</a></li>
            <li><a href="/">Nhà hàng</a></li>
            <li><a href="/">Khách sạn</a></li>
            <li><a href="#">Tin tức</a></li>
            <li><a href="#">Liên hệ</a></li>
            <li><a href="#">Dịch vụ</a></li>
        </ul>
    </nav>
</header>

<!-- Navigation Bar -->


<!-- Content Section -->
<div class="content">
    <!-- Sidebar Section -->
    <aside class="sidebar">
        <div class="category-list">
            <h3>Danh mục tin</h3>
            <ul>
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Giới thiệu</a></li>
                <li><a href="#">Tour du lịch</a></li>
                <li><a href="#">Tin tức</a></li>
                <li><a href="#">Liên hệ</a></li>
                <li><a href="#">Dịch vụ</a></li>
            </ul>
        </div>

        <div class="highlighted-news">
            <h3>Tin nổi bật</h3>
            <!-- Danh sách tin nổi bật -->
            <div class="news-list">
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/tomhapdua.jpg" alt="Tôm hấp dừa">
                    <p class="news-title">Tôm Hấp Nước Dừa – Hương Vị Tươi Mát Của Biển Cả</p>
                    <p class="news-date">Friday, 20/09/2024</p>
                    <p class="news-description">Tôm Hấp Nước Dừa là sự kết hợp hoàn hảo giữa vị ngọt tự nhiên của tôm sú tươi và hương thơm thanh mát từ nước dừa.
                        Phương pháp hấp giúp giữ trọn dưỡng chất, tạo nên món ăn tinh tế, hấp dẫn. Khi chấm cùng muối tiêu chanh, thực khách sẽ cảm nhận trọn vẹn
                        tinh hoa biển cả trong từng miếng tôm.</p>
                </div>
                <hr>
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/chamucQN.jpg" alt="Chả mực nướng lá chuối">
                    <p class="news-title">Chả Mực Nướng Lá Chuối – Đậm Đà Hương Vị Hạ Long</p>
                    <p class="news-date">Sunday, 15/012/2024</p>
                    <p class="news-description">Chả Mực Hạ Long được giã tay thủ công, nướng trên lá chuối,
                        mang đến hương vị thơm lừng và lớp vỏ vàng óng hấp dẫn.
                        Mực dai giòn sần sật hòa quyện với hương lá chuối tạo nên món ăn đặc trưng không thể bỏ lỡ.
                        Khi kết hợp với nước chấm chua ngọt, từng miếng chả mực càng thêm tròn vị, lưu luyến nơi đầu lưỡi.
                    </p>
                </div>
                <hr>
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/halongbay.jpg" alt="Ảnh Hạ Long bay">
                    <p class="news-title">Trân trọng từng khoảnh khắc – Cảm ơn và hẹn sớm gặp lại!</p>
                    <p class="news-description">Thank you</p>
                </div>

            </div>
        </div>
    </aside>

    <!-- Main Content Section -->
    <main>
        <section class="news">
            <h1>Tin tức</h1>
            <article class="news-item">
                <h2>Ha Long Bay Seafood Delight – Không Gian Mang Hơi Thở Biển Cả</h2>
                <p class="date">Sun, 09/02/2024</p>
                <img src="<%= request.getContextPath() %>/images/new1halong.jpg" alt="Ha Long Bay Seafood Delight – Không Gian Mang Hơi Thở Biển Cả" class="news-image">
                <p class="news-description">
                    200350, Hạ Long City, Bai Chay Ward, Ocean View Complex, Lot B2
                </p>
                <div class="location">
                    <p>Lấy cảm hứng từ vẻ đẹp hùng vĩ của Vịnh Hạ Long, nhà hàng Ha Long Bay Seafood Delight mang đến không gian sang
                        trọng, gần gũi với thiên nhiên. Nội thất gỗ ấm áp kết hợp cùng những bức tranh phong cảnh biển tạo nên không
                        gian thư thái, nhẹ nhàng. Đèn lồng vàng dịu dàng tỏa sáng, phản chiếu trên những bàn tiệc bày biện tinh tế.
                        Khu vực ngoài trời thoáng đãng, cho phép thực khách thưởng thức hải sản tươi ngon trong làn gió biển mát lành.
                        Đây là điểm đến lý tưởng để trải nghiệm ẩm thực trong không gian đầy cảm hứng và thư giãn.

                    </p>
                </div>
                <div class="comments">
                    <h4>Viết bình luận của bạn:</h4>
                    <form action="#">
                        <input type="text" name="name" placeholder="Họ tên">
                        <input type="email" name="email" placeholder="Email">
                        <textarea name="content" placeholder="Nội dung"></textarea>
                        <button type="submit">Gửi bình luận</button>
                    </form>
                </div>
            </article>

            <article class="news-item">
                <h2>Ha Long Bay Seafood Delight – Điểm Đến Hấp Dẫn Cho Thực Khách</h2>
                <p class="date">Mon, 15/02/2025</p>
                <img src="<%= request.getContextPath() %>/images/new2halong.jpg" alt="Ha Long Bay Seafood Delight – Điểm Đến Hấp Dẫn Cho Thực Khách" class="news-image">
                <p class="news-description">
                    200350, Hạ Long City, Bai Chay Ward, Ocean View Complex, Lot B2
                </p>
                <div class="location">
                    <p>Nhờ vào không gian sang trọng, món ăn chất lượng và dịch vụ tận tâm, Ha Long Bay Seafood Delight luôn thu hút
                        một lượng khách đông đảo mỗi ngày. Đặc biệt vào cuối tuần và các dịp lễ, nhà hàng thường xuyên kín bàn với cả
                        khách địa phương lẫn du khách quốc tế. Sự kết hợp giữa hương vị hải sản tươi ngon và không gian ấm cúng khiến
                        nơi đây trở thành điểm đến lý tưởng cho gia đình, bạn bè và các buổi tiệc quan trọng. Để phục vụ tốt hơn, nhà
                        hàng khuyến khích thực khách đặt bàn trước, đảm bảo trải nghiệm ẩm thực hoàn hảo trong không gian đẳng cấp.

                    </p>
                </div>
                <div class="comments">
                    <h4>Viết bình luận của bạn:</h4>
                    <form action="#">
                        <input type="text" name="name" placeholder="Họ tên">
                        <input type="email" name="email" placeholder="Email">
                        <textarea name="content" placeholder="Nội dung"></textarea>
                        <button type="submit">Gửi bình luận</button>
                    </form>
                </div>
            </article>
        </section>
    </main>
</div>

<!-- Footer Section -->
<footer>
    <div class="footer-content">
        <ul>
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Giới thiệu</a></li>
            <li><a href="#">Tour du lịch</a></li>
            <li><a href="#">Tin tức</a></li>
            <li><a href="#">Liên hệ</a></li>
            <li><a href="#">Dịch vụ</a></li>
        </ul>
        <div class="social-media">
            <a href="#" target="_blank">Facebook</a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 Ha Long Bay Seafood Delight | Cung cấp bởi MngTrl Team</p>
    </div>
</footer>

</body>
</html>
