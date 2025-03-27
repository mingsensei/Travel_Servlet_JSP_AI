package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    private static final String INSERT_SQL = "INSERT INTO Customer (cusName, cusDoB, cusGender, cusPhoneNumber, cusEmail, userID) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_BY_ID_SQL = "SELECT * FROM Customer WHERE userId = ?";
    private static final String UPDATE_SQL = "UPDATE Customer SET cusName = ?, cusDoB = ?, cusGender = ?, cusPhoneNumber = ?, cusEmail = ?, userID = ? WHERE userId = ?";
    private static final String DELETE_SQL = "DELETE FROM Customer WHERE userId = ?";
    private static final String SELECT_ALL_SQL = "SELECT * FROM Customer";
    private static final String SEARCH_SQL = "SELECT * FROM Customer WHERE LOWER(cusName) LIKE ?";

    @Override
    public void create(Customer customer) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
            stmt.setString(1, customer.getCusName());
            stmt.setDate(2, Date.valueOf(customer.getCusDoB()));
            stmt.setString(3, customer.getCusGender());
            stmt.setString(4, customer.getCusPhoneNumber());
            stmt.setString(5, customer.getCusEmail());
            stmt.setInt(6, customer.getUserID()); // Thêm userID
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Customer read(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID_SQL)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToCustomer(rs);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    @Override
public void update(Customer customer) {
    try (Connection conn = DBConnection.getConnection()) {
        // Kiểm tra xem user có tồn tại không
        try (PreparedStatement checkStmt = conn.prepareStatement(SELECT_BY_ID_SQL)) {
            checkStmt.setInt(1, customer.getUserID());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) { // Nếu user đã tồn tại -> Update
                try (PreparedStatement updateStmt = conn.prepareStatement(UPDATE_SQL)) {
                    updateStmt.setString(1, customer.getCusName());
                    updateStmt.setDate(2, Date.valueOf(customer.getCusDoB()));
                    updateStmt.setString(3, customer.getCusGender());
                    updateStmt.setString(4, customer.getCusPhoneNumber());
                    updateStmt.setString(5, customer.getCusEmail());
                    updateStmt.setInt(6, customer.getUserID()); // Cập nhật userID
                    updateStmt.setInt(7, customer.getUserID());
                    updateStmt.executeUpdate();
                }
            } else { // Nếu user không tồn tại -> Chuyển sang tạo mới
                create(customer);
            }
        }
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
}


    @Override
    public void delete(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_SQL)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Customer> getAll() {
        List<Customer> customers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                customers.add(mapResultSetToCustomer(rs));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return customers;
    }

    @Override
    public List<Customer> searchByName(String searchTerm) {
        List<Customer> customers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_SQL)) {
            stmt.setString(1, "%" + searchTerm.toLowerCase() + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                customers.add(mapResultSetToCustomer(rs));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return customers;
    }

    private Customer mapResultSetToCustomer(ResultSet rs) throws SQLException {
        return new Customer(
                rs.getInt("cusId"),
                rs.getString("cusName"),
                rs.getDate("cusDoB").toLocalDate(),
                rs.getString("cusGender"),
                rs.getString("cusPhoneNumber"),
                rs.getString("cusEmail"),
                rs.getInt("userID") // Lấy userID từ DB
        );
    }
}
