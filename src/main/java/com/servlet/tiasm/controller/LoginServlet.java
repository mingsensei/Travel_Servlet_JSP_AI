package com.servlet.tiasm.controller;

import com.servlet.tiasm.model.User;
import com.servlet.tiasm.repository.UserDAO;
import com.servlet.tiasm.utils.PasswordUtil;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.read(email);

        if (user != null && user.getPasswordHash().equals(PasswordUtil.hashPassword(password))){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            System.out.println("Session User: " + session.getAttribute("user")); //
            response.sendRedirect(request.getContextPath() + "/home"); // ✅ Chuyển hướng đúng
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Sai email hoặc mật khẩu!");
            response.sendRedirect(request.getContextPath() + "/login"); // ✅ Tránh vòng lặp vô hạn
        }

    }
}
