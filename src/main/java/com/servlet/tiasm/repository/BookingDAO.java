package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Booking;
import com.servlet.tiasm.model.BookingEntry;
import com.servlet.tiasm.model.Customer;
import com.servlet.tiasm.model.Restaurant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * DAO class for managing Booking data.
 */
public class BookingDAO {
    private RestaurantDAO rerepo = new RestaurantDAO();
    private DestinationDAO derepo = new DestinationDAO();
    private HotelDAO horepo = new HotelDAO();
    
    private static final String SELECT_ALL_SQL = 
        "SELECT b.bookingId, b.bookingDate, b.totalPrice, " +
        "c.cusId, c.userID, c.cusName, c.cusDoB, c.cusGender, c.cusPhoneNumber, c.cusEmail " +
        "FROM Booking b JOIN Customer c ON b.customerId = c.cusId";

    private static final String SELECT_BY_ID_SQL = 
        "SELECT b.bookingId, b.bookingDate, b.totalPrice, " +
        "c.cusId, c.userID, c.cusName, c.cusDoB, c.cusGender, c.cusPhoneNumber, c.cusEmail " +
        "FROM Booking b JOIN Customer c ON b.customerId = c.cusId WHERE b.bookingId = ?";

    private static final String INSERT_BOOKING_SQL = 
        "INSERT INTO Booking (customerId, bookingDate, totalPrice, userID) VALUES (?, ?, ?, ?)";

    private static final String INSERT_BOOKING_ENTRY_SQL = 
        "INSERT INTO BookingEntry (bookingId, serviceType, serviceId, bookingTime, checkIn, checkOut) " +
        "VALUES (?, ?, ?, ?, ?, ?)";

    private static final String UPDATE_SQL = 
        "UPDATE Booking SET customerId = ?, bookingDate = ?, totalPrice = ?, userID = ? WHERE bookingId = ?";

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
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            try (PreparedStatement stmt = conn.prepareStatement(INSERT_BOOKING_SQL, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setInt(1, booking.getCustomer().getCusId());
                stmt.setTimestamp(2, Timestamp.valueOf(booking.getBookingDate()));
                stmt.setBigDecimal(3, booking.getTotalPrice());
                stmt.setInt(4, booking.getCustomer().getUserID());
                stmt.executeUpdate();
                
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int bookingId = generatedKeys.getInt(1);
                        booking.setBookingId(bookingId);
                        insertBookingEntries(conn, bookingId, booking.getEntries());
                    }
                }
            }
            conn.commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void insertBookingEntries(Connection conn, int bookingId, List<BookingEntry> entries) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(INSERT_BOOKING_ENTRY_SQL)) {
            for (BookingEntry entry : entries) {
                stmt.setInt(1, bookingId);
                stmt.setString(2, entry.getServiceType());
                stmt.setInt(3, entry.getService().getTravelId());
                stmt.setTimestamp(4, entry.getBookingTime() != null ? Timestamp.valueOf(entry.getBookingTime()) : null);
                stmt.setTimestamp(5, entry.getBookingStartDate() != null ? Timestamp.valueOf(entry.getBookingStartDate()) : null);
                stmt.setTimestamp(6, entry.getBookingEndDate() != null ? Timestamp.valueOf(entry.getBookingEndDate()) : null);
                stmt.addBatch();
            }
            stmt.executeBatch();
        }
    }

    public void update(Booking booking) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
            stmt.setInt(1, booking.getCustomer().getCusId());
            stmt.setTimestamp(2, Timestamp.valueOf(booking.getBookingDate()));
            stmt.setBigDecimal(3, booking.getTotalPrice());
            stmt.setInt(4, booking.getCustomer().getUserID());
            stmt.setInt(5, booking.getBookingId());
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
            rs.getString("cusEmail"),
            rs.getInt("userID")
        );

        return new Booking(
            rs.getInt("bookingId"),
            customer,
            rs.getTimestamp("bookingDate").toLocalDateTime(),
            new ArrayList<>(),
            rs.getBigDecimal("totalPrice")
        );
    }
}
