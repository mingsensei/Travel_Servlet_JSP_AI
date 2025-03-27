package com.servlet.tiasm.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.servlet.tiasm.model.Customer;
import com.servlet.tiasm.model.User;
import com.servlet.tiasm.service.CustomerService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("/login");
        return;
    }

    int userId = user.getId();
    Customer customer = customerService.findById(userId);
    request.setAttribute("customer", customer);

    // Kiểm tra nếu request yêu cầu JSON
    String format = request.getParameter("format");
    String acceptHeader = request.getHeader("Accept");

    if ("json".equalsIgnoreCase(format) || (acceptHeader != null && acceptHeader.contains("application/json"))) {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String jsonResponse = String.format(
            "{\"success\": true, \"customer\": {\"id\": %d, \"name\": \"%s\", \"dob\": \"%s\", \"gender\": \"%s\", \"phone\": \"%s\", \"email\": \"%s\"}}",
            user.getId(),
            customer != null ? customer.getCusName() : "",
            customer != null ? customer.getCusDoB() : "",
            customer != null ? customer.getCusGender() : "",
            customer != null ? customer.getCusPhoneNumber() : "",
            user.getEmail()
        );

        response.getWriter().write(jsonResponse);
        return; // Kết thúc hàm để tránh xử lý tiếp
    }

    // Xử lý điều hướng theo action
    String action = request.getParameter("action");

    if (action != null) {
        switch (action) {
            case "update":
                request.getRequestDispatcher("/views/user5.jsp").forward(request, response);
                return;
            case "changePassword":
                request.getRequestDispatcher("/views/user2.jsp").forward(request, response);
                return;
            case "view":
                request.getRequestDispatcher("/views/user1.jsp").forward(request, response);
                return;
            case "security":
                request.getRequestDispatcher("/views/user3.jsp").forward(request, response);
                return;
            case "notifications":
                request.getRequestDispatcher("/views/user4.jsp").forward(request, response);
                return;
            default:
                request.getRequestDispatcher("/views/user1.jsp").forward(request, response);
                return;
        }
    }

    // Nếu không có action, hiển thị trang mặc định
    request.getRequestDispatcher("/views/user1.jsp").forward(request, response);
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateProfile(request, response);
        } else if ("changePassword".equals(action)) {
            changePassword(request, response);
        }
    }

   private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("/login");
        return;
    }

    // Đọc JSON từ request body
    BufferedReader reader = request.getReader();
    StringBuilder jsonBody = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        jsonBody.append(line);
    }

    // Chuyển JSON thành Object
    Gson gson = new Gson();  // Import: com.google.gson.Gson
    JsonObject jsonObject = gson.fromJson(jsonBody.toString(), JsonObject.class);

    String name = jsonObject.get("fullname").getAsString();
String dob = jsonObject.get("dob").getAsString();
String gender = jsonObject.get("gender").getAsString();
String phone = jsonObject.get("phone").getAsString();

// Map gender values
if ("Nam".equalsIgnoreCase(gender)) {
    gender = "Male";
} else if ("Nữ".equalsIgnoreCase(gender)) {
    gender = "Female";
}
    if (name.isEmpty() || dob.isEmpty() || gender.isEmpty() || phone.isEmpty() ) {
        response.setContentType("application/json");
        response.getWriter().write("{\"success\": false, \"error\": \"Vui lòng điền đầy đủ thông tin!\"}");
        return;
    }

    try {
        Customer customer = new Customer(0, name, java.time.LocalDate.parse(dob), gender, phone, user.getEmail(), user.getId());
        customerService.update(customer);

        response.setContentType("application/json");
        response.getWriter().write("{\"success\": true, \"message\": \"Cập nhật thành công!\"}");
    } catch (Exception e) {
        e.printStackTrace(); 
        response.setContentType("application/json");
        response.getWriter().write("{\"success\": false, \"error\": \"Có lỗi xảy ra khi cập nhật!\"}");
    }
}



    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();

        if (email == null) {
            response.sendRedirect("/login");
            return;
        }

        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("confirm-password");

        if (!newPassword.equals(confirmPassword)) {
    request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            try {
                request.getRequestDispatcher("/views/user2.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(CustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    return;
}

        boolean success = customerService.changePassword(email, currentPassword, newPassword);
       if (success) {
    // Nếu thành công, thiết lập thông báo vào request và forward đến trang change-password.jsp
    request.setAttribute("success", "Đổi mật khẩu thành công!");
    request.getRequestDispatcher("/views/user2.jsp").forward(request, response);
} else {
    // Nếu có lỗi, thiết lập thông báo lỗi và forward đến trang change-password.jsp
    request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
    request.getRequestDispatcher("/views/user2.jsp").forward(request, response);
}


    }
}
