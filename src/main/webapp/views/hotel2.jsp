<%@page import="com.servlet.tiasm.model.User"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travelmng</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/hotel.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

</head>

<body>
    <header>
        <div class="header-top">
    <div class="hotline">HOTLINE: 1900 6750</div>
    
    <%
        // L?y ??i t??ng user t? session
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>
        <!-- N?u ng??i dùng ?ã ??ng nh?p -->
        <span class="text-sm font-bold">Xin chào, <%= user.getEmail() %>!</span>
        <a class="text-sm text-red-500" href="<%= request.getContextPath() %>/logout">??ng xu?t</a>
    <%
        } else {
    %>
        <!-- N?u ng??i dùng ch?a ??ng nh?p -->
        <a class="text-sm" href="<%= request.getContextPath() %>/login">??ng nh?p</a>
        <a class="text-sm" href="<%= request.getContextPath() %>/register">??ng ký</a>
    <%
        }
    %>
    
    <a class="text-sm" href="#">H??ng d?n</a>
</div>

        <div class="main-header">
            <div class="logo">
                <img src="Images/images.jpg " alt="Hotel Logo">
                <a href="your-target-link.html" class="brand">TravelMng</a> <!-- NEW - ?ã ch?nh style -->
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
                <input type="text" placeholder="Tìm ki?m...">
                <button type="submit">??</button>
            </div>
        </div>
    </header>
</body>
<div class="main-container">
    <aside class="sidebar">
        <!-- NEW - Ph?n ?i?m ??n n?i b?t -->
        <div class="sidebar-section">
            <h3 class="sidebar-title">Hotels n?i b?t</h3>

            <!-- ?à N?ng -->
            <div class="destination-card">
                <a href="tmsHotel.html" class="destination-link">
                    <img src="images/TMS.jpg" alt="TMS Hotel" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">TMS Hotel Da Nang Beach</h4>
                        <p class="destination-description">
                            T?n h??ng d?ch v? ??nh cao, ??ng c?p th? gi?i t?i TMS Hotel Da Nang Beach
                        </p>
                    </div>
                </a>
            </div>

            <!-- H?i An -->
            <div class="destination-card">
                <a href="<%= request.getContextPath() %>/hotel?action=1" class="destination-link">
                    <img src="images/Halongbay.jpg" alt="Ha Long Bay" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Ha Long Bay</h4>
                        <p class="destination-description">
                            Tr?i nghi?m d?ch v? ??ng c?p th? gi?i ? Vinpearl Resort & Spa Ha Long
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </aside>

    <!-- N?i dung chính -->
    <main class="main-content">
        <!-- Ph?n hình ?nh l?n -->
        <h1>Sai Gon Night Hotel</h1>
        <section class="hero-section">
            <img src="Images/saigon.jpg" alt="Sai Gon Night Hotel" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Sai Gon Night Hotel m?t n?i v?i nh?ng d?ch v? ?a d?ng và sang tr?ngtr?ng</h1>
                <div class="news-meta">
                    <span>? Top 1 ?i?m ??n yêu thích</span>
                    <span>? 50+ ??a ?i?m check-in</span>
                    <span>? Món ?n ???c ph? v? ?a d?ng</span>

                </div>

            </div>

            <!-- Box booking -->
            <div class="booking-box">
                <div class="price-tag">
                    Ch? t? <br>
                    <span style="font-size: 36px;">80$</span>
                </div>
                <button class="booking-button">
                    ??T TOUR NGAY
                    <span style="display: block; font-size: 14px; margin-top: 5px;">(?u ?ãi 15% hôm nay)</span>
                </button>
            </div>
        </section>
        <h1>T?n h??ng d?ch v? ?a d?ng, phong phú và sang tr?ng t?i Sai Gon Night Hotel</h1>
        <h3>T?i sao Sai Gon Night Hotel là ?i?m ??n lý t??ng?</h3>
        <h4>V? trí thu?n ti?n:</h4>
        <p class="text-center">N?m t?i v? trí thu?n ti?n ? Qu?n Phú Nhu?n, TP. Hô? Chi? Minh, SaiGon Night Hotel mang ??n s? k?t h?p hoàn h?o gi?a s? ti?n nghi và v? trí lý t??ng cho nh?ng ai mu?n khám phá thành ph? n?ng ??ng này. V?i v? trí ch? cách B?o tàng Ch?ng tích chi?n tranh 3.4 km, Dinh Th?ng Nh?t 3.6 km và Trung Tâm Th??ng M?i Diamond Plaza 4 km, khách s?n d? dàng ti?p c?n các ?i?m du l?ch n?i ti?ng c?a thành ph?. ??c bi?t, khách s?n còn ch? cách Ch? Tân ??nh 2.4 km, n?i khách có th? tr?i nghi?m các món ?n ??c s?n ??a ph??ng và mua s?m các m?t hàng th? công ??c ?áo.</p>
        <p class="text-center">Khách s?n c?ng ch? cách B?u ?i?n Trung tâm 4.1 km và Ch? B?n Thành 4.3 km, n?i b?n có th? t?n h??ng không khí sôi ??ng c?a thành ph? và mua s?m nh?ng món quà l?u ni?m ??c tr?ng.</p>
        <h4>Ti?n nghi phòng:</h4>
        <p class="text-center">Khách s?n 3 sao này không ch? n?i b?t v?i d?ch v? phòng và qu?y l? tân ho?t ??ng 24 gi?, mà còn cung c?p môi tr??ng ngh? ng?i tho?i mái, không hút thu?c, ??m b?o không gian trong lành và yên t?nh cho khách hàng.</p>
        <p class="text-center">Các phòng khách t?i SaiGon Night Hotel ??u ???c trang b? ??y ?? ti?n nghi hi?n ??i, bao g?m ?i?u hòa không khí, TV màn hình ph?ng v?i các kênh truy?n hình v? tinh, và ?m ?un n??c ?? ph?c v? nhu c?u pha trà ho?c cà phê. Phòng t?m riêng ???c trang b? vòi sen, ?? v? sinh cá nhân mi?n phí và máy s?y tóc, mang ??n s? ti?n l?i t?i ?a cho khách. Bàn làm vi?c trong m?i phòng là l?a ch?n lý t??ng cho nh?ng khách có nhu c?u làm vi?c trong su?t k? ngh?. Ngoài ra, t?t c? các phòng ??u có ga tr?i gi??ng s?ch s? và tho?i mái, t?o nên không gian ngh? ng?i lý t??ng cho khách.</p>
        <p class="text-center">Khách s?n c?ng cung c?p d?ch v? th? giãn t?i qu?y bar, n?i b?n có th? th??ng th?c nh?ng ly ?? u?ng nh? nhàng, ho?c s? d?ng d?ch v? v?n phòng n?u có công vi?c c?n gi?i quy?t. Dù b?n ??n ?? công tác hay ngh? d??ng, SaiGon Night Hotel ??u là s? l?a ch?n hoàn h?o cho nh?ng ai mu?n tr?i nghi?m v? ??p c?a TP. Hô? Chi? Minh.</p>
        <p class="text-center"><strong>Các c?p ?ôi ??c bi?t thích v? trí xu?t s?c</strong> ? h? cho ?i?m <strong>9,6</strong> khi ?ánh giá chuy?n ?i hai ng??i.</p>

