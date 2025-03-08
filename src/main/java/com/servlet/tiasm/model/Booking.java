package com.servlet.tiasm.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Vinh 03/03/2025
 */
public class Booking  {

    private int bookingId;
    private Customer customer;
    private LocalDate bookingDate;
    private ArrayList<BookingEntry> entries;
    private BigDecimal totalPrice; // Sử dụng BigDecimal thay vì int

    public Booking(int bookingId, Customer customer, LocalDate bookingDate, ArrayList<BookingEntry> entries, BigDecimal totalPrice) {
        this.bookingId = bookingId;
        this.customer = customer;
        this.bookingDate = bookingDate;
        this.entries = entries;
        this.totalPrice = totalPrice;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public ArrayList<BookingEntry> getEntries() {
        return entries;
    }

    public void setEntries(ArrayList<BookingEntry> entries) {
        this.entries = entries;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

   
}
