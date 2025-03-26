<%@ page import="com.servlet.tiasm.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Viet Nam</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">

</head>
<body class="font-roboto bg-gray-100">



<!-- Phần đầu trang - Header -->
<header class="bg-white shadow-md">
    <div class="container mx-auto flex justify-between items-center py-2 px-4">
        <div class="text-sm">Hotline: 1900 6755</div> <!-- Số hotline -->
        <div class="flex items-center space-x-4">
            <%
                // Lấy đối tượng user từ session
                User user = (User) session.getAttribute("user");
                if (user != null) {
            %>
            <span class="text-sm font-bold">Xin chào, <%= user.getEmail() %>!</span>
            <a class="text-sm text-red-500" href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
            <% } else { %>
            <a class="text-sm" href="<%= request.getContextPath() %>/login">Đăng nhập</a>
            <a class="text-sm" href="<%= request.getContextPath() %>/register">Đăng ký</a>
            <% } %>
            <a class="text-sm" href="#">Hướng dẫn</a>
            <div class="relative">
                <input class="border rounded-full py-1 px-3 text-sm" placeholder="Tìm kiếm..." type="text"/>
                <button class="absolute right-0 top-0 mt-1 mr-2">
                    <i class="fas fa-search"></i> <!-- Biểu tượng tìm kiếm -->
                </button>
            </div>
        </div>
    </div>
</header>


