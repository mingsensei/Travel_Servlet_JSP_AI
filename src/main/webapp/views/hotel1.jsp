<%@page import="com.servlet.tiasm.model.BookingEntry"%>
<%@page import="java.util.ArrayList"%>
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
                <a href="<%= request.getContextPath() %>/hotel?action=3" class="destination-link">
                    <img src="images/TMS.jpg" alt="TMS Hotel" class="destination-image">
                    <div class="destination-info">
                        <h4 class="destination-title">TMS Hotel Da Nang Beach</h4>
                        <p class="destination-description">
                            T?n h??ng d?ch v? ??nh cao, ??ng c?p th? gi?i t?i TMS Hotel Da Nang Beach
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </aside>

    <!-- N?i dung chính -->
    <main class="main-content">
        <!-- Ph?n hình ?nh l?n -->
        <h1>Vinpearl Resort & Spa Ha Long</h1>
        <section class="hero-section">
            <img src="Images/Halongbay.jpg" alt="H? LongLong" class="main-image">

            <div class="image-overlay">
                <h1 class="news-title">Vinpearl Resort & Spa Ha Long </h1>
                <div class="news-meta">
                    <span>? Top 1 ?i?m ??n yêu thích</span>
                    <span>? 50+ ??a ?i?m check-in</span>
                    <span>? Món ?n ???c ph? v? ?a d?ng</span>

                </div>

            </div>

            <%
    // Ki?m tra session
    if (session.getAttribute("cart") == null) {
        session.setAttribute("cart", new ArrayList<BookingEntry>());
    }
%>

<!-- Box booking -->
<div class="booking-box">
    <div class="price-tag">
        Ch? t? <br>
        <span style="font-size: 36px;">200$</span>
    </div>
    
    <form action="addToCartServlet" method="post">
        <input type="hidden" name="destinationId" value="${destination.id}" />
        <input type="hidden" name="destinationName" value="${destination.name}" />
        <button type="submit" class="booking-button">
            ??T TOUR NGAY
            <span style="display: block; font-size: 14px; margin-top: 5px;">(?u ?ãi 15% hôm nay)</span>
        </button>
    </form>
</div>
        </section>
        <h1>Tr?i nghi?m nh?ng d?ch v? ??ng c?p t?i Vinpearl Resort & Spa Ha Long</h1>
        <h3>Vinpearl Resort & Spa ??m chìm trong v? ??p mê h?n c?a V?nh H? Long</h3>
        <h4>V? trí thu?n ti?n:</h4>
        <p class="text-center">Hãy lánh kh?i cu?c s?ng th??ng nh?t và ??m chìm trong s? sang tr?ng t?i Vinpearl Resort & Spa Ha Long, n?i ch? cách b? bi?n c?a V?nh H? Long 5 phút ?i thuy?n cao t?c. V?i nh?ng dãy núi ?á vôi vô cùng hùng v? bao quanh, khu ngh? d??ng 5 sao sang tr?ng này n?m trên m?t hòn ??o riêng và có ba bãi bi?n riêng, nh?ng khu v??n xanh m??t, nh?ng h? b?i ngoài tr?i và trong nhà r?ng l?n cùng m?t spa th? giãn. Du khách có th? th??ng th?c các món ?n Vi?t Nam ho?c qu?c t? ngon t?i m?t trong ba nhà hàng ho?c ??n gi?n là th? giãn trong phòng ho?c suite r?ng rãi có ban công riêng, ??ng th?i ng?m nhìn khung c?nh tuy?t ??p. Cho dù du khách ?ang tìm ki?m m?t n?i lánh mình lãng m?n, k? ngh? gia ?ình, ch? ngh? sang tr?ng, Vinpearl Resort & Spa Ha Long h?a h?n s? mang ??n m?t tr?i nghi?m không th? nào quên ???c. Sân bay g?n nh?t là sân bay qu?c t? Cát Bi.</p>
        <h4>Ti?n nghi phòng:</h4>
        <p class="text-center">M?i phòng ngh? t?i Vinpearl Resort & Spa Ha Long ??u ???c trang b? ??y ?? các ti?n nghi cao c?p nh?m mang l?i s? tho?i mái tuy?t ??i cho du khách. Các phòng r?ng rãi ??u có máy ?i?u hòa, ban công riêng ?? du khách có th? th? giãn và ng?m nhìn khung c?nh tuy?t ??p c?a V?nh H? Long. TV màn hình ph?ng v?i truy?n hình cáp, két an toàn, minibar và Wi-Fi mi?n phí c?ng ???c trang b? trong m?i phòng ?? khách có th? ti?n l?i s? d?ng.</p>
        <p class="text-center">Phòng t?m riêng hi?n ??i v?i b?n t?m sang tr?ng, vòi sen, máy s?y tóc và ?? v? sinh cá nhân cao c?p ??m b?o mang l?i s? th? giãn t?i ?a. Nh?ng ti?n nghi trong phòng còn bao g?m m?t chi?c bàn làm vi?c, t?o ?i?u ki?n cho khách có th? làm vi?c ho?c t?n h??ng m?t không gian yên t?nh.</p>
        <p class="text-center">Ngoài ra, m?t s? phòng còn có các d?ch v? cao c?p nh? d?ch v? phòng 24/7, giúp du khách có th? t?n h??ng nh?ng b?a ?n ngon ngay t?i phòng c?a mình mà không c?n ph?i ra ngoài. Các suite cao c?p có th? có b? b?i riêng ho?c b?n t?m jacuzzi ?? mang l?i c?m giác th? giãn tuy?t v?i.</p>
        <p class="text-center">??c bi?t, trung tâm th? d?c hi?n ??i, các sân tennis và sân golf g?n ?ó, cùng v?i sân ch?i ngoài tr?i và CLB tr? em c?ng n?m trong s? các ti?n nghi mà khu ngh? d??ng cung c?p, ??m b?o r?ng m?i thành viên trong gia ?ình ??u có th? t?n h??ng k? ngh? m?t cách tr?n v?n.</p>
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