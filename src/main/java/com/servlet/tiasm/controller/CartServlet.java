package com.servlet.tiasm.controller;

import com.servlet.tiasm.model.BookingEntry;
import com.servlet.tiasm.service.CartService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // ✅ In log session ID & trạng thái
        System.out.println("Session ID: " + session.getId());
        System.out.println("Session isNew: " + session.isNew());
        System.out.println("Session attributes: " + session.getAttributeNames());

        request.setAttribute("cart", cartService.getCart(session));
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(true); // Lấy session, tạo nếu chưa có
    String action = request.getParameter("action");

    // ✅ Log session ID khi POST request
    System.out.println("POST request - Session ID: " + session.getId());

    // ✅ Kiểm tra và khởi tạo cart nếu chưa có
    List<BookingEntry> cart = (List<BookingEntry>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
        System.out.println("Cart initialized in session.");
    }

    switch (action) {
        case "add":
            int serviceId = Integer.parseInt(request.getParameter("serviceId"));
            String serviceType = request.getParameter("serviceType");
            cartService.addToCart(session, serviceId, serviceType);
            System.out.println("Added to cart: serviceId=" + serviceId + ", serviceType=" + serviceType);
            break;
        case "remove":
            serviceId = Integer.parseInt(request.getParameter("serviceId"));
            cartService.removeFromCart(session, serviceId);
            System.out.println("Removed from cart: serviceId=" + serviceId);
            break;
        case "checkout":
            cartService.checkoutCart(session);
            System.out.println("Checked out cart.");
            break;
        default:
            System.out.println("Unknown action: " + action);
    }

    response.sendRedirect(request.getContextPath() + "/cart");
}

}