<!-- Phần chính của trang - Main Content -->
<main>
    <!-- Phần hình ảnh nổi bật - Hero Image Section -->
    <section class="relative" style="background-color: red">
        <img alt="Scenic view of Sapa - Lao Cai" class="w-full h-96 object-cover" src="<%= request.getContextPath() %>/images/halongbay.jpg"/>
        <div class="absolute inset-0 bg-black bg-opacity-50 flex flex-col justify-center items-center text-white">
            <h1 class="text-4xl font-bold">Tour du lịch hot</h1>
            <h2 class="text-6xl font-bold">Đà Nẵng - Hội An</h2>
        </div>
    </section>

    <!-- Phần tour du lịch giờ chót - Last minute tour -->
    <section class="container mx-auto mt-8 px-4">
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-2xl font-bold">Du lịch giờ chót</h3> <!-- Tiêu đề của phần này -->
            <a class="text-sm" href="#">Xem thêm tour</a>
        </div>
        <div class="flex space-x-4 overflow-x-auto">
            <!-- Mỗi khung tour được tạo trong các div -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="Tour image 1" class="w-full h-40 object-cover" src="https://datviettour.com.vn/uploads/images/tin-tuc-SEO/mien-trung/Da-Nang/danh-thang/ba-na-hills.jpg"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span> <!-- Tag "Còn Hết hạn" -->
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span> <!-- Tag "Mới" -->
                    </div>
                    <h4 class="text-lg font-bold">Hà Nội - Hồ Gươm - Sapa</h4>
                    <p class="text-sm">Thời gian: 6 Ngày 5 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="Tour image 2" class="w-full h-40 object-cover" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtBfCIJgY3Ya-VXTcCQVOzKjq5CdM5Gbn-RA&s"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tuy Hòa - Đại Lãnh - Đầm Ô Loan</h4>
                    <p class="text-sm">Thời gian: 6 Ngày 5 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="Tour image 3" class="w-full h-40 object-cover" src="https://danangsensetravel.com/view/at_top-anh-dep-chuong-trinh-du-lich-tuyet-voi-da-nang-oi_d1d53105d91c6d84d70121b511607167.jpg"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Hà Nội - Lào Cai - Sapa - Yên Tử - Hạ Long</h4>
                    <p class="text-sm">Thời gian: 6 Ngày 5 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Phần tour trong nước - Domestic Tours -->
    <section class="container mx-auto mt-8 px-4">
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-2xl font-bold">Tour trong nước</h3> <!-- Tiêu đề "Tour trong nước" -->
            <a class="text-sm" href="#">Xem thêm tour</a>
        </div>
        <div class="flex space-x-4 overflow-x-auto">
            <!-- Các khung tour trong nước được trình bày ở đây -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="Domestic tour image 1" class="w-full h-40 object-cover" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/468302347_1590995201536201_4421605814365907412_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=MdI9z_-fzioQ7kNvgFhkvhp&_nc_oc=AdjRx7vROVODE0cCgGWsuDp4OV_NLDD8KCNkpqA20sdqH40IvbszvYsdOGG8XakL3QMaOtnA8QIytcNjLo4yU5WU&_nc_zt=23&_nc_ht=scontent.fdad3-6.fna&_nc_gid=AoEYr65S9Zh1l0oJVWBhCnL&oh=00_AYDDSWTBjaQqVet74RbxioqQ4AinVyl3cIjy_dT_ZrkVQw&oe=67CDA39F"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tour trong nước 1</h4>
                    <p class="text-sm">Thời gian: 4 Ngày 3 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="Domestic tour image 2" class="w-full h-40 object-cover" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-1/476343170_1353572718976924_2274108237531097505_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=104&ccb=1-7&_nc_sid=e99d92&_nc_ohc=xNbSFFeBHY4Q7kNvgF9e3eG&_nc_oc=Adj4pCJQOI18WIqqKF4u8mjm2nHUiEFisSbmPBltVDhPAlFvvHaoQSYD4U6uUZ1075kcQYxY20C7SSrOpmCSMsRf&_nc_zt=24&_nc_ht=scontent.fdad3-6.fna&_nc_gid=AaecsIcENhIl6TTWfKFlY51&oh=00_AYArWW8OPb6rHjZk7NxvZ9BKWNckmpiv7StENeVn6cJtxw&oe=67CDA4E8"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tour trong nước 2</h4>
                    <p class="text-sm">Thời gian: 5 Ngày 4 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="Domestic tour image 3" class="w-full h-40 object-cover" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/473173091_1345682793103659_4102063040252976899_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=MfoZVi4kZfAQ7kNvgFmc331&_nc_oc=AdiVmtPsxkZTAJrcbCRZEnsLC1lSaEOI9gEBZpBRTzTu8_UKgI977dbBi_CynBl0V2cdXvQWC0nJl68F22y5zrnv&_nc_zt=23&_nc_ht=scontent.fdad3-6.fna&_nc_gid=AUJzUu7NqeNJSeaqeNUsCDG&oh=00_AYALk2z04hEbFXj9WyDIVnziZhfeShv5nHFEmbZkIn4KKQ&oe=67CDA858"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tour trong nước 3</h4>
                    <p class="text-sm">Thời gian: 3 Ngày 2 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Phần tour nước ngoài - International Tours -->
    <section class="container mx-auto mt-8 px-4">
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-2xl font-bold">Tour nước ngoài</h3> <!-- Tiêu đề "Tour nước ngoài" -->
            <a class="text-sm" href="#">Xem thêm tour</a>
        </div>
        <div class="flex space-x-4 overflow-x-auto">
            <!-- Các khung tour nước ngoài -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="International tour image 1" class="w-full h-40 object-cover" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-1/373721199_1645414575969409_491333172071404883_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=111&ccb=1-7&_nc_sid=e99d92&_nc_ohc=zTICyX7OFiQQ7kNvgGCAiN1&_nc_oc=AdgW6rpChYvgxMuJS0mI0TEAhmSHZalWTta52zEcouUi0MDfg8qoCTTh2mVAoKu_LNpLXqhTWMQn-QIjygfY9Dvp&_nc_zt=24&_nc_ht=scontent.fdad3-6.fna&_nc_gid=A-YPY4ZE7_eiZ0jPnpvDZXp&oh=00_AYBphtUmvs_0LuRG5tVFctzSBAJYEJGNXnSLproSMzgn6Q&oe=67CD9F9E"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tour nước ngoài 1</h4>
                    <p class="text-sm">Thời gian: 7 Ngày 6 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="International tour image 2" class="w-full h-40 object-cover" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-1/373721199_1645414575969409_491333172071404883_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=111&ccb=1-7&_nc_sid=e99d92&_nc_ohc=zTICyX7OFiQQ7kNvgGCAiN1&_nc_oc=AdgW6rpChYvgxMuJS0mI0TEAhmSHZalWTta52zEcouUi0MDfg8qoCTTh2mVAoKu_LNpLXqhTWMQn-QIjygfY9Dvp&_nc_zt=24&_nc_ht=scontent.fdad3-6.fna&_nc_gid=A-YPY4ZE7_eiZ0jPnpvDZXp&oh=00_AYBphtUmvs_0LuRG5tVFctzSBAJYEJGNXnSLproSMzgn6Q&oe=67CD9F9E"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tour nước ngoài 2</h4>
                    <p class="text-sm">Thời gian: 8 Ngày 7 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-80">
                <img alt="International tour image 3" class="w-full h-40 object-cover" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-1/373721199_1645414575969409_491333172071404883_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=111&ccb=1-7&_nc_sid=e99d92&_nc_ohc=zTICyX7OFiQQ7kNvgGCAiN1&_nc_oc=AdgW6rpChYvgxMuJS0mI0TEAhmSHZalWTta52zEcouUi0MDfg8qoCTTh2mVAoKu_LNpLXqhTWMQn-QIjygfY9Dvp&_nc_zt=24&_nc_ht=scontent.fdad3-6.fna&_nc_gid=A-YPY4ZE7_eiZ0jPnpvDZXp&oh=00_AYBphtUmvs_0LuRG5tVFctzSBAJYEJGNXnSLproSMzgn6Q&oe=67CD9F9E"/>
                <div class="p-4">
                    <div class="flex justify-between items-center mb-2">
                        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">Còn Hết hạn</span>
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">New</span>
                    </div>
                    <h4 class="text-lg font-bold">Tour nước ngoài 3</h4>
                    <p class="text-sm">Thời gian: 9 Ngày 8 Đêm</p>
                    <p class="text-sm">Khởi hành: 05-03-2025</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Phần hài lòng khách hàng - Customer satisfaction -->
    <section class="container mx-auto mt-8 px-4">
        <h3 class="text-2xl font-bold mb-4">Hãy đồng hành cùng Vinhhtien</h3>
        <div class="bg-white shadow-md rounded-lg p-4">
            <div class="flex items-center">
                <img alt="Customer satisfaction" class="w-24 h-24 object-cover rounded-full mr-4" src="https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/472785912_1345406656464606_6329999213073072439_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=KqMkB-FA3-QQ7kNvgE-vvAt&_nc_oc=AdiK9qQQUhClgV1La5s7-IOtVrw42i4lhMYi3_9apvcXSIFfv5KlC0w6Me9mn9oHNBurRk-zo_EDcdTPfxQU3Ni0&_nc_zt=23&_nc_ht=scontent.fdad3-6.fna&_nc_gid=AMLlO0bPnLlPuBlLipLaQat&oh=00_AYDcasf5hqTNT7DfqqJZz6p42E4z7jD6yTAQ6j1NMwzpjQ&oe=67CDC091"/>
                <div>
                    <h4 class="text-lg font-bold">Sự hài lòng của khách hàng</h4>
                    <p class="text-sm">Hãy giải thoát tôi khỏi front end</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Phần các dịch vụ của chúng tôi - Our Services -->
    <section class="container mx-auto mt-8 px-4">
        <h3 class="text-2xl font-bold mb-4">Các dịch vụ của chúng tôi</h3>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <!-- Mỗi dịch vụ -->
            <div class="bg-white shadow-md rounded-lg p-4">
                <img alt="Service 1" class="w-full h-40 object-cover rounded-t-lg" src="https://cdn.tgdd.vn/Files/2021/06/15/1360317/luu-ngay-10-dia-diem-du-lich-da-nang-mien-phi-nhat-dinh-phai-di-202306241355153348.jpg"/>
                <h4 class="text-lg font-bold mt-4">Dịch vụ 1</h4>
                <p class="text-sm">dịch vụ bình săn con1</p>
            </div>
            <div class="bg-white shadow-md rounded-lg p-4">
                <img alt="Service 2" class="w-full h-40 object-cover rounded-t-lg" src="https://cdn.tgdd.vn/Files/2021/06/15/1360317/luu-ngay-10-dia-diem-du-lich-da-nang-mien-phi-nhat-dinh-phai-di-202306241355153348.jpg"/>
                <h4 class="text-lg font-bold mt-4">Dịch vụ 2</h4>
                <p class="text-sm">dịch vụ bình săn con2</p>
            </div>
            <div class="bg-white shadow-md rounded-lg p-4">
                <img alt="Service 3" class="w-full h-40 object-cover rounded-t-lg" src="https://cdn.tgdd.vn/Files/2021/06/15/1360317/luu-ngay-10-dia-diem-du-lich-da-nang-mien-phi-nhat-dinh-phai-di-202306241355153348.jpg"/>
                <h4 class="text-lg font-bold mt-4">Dịch vụ 3</h4>
                <p class="text-sm">dịch vụ bình săn con3</p>
            </div>
        </div>
    </section>
</main>
</body>
</html>
