package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Address;
import com.servlet.tiasm.model.Restaurant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDAO implements IRestaurantDAO {
    private static final String INSERT_SQL = "INSERT INTO Restaurant (masterId, cuisineType, resOpeningHours, resClosingHours) VALUES (?, ?, ?, ?)";
    private static final String SELECT_BY_ID_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,r.cuisineType,r.resOpeningHours,r.resClosingHours FROM BaseModel b RIGHT JOIN Restaurant r ON  r.masterId = b.masterId JOIN dbo.Address a ON a.masterId = r.masterId  WHERE masterId = ?";
    private static final String UPDATE_SQL = "UPDATE Restaurant SET cuisineType = ?, resOpeningHours = ?, resClosingHours = ? WHERE masterId = ?";
    private static final String DELETE_SQL = "DELETE FROM Restaurant WHERE masterId = ?";
    private static final String SELECT_ALL_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,r.cuisineType,r.resOpeningHours,r.resClosingHours FROM BaseModel b RIGHT JOIN Restaurant r ON  r.masterId = b.masterId JOIN dbo.Address a ON a.masterId = r.masterId ";
    private static final String SEARCH_SQL = "SELECT b.masterId,b.travelName, a.city,a.district,a.street,a.number,b.travelDescription,b.rating,b.pricePerPerson,b.travelContactPhone,b.travelContactEmail,r.cuisineType,r.resOpeningHours,r.resClosingHours FROM BaseModel b RIGHT JOIN Restaurant r ON  r.masterId = b.masterId JOIN dbo.Address a ON a.masterId = r.masterId WHERE LOWER(r.cuisineType) LIKE ? OR LOWER(b.travleName) LIKE ?";

    @Override
    public void create(Restaurant restaurant) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
            stmt.setInt(1, restaurant.getTravelId());
            stmt.setString(2, restaurant.getCuisineType());
            stmt.setTime(3, Time.valueOf(restaurant.getResOpeningHours()));
            stmt.setTime(4, Time.valueOf(restaurant.getResClosingHours()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant read(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID_SQL)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToRestaurant(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Restaurant restaurant) {
//        try (Connection conn = DBConnection.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
//            stmt.setString(1, restaurant.getCuisineType());
//            stmt.setTime(2, Time.valueOf(restaurant.getResOpeningHours()));
//            stmt.setTime(3, Time.valueOf(restaurant.getResClosingHours()));
//            stmt.setInt(4, restaurant.getMasterId());
//            stmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
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
    public List<Restaurant> getAll() {
        List<Restaurant> restaurants = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                restaurants.add(mapResultSetToRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }

    @Override
    public List<Restaurant> searchByNameOrCuisine(String searchTerm) {
        List<Restaurant> restaurants = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_SQL)) {
            stmt.setString(1, "'"+"%" + searchTerm.toLowerCase() + "%"+"'");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                restaurants.add(mapResultSetToRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }
    private Restaurant mapResultSetToRestaurant(ResultSet rs) throws SQLException {
        Address address = new Address(rs.getString("city"),rs.getString("district"),rs.getString("street"),rs.getString("number"));

        return new Restaurant(
                rs.getInt("masterId"),
                rs.getString("travelName"),
                address,
                rs.getString("travelDescription"),
                rs.getInt("rating"),
                rs.getBigDecimal("pricePerPerson"),
                rs.getString("travelContactPhone"),
                rs.getString("travelContactEmail"),
                rs.getString("cuisineType"),
                rs.getTime("resOpeningHours").toLocalTime(),
                rs.getTime("resClosingHours").toLocalTime()

        );
    }

}
