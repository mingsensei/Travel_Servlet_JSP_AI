package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Booking;
import com.servlet.tiasm.model.BookingEntry;
import com.servlet.tiasm.model.Customer;
import com.servlet.tiasm.model.Restaurant;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;

/**
 * DAO class for managing Booking data.
 */
public class BookingDAO {
    private RestaurantDAO rerepo = new RestaurantDAO();
    private DestinationDAO derepo = new DestinationDAO();
    private HotelDAO horepo = new HotelDAO();
    
    private static final String SELECT_ALL_SQL = 
        "SELECT b.bookingId, b.bookingDate, b.totalPrice, " +
        "c.cusId, c.cusName, c.cusDoB, c.cusGender, c.cusPhoneNumber, c.cusEmail " +
        "FROM Booking b JOIN Customer c ON b.customerId = c.cusId";

    private static final String SELECT_BY_ID_SQL = 
        "SELECT b.bookingId, b.bookingDate, b.totalPrice, " +
        "c.cusId, c.cusName, c.cusDoB, c.cusGender, c.cusPhoneNumber, c.cusEmail " +
        "FROM Booking b JOIN Customer c ON b.customerId = c.cusId WHERE b.bookingId = ?";

    private static final String INSERT_SQL = 
        "INSERT INTO Booking (customerId, bookingDate, totalPrice) VALUES (?, ?, ?)";

    private static final String UPDATE_SQL = 
        "UPDATE Booking SET customerId = ?, bookingDate = ?, totalPrice = ? WHERE bookingId = ?";

    private static final String DELETE_SQL = "DELETE FROM Booking WHERE bookingId = ?";

    public List<Booking> getAll() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return bookings;
    }

    public Booking getById(int bookingId) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID_SQL)) {
            stmt.setInt(1, bookingId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToBooking(rs);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void insert(Booking booking) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, booking.getCustomer().getCusId());
            stmt.setDate(2, Date.valueOf(booking.getBookingDate()));
            stmt.setBigDecimal(3, booking.getTotalPrice());
            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    booking.setBookingId(generatedKeys.getInt(1));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Booking booking) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
            stmt.setInt(1, booking.getCustomer().getCusId());
            stmt.setDate(2, Date.valueOf(booking.getBookingDate()));
            stmt.setBigDecimal(3, booking.getTotalPrice());
            stmt.setInt(4, booking.getBookingId());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int bookingId) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_SQL)) {
            stmt.setInt(1, bookingId);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        Customer customer = new Customer(
            rs.getInt("cusId"),
            rs.getString("cusName"),
            rs.getDate("cusDoB").toLocalDate(),
            rs.getString("cusGender"),
            rs.getString("cusPhoneNumber"),
            rs.getString("cusEmail")
        );

        List<BookingEntry> entries = getBookingEntries(rs.getInt("bookingId"));

        return new Booking(
            rs.getInt("bookingId"),
            customer,
            rs.getDate("bookingDate").toLocalDate(),
            new ArrayList<>(entries),
            rs.getBigDecimal("totalPrice")
        );
    }

   private List<BookingEntry> getBookingEntries(int bookingId) {
    List<BookingEntry> entries = new ArrayList<>();
    String query = "SELECT be.*, r.name AS restaurantName, d.name AS destinationName, h.name AS hotelName " +
                   "FROM BookingEntry be " +
                   "LEFT JOIN Restaurant r ON be.serviceType = 'restaurant' AND be.serviceId = r.restaurantId " +
                   "LEFT JOIN Destination d ON be.serviceType = 'destination' AND be.serviceId = d.destinationId " +
                   "LEFT JOIN Hotel h ON be.serviceType = 'hotel' AND be.serviceId = h.hotelId " +
                   "WHERE be.bookingId = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setInt(1, bookingId);
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                entries.add(mapResultSetToBookingEntry(rs));
            }
        }
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    return entries;
}


 private BookingEntry mapResultSetToBookingEntry(ResultSet rs) throws SQLException {
    String serviceType = rs.getString("serviceType"); 
    int serviceId = rs.getInt("serviceId");

    switch (serviceType.toLowerCase()) {
        case "restaurant":
            LocalDateTime bookingTime = rs.getTimestamp("bookingTime") != null 
                ? rs.getTimestamp("bookingTime").toLocalDateTime() 
                : null;
            return new BookingEntry(rerepo.read(serviceId), bookingTime);

        case "destination":
            LocalDateTime destinationTime = rs.getTimestamp("bookingTime") != null 
                ? rs.getTimestamp("bookingTime").toLocalDateTime() 
                : null;
            return new BookingEntry(derepo.read(serviceId), destinationTime);

        case "hotel":
            Date checkIn = rs.getDate("checkIn");
            Date checkOut = rs.getDate("checkOut");
            return new BookingEntry(horepo.read(serviceId), checkIn, checkOut);

        default:
            throw new SQLException("Unknown serviceType: " + serviceType);
    }
}

}
