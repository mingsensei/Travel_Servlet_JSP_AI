package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private static final String INSERT_SQL = "INSERT INTO Users (email, passwordHash, role) VALUES (?, ?, ?)";
    private static final String SELECT_BY_EMAIL_SQL = "SELECT * FROM Users WHERE email = ?";
    private static final String UPDATE_SQL = "UPDATE Users SET passwordHash = ?, role = ? WHERE email = ?";
    private static final String DELETE_SQL = "DELETE FROM Users WHERE email = ?";
    private static final String SELECT_ALL_SQL = "SELECT * FROM Users";

    @Override
    public void create(User user) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPasswordHash());
            stmt.setString(3, user.getRole());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User read(String email) {
            System.out.println("🔍 Checking UserDAO.read() with email: " + email);

            try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_EMAIL_SQL)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    System.out.println("✅ User found: " + rs.getString("email"));
                    return mapResultSetToUser(rs);
                } else {
                    System.out.println("❌ No user found with email: " + email);
                }

            } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void update(User user) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
            stmt.setString(1, user.getPasswordHash());
            stmt.setString(2, user.getRole());
            stmt.setString(3, user.getEmail());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void delete(String email) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_SQL)) {
            stmt.setString(1, email);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("cusID"),
                rs.getString("email"),
                rs.getString("passwordHash"),
                rs.getString("role"),
                rs.getTimestamp("createdAt").toLocalDateTime()
        );
    }

}
