package com.servlet.tiasm.controller;

import com.servlet.tiasm.model.BookingEntry;
import com.servlet.tiasm.model.Customer;
import com.servlet.tiasm.model.User;
import com.servlet.tiasm.repository.BookingDAO;
import com.servlet.tiasm.repository.CustomerDAO;
import com.servlet.tiasm.service.CartService;
import jakarta.servlet.RequestDispatcher;
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
        System.out.println("Đã thêm vào giỏ hàng: serviceId=" + serviceId + ", serviceType=" + serviceType);
        break;
    case "remove":
        serviceId = Integer.parseInt(request.getParameter("serviceId"));
        cartService.removeFromCart(session, serviceId);
        System.out.println("Đã xóa khỏi giỏ hàng: serviceId=" + serviceId);
        break;
    case "checkout":
    // Lấy userID hiện tại từ session
    User user = (User) session.getAttribute("user");
    CustomerDAO customerDAO = new CustomerDAO();

    // Kiểm tra xem khách hàng có tồn tại không
    Customer customer = null;
    try{
        customer = customerDAO.read(user.getId());
    }catch(Exception e){}
    if (customer == null) {
        // Nếu không tìm thấy, chuyển hướng đến trang cập nhật thông tin khách hàng
        response.sendRedirect("/customer?action=update");
        return; // Dừng việc xử lý tiếp
    }

    // Tiến hành checkout nếu khách hàng tồn tại
    cartService.checkoutCart(session);
    System.out.println("Đã thanh toán giỏ hàng.");

    // Fetch the booking information after checkout
    BookingDAO bookingDAO = new BookingDAO();
    CustomerDAO cusDAO = new CustomerDAO();
    int bookingId = bookingDAO.getById(cusDAO.read(user.getId()).getCusId()).getBookingId();
    List<BookingEntry> bookingDetails = bookingDAO.getBookingDetails(bookingId);

    // Store the booking details in session or request
    session.setAttribute("bookingDetails", bookingDetails);

    // Thiết lập thành công và chuyển tiếp đến trang thành công bằng RequestDispatcher
    session.setAttribute("cartSuccess", true);

    // Forward request to cartSuccess.jsp
    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/cartSuccess.jsp");
    dispatcher.forward(request, response);
    break;

    default:
        System.out.println("Hành động không xác định: " + action);
}

// Phương thức hỗ trợ để lấy userID từ session
    response.sendRedirect(request.getContextPath() + "/cart");
}

}
