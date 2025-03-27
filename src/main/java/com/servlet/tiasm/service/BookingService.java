package com.servlet.tiasm.service;

import com.servlet.tiasm.model.Booking;
import com.servlet.tiasm.repository.BookingDAO;
import java.util.List;

public class BookingService implements IBookingService {

    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    public void display() {
        List<Booking> bookings = bookingDAO.getAll();
        for (Booking booking : bookings) {
            System.out.println(booking);
        }
    }

    @Override
    public void add(Booking entity) {
        if (entity != null) {
            bookingDAO.insert(entity);
            System.out.println("Booking added successfully");
        } else {
            System.out.println("Invalid booking data");
        }
    }

    @Override
    public void update(Booking entity) {
        if (entity != null && entity.getBookingId() > 0) {
            bookingDAO.update(entity);
            System.out.println("Booking updated successfully");
        } else {
            System.out.println("Invalid booking data or booking ID");
        }
    }

    @Override
    public Booking findById(int id) {
        if (id > 0) {
            Booking booking = bookingDAO.getById(id);
            if (booking != null) {
                return booking;
            } else {
                System.out.println("Booking not found");
            }
        } else {
            System.out.println("Invalid booking ID");
        }
        return null;
    }

    @Override
    public void delete(Booking entity) {
        if (entity != null && entity.getBookingId() > 0) {
            bookingDAO.delete(entity.getBookingId());
            System.out.println("Booking deleted successfully");
        } else {
            System.out.println("Invalid booking data or booking ID");
        }
    }

    @Override
    public void save() {
        // This method can be used if needed to persist a specific booking, but usually, adding or updating is sufficient.
        System.out.println("Save method invoked, but no specific implementation.");
    }
}
