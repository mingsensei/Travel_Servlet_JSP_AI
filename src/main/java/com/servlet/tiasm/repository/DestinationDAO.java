package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Address;
import com.servlet.tiasm.model.Destination;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DestinationDAO implements IDestinationDAO {
    private static final String INSERT_SQL = "INSERT INTO Destination (masterId, tourEntryFee, tourOpeningHours, tourClosingHours, tourServicesAvailable) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_BY_ID_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,d.tourEntryFee,d.tourOpeningHours,d.tourClosingHours,d.tourServicesAvailable FROM BaseModel b RIGHT JOIN Destination d ON  d.masterId = b.masterId JOIN dbo.Address a ON a.masterId = d.masterId  WHERE masterId = ?";
    private static final String UPDATE_SQL = "UPDATE Destination SET tourEntryFee = ?, tourOpeningHours = ?, tourClosingHours = ?, tourServicesAvailable = ? WHERE masterId = ?";
    private static final String DELETE_SQL = "DELETE FROM Destination WHERE masterId = ?";
    private static final String SELECT_ALL_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,d.tourEntryFee,d.tourOpeningHours,d.tourClosingHours,d.tourServicesAvailable FROM BaseModel b RIGHT JOIN Destination d ON  d.masterId = b.masterId JOIN dbo.Address a ON a.masterId = d.masterId ";
    private static final String SEARCH_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,d.tourEntryFee,d.tourOpeningHours,d.tourClosingHours,d.tourServicesAvailable FROM BaseModel b RIGHT JOIN Destination d ON  d.masterId = b.masterId JOIN dbo.Address a ON a.masterId = d.masterId  WHERE LOWER(tourServicesAvailable) LIKE ?  OR LOWER(b.travleName) LIKE ?";

    @Override
    public void create(Destination destination) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
            stmt.setInt(1, destination.getTravelId());
            stmt.setBigDecimal(2, destination.getTourEntryFee()); // Giữ nguyên BigDecimal
            stmt.setTime(3, Time.valueOf(destination.getTourOpeningHours()));
            stmt.setTime(4, Time.valueOf(destination.getTourClosingHours()));
            stmt.setString(5, String.join(",", destination.getTourServicesAvailable()));

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Destination read(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID_SQL)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToDestination(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Destination destination) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
            stmt.setBigDecimal(1,destination.getTourEntryFee());
            stmt.setTime(2, Time.valueOf(destination.getTourOpeningHours()));
            stmt.setTime(3, Time.valueOf(destination.getTourClosingHours()));
            stmt.setString(4, String.join(",", destination.getTourServicesAvailable()));
            stmt.setInt(5, destination.getTravelId());

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
    public List<Destination> getAll() {
        List<Destination> destinations = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                destinations.add(mapResultSetToDestination(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destinations;
    }

    @Override
    public List<Destination> searchByNameOrType(String searchTerm) {
        List<Destination> destinations = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_SQL)) {
            stmt.setString(1, "'"+"%" + searchTerm.toLowerCase() + "%"+"'");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                destinations.add(mapResultSetToDestination(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destinations;
    }
    private Destination mapResultSetToDestination(ResultSet rs) throws SQLException {
        Address address = new Address(rs.getString("city"),rs.getString("district"),rs.getString("street"),rs.getString("number"));
        ArrayList<String> travelServices = new ArrayList<>(Arrays.asList(rs.getString("tourServicesAvailable").split(",")));

        return new Destination(
                rs.getInt("masterId"),
                rs.getString("travelName"),
                address,
                rs.getString("travelDescription"),
                rs.getInt("rating"),
                rs.getBigDecimal("pricePerPerson"),
                rs.getString("travelContactPhone"),
                rs.getString("travelContactEmail"),
                rs.getBigDecimal("tourEntryFee"),
                rs.getTime("tourOpeningHours").toLocalTime(),
                rs.getTime("tourClosingHours").toLocalTime(),
                travelServices

        );
    }
}
