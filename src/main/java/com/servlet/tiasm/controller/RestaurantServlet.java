package com.servlet.tiasm.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {

    private static final String RESTAURANT_PAGE_1 = "/views/restaurant1.jsp";
    private static final String RESTAURANT_PAGE_2 = "/views/restaurant2.jsp";
    private static final String RESTAURANT_PAGE_3 = "/views/restaurant3.jsp";
    private static final String SUCCESS_PAGE = "/restaurant/details.jsp?success=true";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        String restaurantPage = RESTAURANT_PAGE_1; // Default page
        if (action != null) {
            switch (action) {
                case "1":
                    restaurantPage = RESTAURANT_PAGE_1;
                    break;
                case "2":
                    restaurantPage = RESTAURANT_PAGE_2;
                    break;
                case "3":
                    restaurantPage = RESTAURANT_PAGE_3;
                    break;
                default:
                    restaurantPage = RESTAURANT_PAGE_1;
                    break;
            }
        }

        request.getRequestDispatcher(restaurantPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("review".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String content = request.getParameter("content");

            // Log the review for debugging or processing
            System.out.println("New Restaurant Review from " + name + " (" + email + "): " + content);

            // Redirect to the success page
            response.sendRedirect(request.getContextPath() + SUCCESS_PAGE);
        }
    }
}
