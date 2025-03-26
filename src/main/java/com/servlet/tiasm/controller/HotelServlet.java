package com.servlet.tiasm.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hotel")
public class HotelServlet extends HttpServlet {

    private static final String HOTEL_PAGE_1 = "/views/hotel1.jsp";
    private static final String HOTEL_PAGE_2 = "/views/hotel2.jsp";
    private static final String HOTEL_PAGE_3 = "/views/hotel3.jsp";
    private static final String SUCCESS_PAGE = "/hotel/details.jsp?success=true";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        String hotelPage = HOTEL_PAGE_1;  // Default page
        if (action != null) {
            switch (action) {
                case "1":
                    hotelPage = HOTEL_PAGE_1;
                    break;
                case "2":
                    hotelPage = HOTEL_PAGE_2;
                    break;
                case "3":
                    hotelPage = HOTEL_PAGE_3;
                    break;
                default:
                    hotelPage = HOTEL_PAGE_1;
                    break;
            }
        }

        request.getRequestDispatcher(hotelPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("review".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String content = request.getParameter("content");

            // Log the review for debugging or processing
            System.out.println("New Review from " + name + " (" + email + "): " + content);

            // Redirect to the success page
            response.sendRedirect(request.getContextPath() + SUCCESS_PAGE);
        }
    }
}
