package com.servlet.tiasm.controller;

import com.servlet.tiasm.model.Booking;
import com.servlet.tiasm.model.BookingEntry;
import com.servlet.tiasm.model.Customer;
import com.servlet.tiasm.repository.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet("/bookingServlet")
public class BookingServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Lấy user từ session
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            response.sendRedirect("/login");
            return;
        }

        // Lấy danh sách dịch vụ từ session (cart)
        ArrayList<BookingEntry> cart = (ArrayList<BookingEntry>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp?error=Cart is empty");
            return;
        }

        // Tính tổng tiền
        BigDecimal totalPrice = BigDecimal.ZERO;
        for (BookingEntry entry : cart) {
            totalPrice = totalPrice.add(new BigDecimal(100)); // Ví dụ giá mỗi dịch vụ là 100 VND
        }

        // Tạo booking mới
        Booking booking = new Booking(0, customer, LocalDate.now(), new ArrayList<>(cart), totalPrice);
        
        // Gọi BookingDAO để lưu vào database
        bookingDAO.insert(booking);

        // Xóa cart sau khi booking thành công
        session.removeAttribute("cart");

        // Chuyển hướng về trang thành công
        response.sendRedirect("booking-success.jsp");
    }
}