<h2 class="text-center">Các ti?n nghi ???c ?a chu?ng nh?t</h2>
<div class="amenities">
    <div class="amenity-item">
        <i class="fas fa-swimmer" style="color: #0056b3;"></i> H? b?i ngoài tr?i
    </div>
    <div class="amenity-item">
        <i class="fas fa-wifi" style="color: #0056b3;"></i> WiFi mi?n phí
    </div>
    <div class="amenity-item">
        <i class="fas fa-shuttle-van" style="color: #0056b3;"></i> Xe ??a ?ón sân bay
    </div>
    <div class="amenity-item">
        <i class="fas fa-users" style="color: #0056b3;"></i> Phòng gia ?ình
    </div>
    <div class="amenity-item">
        <i class="fas fa-umbrella-beach" style="color: #0056b3;"></i> Giáp bi?n
    </div>
    <div class="amenity-item">
        <i class="fas fa-spa" style="color: #0056b3;"></i> Trung tâm Spa & ch?m sóc s?c kh?e
    </div>
    <div class="amenity-item">
        <i class="fas fa-dumbbell" style="color: #0056b3;"></i> Trung tâm th? d?c
    </div>
    <div class="amenity-item">
        <i class="fas fa-smoking-ban" style="color: #0056b3;"></i> Phòng không hút thu?c
    </div>
    <div class="amenity-item">
        <i class="fas fa-cocktail" style="color:#0056b3;"></i> Qu?y bar
    </div>
    <div class="amenity-item">
        <i class="fas fa-utensils" style="color: #0056b3;"></i> B?a sáng tuy?t h?o
    </div>
</div>
        <section class="comment-section">
            <div class="comment-header">
                <h3>Bình lu?n c?a b?n:</h3>
            </div>
            <div class="comment-content">
                <form>
                    <label for="name">H? và tên:</label>
                    <input type="text" id="name" name="name" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="message">N?i dung:</label>
                    <textarea id="message" name="message" rows="4" required></textarea>

                    <button type="submit" class="submit-button">G?i bình lu?n</button>
                </form>
            </div>
        </section>
    </main>
</div>
<footer>
    <div class="footer-links">
        <a href="#">Trang ch?</a>
        <a href="#">Gi?i thi?u</a>
        <a href="#">Tour du l?ch</a>
        <a href="#">Tin t?c</a>
        <a href="#">Liên h?</a>
        <a href="#">D?ch v?</a>
    </div>
    <div class="footer-content">
        © 2025 BeeTravel | Cung c?p b?i Sapo
    </div>
</footer>
</body>

</html>q