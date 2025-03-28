package com.servlet.tiasm.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forwarding the request to the "contact.jsp" page
        request.getRequestDispatcher("/views/Contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You can handle the form submission logic here if needed
        // For now, just forwarding the user to the contact page
        request.getRequestDispatcher("/views/Contact.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Contact Servlet redirects to the Contact page";
    }
}
