package com.servlet.tiasm.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "home";
        }

        switch (action) {
            case "menu":
                response.sendRedirect(request.getContextPath() + "/menu");
                break;
            case "news":
                response.sendRedirect(request.getContextPath() + "/news");
                break;
            case "contact":
                response.sendRedirect(request.getContextPath() + "/contact");
                break;
            case "search":
                response.sendRedirect(request.getContextPath() + "/search");
                break;
            case "about":
                response.sendRedirect(request.getContextPath() + "/about");
                break;
            case "":

            default:
                response.sendRedirect(request.getContextPath() + "/home");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("comment".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String content = request.getParameter("content");

            System.out.println("New Comment from " + name + " (" + email + "): " + content);

            response.sendRedirect(request.getContextPath() + "/news?success=true");
        }
    }
}
