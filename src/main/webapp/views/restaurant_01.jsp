<%--
  Created by IntelliJ IDEA.
  User: macos
  Date: 15/3/25
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Golden Dragon Seafood</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurant_01.css">
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
            <img src="<%= request.getContextPath() %>/images/logo.jpg" alt="Logo Golden Dragon">
            <div class="brand-text">
                <strong class="brand-name">Golden Dragon Seafood</strong>
                <span class="slogan">Hải sản tươi ngon - Trải nghiệm tuyệt vời</span>
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
                <li><a href="/home">Trang chủ</a></li>
                <li><a href="/about">Giới thiệu</a></li>
                <li><a href="/">Địa điểm du lịch</a></li>
                <li><a href="/">Nhà hàng</a></li>
                <li><a href="/">Khách sạn</a></li>
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
                    <img src="<%= request.getContextPath() %>/images/shushi.jpg" alt="Shushi news">
                    <p class="news-title">Thưởng Thức Sushi Tươi Ngon Tại Golden Dragon Seafood</p>
                    <p class="news-date">Friday, 20/09/2024</p>
                    <p class="news-description">Golden Dragon Seafood mang đến cho thực khách trải nghiệm ẩm thực đỉnh cao với sushi tươi ngon, được chế biến từ nguồn hải sản chất lượng nhất. Mỗi miếng sushi không chỉ tinh tế trong hương vị mà còn đẹp mắt, đậm nét nghệ thuật Nhật Bản. Hãy đến và khám phá hương vị tuyệt vời ngay hôm nay!</p>
                </div>
                <hr>
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/tempura.jpg" alt="tempura news">
                    <p class="news-title">Giòn Tan Hấp Dẫn – Tempura Tại Golden Dragon Seafood</p>
                    <p class="news-date">Sunday, 15/012/2024</p>
                    <p class="news-description">Tempura tại Golden Dragon Seafood được chiên vàng giòn, giữ trọn vị tươi ngon của hải sản và rau củ. Hãy thưởng thức cùng nước sốt đặc biệt để cảm nhận hương vị tinh tế khó quên!</p>
                </div>
                <hr>
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/logoFreshSeaFood.avif" alt="logo FreshSeaFood">
                    <p class="news-title">Trọn vị đại dương, trọn vẹn trải nghiệm!</p>
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
                <h2>Golden Dragon Seafood: Điểm Đến Lý Tưởng Cho Tín Đồ Hải Sản</h2>
                <p class="date">Sun, 25/02/2018</p>
                <img src="<%= request.getContextPath() %>/images/new1.png" alt="Điểm Đến Lý Tưởng Cho Tín Đồ Hải Sản" class="news-image">
                <p class="news-description">
                    084511, Hải Châu District, Zone of the Villas of Green Island, Lot A1
                </p>
                <div class="location">
                    <p>Tọa lạc tại trung tâm thành phố, Golden Dragon Seafood là điểm hẹn lý tưởng cho những ai yêu thích hải sản tươi sống. Với nguồn nguyên liệu tuyển chọn kỹ lưỡng, nhà hàng mang đến những món ăn đặc sắc như tôm hùm nướng bơ tỏi, cua sốt Singapore, hàu sống sốt chanh dây.

                        Không gian sang trọng kết hợp phong cách Á Đông hiện đại, cùng đội ngũ nhân viên chuyên nghiệp, đảm bảo trải nghiệm tuyệt vời cho thực khách. Ngoài ra, nhà hàng còn có phòng VIP riêng tư, thích hợp cho những buổi tiệc hoặc gặp gỡ đối tác.

                        Golden Dragon Seafood cũng thường xuyên có ưu đãi hấp dẫn, từ giảm giá giờ vàng đến buffet hải sản đặc biệt. Hãy đến ngay để tận hưởng hương vị biển cả trong không gian đẳng cấp!</p>
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
                <h2>Tinh Hoa Ẩm Thực Trong Không Gian Nghệ Thuật</h2>
                <p class="date">Mon, 25/01/2025</p>
                <img src="<%= request.getContextPath() %>/images/khonggianSeaFood.jpg" alt="Tinh Hoa Ẩm Thực Trong Không Gian Nghệ Thuật" class="news-image">
                <p class="news-description">
                    084511, Hải Châu District, Zone of the Villas of Green Island, Lot A1
                </p>
                <div class="location">
                    <p>Golden Dragon Seafood không chỉ nổi bật với hải sản tươi ngon mà còn sở hữu
                        thiết kế sang trọng, kết hợp tinh tế giữa truyền thống Á Đông và phong cách hiện đại.
                        Không gian rộng rãi với nội thất gỗ cao cấp, đèn lồng lụa và tiểu cảnh nước tạo nên trải nghiệm thư thái.
                        Nhà hàng có khu vực ăn chung ấm cúng, phòng VIP riêng tư và không gian ngoài trời thoáng đãng.
                        Đây là điểm đến lý tưởng để thưởng thức ẩm thực trong không gian đầy cảm hứng.

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
        <p>&copy; 2025 Golden Dragon Seafood | Cung cấp bởi MngTrl Team</p>
    </div>
</footer>

</body>
</html>

