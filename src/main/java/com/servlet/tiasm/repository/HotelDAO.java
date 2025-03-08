package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Hotel;
import com.servlet.tiasm.model.Address;


import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class HotelDAO implements IHotelDAO {
    private static final String INSERT_SQL = "INSERT INTO Hotel ( hotelAvailableRooms, hotelService, hotelCheckInTime, hotelCheckOutTime) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_BY_ID_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,h.hotelAvailableRooms,h.hotelService,h.hotelCheckInTime,h.hotelCheckOutTime FROM BaseModel b RIGHT JOIN Hotel h ON  h.masterId = b.masterId JOIN dbo.Address a ON a.masterId = h.masterId WHERE  maserId = ?";
    private static final String UPDATE_SQL = "UPDATE Hotel SET hotelAvailableRooms = ?, hotelService = ?, hotelCheckInTime = ?, hotelCheckOutTime = ? WHERE masterId = ?";
    private static final String DELETE_SQL = "DELETE FROM Hotel WHERE masterId = ?";
    private static final String SELECT_ALL_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,h.hotelAvailableRooms,h.hotelService,h.hotelCheckInTime,h.hotelCheckOutTime FROM BaseModel b RIGHT JOIN Hotel h ON  h.masterId = b.masterId JOIN dbo.Address a ON a.masterId = h.masterId";
    private static final String SEARCH_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,h.hotelAvailableRooms,h.hotelService,h.hotelCheckInTime,h.hotelCheckOutTime FROM BaseModel b RIGHT JOIN Hotel h ON  h.masterId = b.masterId JOIN dbo.Address a ON a.masterId = h.masterId WHERE LOWER(h.hotelService) LIKE ? OR LOWER(b.travleName) LIKE ?";

    @Override
    public void create(Hotel hotel) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
            stmt.setInt(1, hotel.getTravelId());
            stmt.setInt(2, hotel.getHotelAvailableRooms());
            stmt.setString(3, String.join(",", hotel.getHotelService()));
            stmt.setTime(4, Time.valueOf(hotel.getHotelCheckInTime()));
            stmt.setTime(5, Time.valueOf(hotel.getHotelCheckOutTime()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Hotel read(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID_SQL)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToHotel(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Hotel hotel) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
            stmt.setInt(1, hotel.getHotelAvailableRooms());
            stmt.setString(2, String.join(",", hotel.getHotelService()));
            stmt.setTime(3, Time.valueOf(hotel.getHotelCheckInTime()));
            stmt.setTime(4, Time.valueOf(hotel.getHotelCheckOutTime()));
            stmt.setInt(5, hotel.getTravelId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_SQL)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Hotel> getAll() {
        List<Hotel> hotels = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                hotels.add(mapResultSetToHotel(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotels;
    }

    @Override
    public List<Hotel> searchByNameOrType(String searchTerm) {
        List<Hotel> hotels = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_SQL)) {
            stmt.setString(1, "'"+"%" + searchTerm.toLowerCase() + "%"+"'");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                hotels.add(mapResultSetToHotel(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotels;
    }

    private Hotel mapResultSetToHotel(ResultSet rs) throws SQLException {
        Address address = new Address(rs.getString("city"),rs.getString("district"),rs.getString("street"),rs.getString("number"));
        ArrayList<String> travelServices = new ArrayList<>(Arrays.asList(rs.getString("hotelService").split(",")));

        return new Hotel(
                rs.getInt("masterId"),
                rs.getString("travelName"),
                address,
                rs.getString("travelDescription"),
                rs.getInt("rating"),
                rs.getBigDecimal("pricePerPerson"),
                rs.getString("travelContactPhone"),
                rs.getString("travelContactEmail"),
                rs.getInt("hotelAvailableRooms"),
                travelServices,
                rs.getTime("hotelCheckInTime").toLocalTime(),
                rs.getTime("hotelCheckOutTime").toLocalTime()
        );
    }
}
