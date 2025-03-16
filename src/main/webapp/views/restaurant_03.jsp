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
    <title>SaiGon Street Eats</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurant_03.css">
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
            <img src="<%= request.getContextPath() %>/images/logoanvatSG.jpg" alt="Logo Golden Dragon">
            <div class="brand-text">
                <strong class="brand-name">SaiGon Street Eats</strong>
                <span class="slogan">SaiGon Street Eats – Hương vị đường phố, chào đón bạn!</span>
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
                    <img src="<%= request.getContextPath() %>/images/banhtrangnuongSaiGon.jpg" alt="Bánh Tráng Nướng Hải Sản – Hương Vị Đường Phố Độc Đáo">
                    <p class="news-title">Bánh Tráng Nướng Hải Sản – Hương Vị Đường Phố Độc Đáo</p>
                    <p class="news-date">Wed, 20/12/2024</p>
                    <p class="news-description">Bánh tráng nướng hải sản là sự kết hợp hoàn hảo giữa độ giòn tan của bánh tráng và
                        hương vị đậm đà từ tôm, mực, trứng cút cùng sốt mayonnaise béo ngậy. Món ăn này không chỉ bắt mắt mà còn mang
                        đến trải nghiệm ẩm thực khó quên. Với cách chế biến nhanh gọn, bánh tráng nướng đã trở thành biểu tượng của ẩm
                        thực đường phố Sài Gòn.</p>
                </div>
                <hr>
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/hutieuSaiGon.jpg" alt="Hủ Tiếu Xào Tóp Mỡ – Hương Vị Béo Ngậy Gây Nghiện">
                    <p class="news-title">Hủ Tiếu Xào Tóp Mỡ – Hương Vị Béo Ngậy Gây Nghiện</p>
                    <p class="news-date">Sat, 15/01/2024</p>
                    <p class="news-description">Hủ tiếu xào tóp mỡ là món ăn dân dã nhưng đầy hấp dẫn với sợi hủ tiếu dai mềm, hòa
                        quyện cùng tóp mỡ giòn rụm và nước sốt đậm đà. Tôm, thịt và rau giá thêm phần phong phú cho món ăn, tạo nên
                        tổng thể hài hòa giữa vị béo, mặn và ngọt. Đây là lựa chọn lý tưởng cho những ai muốn thưởng thức một chút tinh
                        hoa ẩm thực đường phố Sài Gòn.</p>
                </div>
                <hr>
                <div class="news-item">
                    <img src="<%= request.getContextPath() %>/images/logoSaiGon.jpg" alt="Featured news 2">
                    <p class="news-title">Cảm ơn bạn đã khám phá ẩm thực Sài Gòn – Hẹn gặp lại tại SaiGon Street Eats!</p>
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
                <h2>SaiGon Street Eats – Cam Kết An Toàn Vệ Sinh Thực Phẩm</h2>
                <p class="date">Sun, 25/02/2018</p>
                <img src="<%= request.getContextPath() %>/images/<%= request.getContextPath() %>/images/antoanvesinh.jpg" alt="SaiGon Street Eats – Cam Kết An Toàn Vệ Sinh Thực Phẩm" class="news-image">
                <p class="news-description">
                    700000, District 3, Zone of Turtle Lake, Lot D5
                </p>
                <div class="location">
                    <p>Với sứ mệnh mang đến trải nghiệm ẩm thực đường phố an toàn và chất lượng, SaiGon Street Eats triển khai dự án
                        nâng cao tiêu chuẩn vệ sinh thực phẩm. Chúng tôi áp dụng quy trình kiểm soát nguyên liệu chặt chẽ, đảm bảo thực
                        phẩm tươi sạch từ nguồn gốc đến tay thực khách. Đội ngũ chế biến được đào tạo chuyên sâu về vệ sinh an toàn, sử
                        dụng dụng cụ và không gian bếp đạt chuẩn. Ngoài ra, các quầy hàng đều được kiểm tra định kỳ để duy trì chất
                        lượng tốt nhất. SaiGon Street Eats cam kết mang đến sự yên tâm trong từng món ăn, để bạn thưởng thức trọn vẹn
                        hương vị đường phố Sài Gòn.</p>
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
                <h2>SaiGon Street Eats – Địa Điểm Ẩm Thực Được Khách Hàng Yêu Thích</h2>
                <p class="date">Mon, 25/02/2025</p>
                <img src="<%= request.getContextPath() %>/images/new2SaiGon.jpg" alt="SaiGon Street Eats – Địa Điểm Ẩm Thực Được Khách Hàng Yêu Thích" class="news-image">
                <p class="news-description">
                    700000, District 3, Zone of Turtle Lake, Lot D5
                </p>
                <div class="location">
                    <p>SaiGon Street Eats không chỉ chinh phục thực khách bằng hương vị đậm đà mà còn ghi điểm nhờ chất lượng phục vụ và không
                        gian sạch sẽ. Nhiều khách hàng đánh giá cao sự tươi ngon của nguyên liệu, đặc biệt là hương vị đặc trưng khó tìm thấy
                        ở nơi khác. Một số thực khách quốc tế còn ví đây là “thiên đường ẩm thực đường phố” với trải nghiệm chân thực và đa
                        dạng. Bên cạnh đó, dịch vụ thân thiện và quy trình vệ sinh an toàn cũng nhận được nhiều lời khen. SaiGon Street Eats
                        tự hào mang đến những món ăn ngon, đảm bảo chất lượng, và luôn sẵn sàng phục vụ thực khách một cách tốt nhất.

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
        <p>&copy; 2025 SaiGon Street Eats | Cung cấp bởi MngTrl Team</p>
    </div>
</footer>

</body>
</html>

