package com.servlet.tiasm.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/destination")
public class DestinationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "1":
                    response.sendRedirect(request.getContextPath() + "/destination/1.jsp");
                    break;
                case "2":
                    response.sendRedirect(request.getContextPath() + "/destination/2.jsp");
                    break;
                case "3":
                    response.sendRedirect(request.getContextPath() + "/destination/3.jsp");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/destination/list.jsp");
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/destination/list.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("review".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String content = request.getParameter("content");

            System.out.println("New Review from " + name + " (" + email + "): " + content);

            response.sendRedirect(request.getContextPath() + "/destination/details.jsp?success=true");
        }
    }
}
