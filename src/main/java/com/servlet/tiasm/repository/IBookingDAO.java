/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.tiasm.repository;

/**
 *
 * @author macos
 */
import com.servlet.tiasm.model.Booking;
import java.util.List;

public interface IBookingDAO extends IDAO<Booking> {

    // Tìm kiếm booking theo thông tin khách hàng hoặc theo các tiêu chí khác
    List<Booking> searchByCustomer(String customerName);

    // Lấy danh sách các booking trong một khoảng thời gian
    List<Booking> getBookingsByDateRange(String startDate, String endDate);

    // Lấy booking theo mã booking duy nhất
    Booking getByBookingCode(String bookingCode);

    // Lấy tổng doanh thu từ tất cả các booking
    double getTotalRevenue();
}

