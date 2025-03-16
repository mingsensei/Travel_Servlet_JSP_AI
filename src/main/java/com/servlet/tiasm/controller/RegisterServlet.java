package com.servlet.tiasm.controller;

import com.servlet.tiasm.model.User;
import com.servlet.tiasm.repository.UserDAO;
import java.io.IOException;

import com.servlet.tiasm.utils.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/register.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        UserDAO userDAO = new UserDAO();

        // Kiểm tra email đã tồn tại chưa
        if (userDAO.read(email) != null) {
            request.setAttribute("errorMessage", "Email đã được sử dụng!");
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra xác nhận mật khẩu
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }

        // Tạo user mới
        User newUser = new User(email, PasswordUtil.hashPassword(password), "USER"); // Role mặc định là USER
        userDAO.create(newUser);

        // Đăng ký thành công -> Chuyển hướng đến login
        response.sendRedirect(request.getContextPath()+"/login");
    }
}
