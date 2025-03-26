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
                <a href="<%= request.getContextPath() %>/hotel?action=2" class="destination-link">
                    <img src="images/saigon.jpg" alt="Saigon Night Hotel" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">Saigon Night Hotel</h4>
                        <p class="destination-description">
                            Saigon Night Hotel ??a ?i?m ngh? d??ng ?áng th? khi ??n Sài Gòn
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
        <h1>TMS Hotel Da Nang Beach</h1>
        <section class="hero-section">
            <img src="Images/TMS.jpg" alt="?à N?ng" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">TMS Hotel Da Nang Beach m?t n?i ?áng ?? th? khi ??n ?à N?ng</h1>
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
                    <span style="font-size: 36px;">120$</span>
                </div>
                <button class="booking-button">
                    ??T TOUR NGAY
                    <span style="display: block; font-size: 14px; margin-top: 5px;">(?u ?ãi 15% hôm nay)</span>
                </button>
            </div>
        </section>
        <h1>T?n h??ng d?ch v? ??nh cao, ??ng c?p th? gi?i t?i TMS Hotel Da Nang Beach</h1>
        <h3>T?i sao TMS Hotel Da Nang Beach là ?i?m ??n lý t??ng?</h3>
        <h4>V? trí thu?n ti?n:</h4>
        <p class="text-center">TMS Hotel Da Nang Beach t?a l?c t?i v? trí lý t??ng ? ?à N?ng, ch? cách Bãi bi?n M? Khê vài b??c chân và Bãi bi?n B?c M? An 9 phút ?i b?, giúp khách d? dàng t?n h??ng không gian bi?n tuy?t v?i. Khách s?n c?ng g?n các ?i?m tham quan n?i ti?ng c?a thành ph?, nh? B?o tàng Ch?ng tích Chi?n tranh và Dinh Th?ng Nh?t. V?i v? trí thu?n l?i, du khách có th? khám phá các ?i?m du l?ch h?p d?n c?a ?à N?ng nh? Trung Tâm Th??ng M?i Diamond Plaza hay Ch? Hàn, ch? trong vài phút di chuy?n.</p>
        <h4>Ti?n nghi phòng:</h4>
        <p class="text-center">TMS Hotel Da Nang Beach có xe ??p mi?n phí, h? b?i ngoài tr?i, trung tâm th? d?c và nhà hàng ? ?à N?ng. Ngoài d?ch v? phòng, ch? ngh? này còn có sân ch?i tr? em. Ch? ngh? cung c?p l? tân 24/24, d?ch v? ??a ?ón sân bay, câu l?c b? tr? em và Wi-Fi mi?n phí ? toàn b? ch? ngh?.</p>
        <p class="text-center">T?t c? các c?n t?i TMS Hotel Da Nang Beach ??u ???c trang b? nh?ng ti?n nghi hi?n ??i và ??y ?? ?? mang l?i s? tho?i mái t?i ?a cho khách hàng. M?i phòng ??u có h? th?ng ?i?u hòa không khí, giúp duy trì không gian mát m? và d? ch?u trong su?t k? ngh?. Khu v?c gh? ng?i ???c thi?t k? r?ng rãi, lý t??ng cho nh?ng bu?i t?i th? giãn ho?c ti?p khách. TV màn hình ph?ng v?i truy?n hình cáp s? là l?a ch?n tuy?t v?i ?? b?n th??ng th?c nh?ng ch??ng trình yêu thích.</p>
        <p class="text-center">Khách t?i TMS Hotel Da Nang Beach có th? th??ng th?c b?a sáng th?c ??n buffet ho?c ki?u l?c ??a. ??c bi?t, t?t c? các phòng ??u ???c trang b? ?m ?un n??c, ph?c v? cho nhu c?u pha trà ho?c cà phê. M?t s? phòng còn có b?p v?i ??y ?? ti?n nghi nh? t? l?nh và lò vi sóng, giúp khách có th? t? chu?n b? nh?ng b?a ?n nh? t?i phòng. Phòng khách r?ng rãi và ???c trang b? bàn làm vi?c, là không gian lý t??ng cho nh?ng ai c?n làm vi?c trong k? ngh?.</p>
        <p class="text-center">Khách có th? s? d?ng d?ch v? v?n phòng ho?c th? giãn t?i qu?y bar. Khách s?n còn cung c?p d?ch v? d?n phòng hàng ngày và h? tr? m?i yêu c?u c?a khách, ??m b?o r?ng b?n s? có m?t k? ngh? th? giãn và d? ch?u t?i TMS Hotel Da Nang Beach.</p>
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

</html>