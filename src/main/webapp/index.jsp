<%@page import="com.servlet.tiasm.model.User"%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><html lang="vi">
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelMng - Du Lịch Đẳng Cấp</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css">
</head>
<body>
    <!-- Header -->
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

    <div class="main-header0">
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
                <% if (user != null && user.getId() == 1) { %>
                <li><a href="<%= request.getContextPath() %>/chart">Statistical</a></li>
                <% } %>
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

    <!-- Main -->
    <main>
        <!-- Phần hình ảnh nổi bật - Hero Image Section -->
        <section class="relative">
            <img alt="Scenic view of Da Nang" class="w-full h-96 object-cover" src="<%= request.getContextPath() %>/images/city.jpg"/>
            <div class="absolute inset-0 bg-black bg-opacity-50 flex flex-col justify-center items-center text-white text-center">
                <p class="travel-text">Travel Guide</p>
                <h1 class="da-nang-text">VietNam</h1>
                
            </div>
        </section>
        
        <!-- Phần tour   -->
        <section class="container mx-auto mt-8 px-4">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-2xl font-bold">Địa điểm nổi bật</h3> <!-- Tiêu đề của phần này -->
                <a class="text-sm" href="#">Xem thêm tour</a>
            </div>


            <div class="flex space-x-4 overflow-x-auto">
                <!-- Mỗi khung tour được tạo trong các div -->
                <a1 class="design">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/destination?action=1';" 
                        style="cursor: pointer;"  >
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/danang.jpg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Đà Nẵng</h4>
                            <p>Đà Nẵng là một thành phố ven biển nằm ở trung tâm Việt Nam, nổi tiếng với những bãi biển đẹp, lịch sử phong phú và ẩm thực hấp dẫn....</p>                        
                        </div>
                    </div>
                </a1>
                

                <a1 class="design">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/hotel?action=3';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/hoian.jpg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Hội An</h4>
                            <p>Hội An là một thành phố thuộc tỉnh Quảng Nam có nhiều khu phố cổ được xây từ thế kỷ 16 và vẫn còn tồn tại gần như nguyên vẹn đến nay...</p>                        
                        </div>
                    </div>
                </a1>

                
                <a1 class="design">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/hotel?action=2';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/saigon.jpg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">TP.Hồ Chí Minh</h4>
                            <p>Sài Gòn là một thành phố đông đúc, và có vẻ như nó là nơi không bao giờ ngủ. Vì đây là nơi tập hợp nhiều người với nhiều nên văn hóa trên khắp cả nước...</p>                        
                        </div>
                    </div>
                </a1>
            </div>
        </section>

        <!-- Phần Hotel  -->
        <section class="container mx-auto mt-8 px-4">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-2xl font-bold">Hotel nổi bật</h3>
                <a class="text-sm" href="#">Xem thêm tour</a>
            </div>
            <div class="flex space-x-4 overflow-x-auto">
                <!-- Các khung tour trong nước được trình bày ở đây -->
                <a2 class="design">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/hotel?action=3';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/TMS.jpeg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">TSM Hotel Da Nang Beach</h4>
                            <p> Bạn có thể tận hưởng những dịch vụ đỉnh cao, đẳng cấp thế giới tại TMS Hotel Da Nang Beach,...</p>                        
                        </div>
                    </div>
                </a2>
                <a2 class="design" href="">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/hotel?action=2';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/saigonhotel.jpeg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Sai Gon Night Hotel</h4>
                            <p>Khi đến với Sài Gòn bạn không thể bỏ qua Sai Gon Night Hotel. Đây là một nơi với những dịch vụ đa dạng và sang trọng,...</p>                        
                        </div>
                    </div>
                </a2>
                <a2 class="design" href="">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/hotel?action=1';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/Halongbay.jpeg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Vinpearl Resort & Spa Ha Long</h4>
                            <p>Vinpearl Resort & Spa đắm chìm trong vẻ đẹp mê hồn của Vịnh Hạ Long, nơi có cảnh sắc thiên nhiên tuyệt mỹ và không gian nghỉ dưỡng sang trọng,...</p>                        
                        </div>
                    </div>
                </a2>
            </div>
        </section>

        <!-- Phần nhà hàng-->
        <section class="container mx-auto mt-8 px-4">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-2xl font-bold">Nhà hàng nổi bật</h3> 
                <a class="text-sm" href="#">Xem thêm tour</a>
            </div>
            <div class="flex space-x-4 overflow-x-auto">
                <!-- Các khung tour nước ngoài -->
                <a3 class="design" href="">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/restaurant?action=1';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/khonggianSeaFood.jpg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Golden Dragon Seafood</h4>
                            <p>Là Nhà hàng Trung Hoa số 1 Đà Nẵng trên TripAdvisor liên tiếp trong nhiều năm, Golden Dragon không chỉ chiếm trọn sự yêu thích của giới sành ăn...</p>                        
                        </div>
                    </div>
                </a3>

                <a3 class="design" href="../restaurant/html/SaigonStreetEats.html">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/restaurant?action=3';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/SaigonStreetEats.jpg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Saigon Street Eats</h4>
                            <p>Là một trải nghiệm ẩm thực đường phố Sài Gòn, nơi du khách có thể thưởng thức các món ăn đặc trưng như bánh mì, phở, hủ tiếu, cơm tấm, bún thịt nướng,... </p>                        
                        </div>
                    </div>
                </a3>

                <a3 class="design" href="">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden w-80"
                        onclick="window.location.href='<%= request.getContextPath() %>/restaurant?action=2';" 
                        style="cursor: pointer;">
                        <img alt="tour-img1" class="w-full h-40 object-cover" src="<%= request.getContextPath() %>/images/HaLongBaySeafoodDelight.jpg"/>
                        <div class="p-4">
                                <h4 class="text-lg font-bold">Ha Long Bay Seafood Delight</h4>
                            <p>Là siêu du thuyền nhà hàng 5 sao độc nhất vô nhị với sức chứa đến 360 người cùng phong cách thiết kế châu Âu hiện đại...</p>                        
                        </div>
                    </div>
                </a3>
            </div>
        </section>

    </main>

    <!-- Footer -->
    <footer>
        <div class="contact-info">
          <img alt="Logo công ty" src="" />
          <div>
            <p><i class="fas fa-building"></i> We Bare Bears </p>
            <p><i class="fas fa-envelope"></i> </p>
            <p><i class="fas fa-phone"></i> </p>
          </div>
        </div>
        <div class="social-icons">
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-linkedin"></i></a>
        </div>
      </footer>
    
</body>
</html>