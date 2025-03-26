package com.servlet.tiasm.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/destination")
public class DestinationServlet extends HttpServlet {

    private static final String DESTINATION_PAGE_1 = "/views/destination1.jsp";
    private static final String DESTINATION_PAGE_2 = "/views/destination2.jsp";
    private static final String DESTINATION_PAGE_3 = "/views/destination3.jsp";
    private static final String SUCCESS_PAGE = "/destination/details.jsp?success=true";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        String destinationPage = DESTINATION_PAGE_1;  // Default page
        if (action != null) {
            switch (action) {
                case "1":
                    destinationPage = DESTINATION_PAGE_1;
                    break;
                case "2":
                    destinationPage = DESTINATION_PAGE_2;
                    break;
                case "3":
                    destinationPage = DESTINATION_PAGE_3;
                    break;
                default:
                    destinationPage = DESTINATION_PAGE_1;
                    break;
            }
        }

        request.getRequestDispatcher(destinationPage).forward(request, response);
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
