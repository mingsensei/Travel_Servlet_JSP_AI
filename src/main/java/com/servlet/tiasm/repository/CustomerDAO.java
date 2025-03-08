/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macos
 */
public class CustomerDAO implements ICustomerDAO{
    private static final String INSERT_SQL = "INSERT INTO Customer (cusName,cusDoB,cusGender,cusPhoneNumber,cusEmail) VALUES (?,?,?,?,?)";
    private static final String SELECT_BY_ID_SQL = "SELECT * FROM Customer WHERE  cusId = ?";
    private static final String UPDATE_SQL = "UPDATE Customer SET cusName= ?, cusDoB = ?, cusGender = ?,cusPhoneNumber = ?,cusEmail = ? WHERE cusId = ?";
    private static final String DELETE_SQL = "DELETE FROM Customer WHERE cusId = ?";
    private static final String SELECT_ALL_SQL = "SELECT * FROM Customer";
    private static final String SEARCH_SQL = "SELECT * FROM Customer WHERE LOWER(cusName) LIKE ?";
    @Override
    public void create(Customer customer) {
        try(Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)){
            stmt.setString(1, customer.getCusName());
            stmt.setDate(2, Date.valueOf(customer.getCusDoB()));
            stmt.setString(3, customer.getCusGender());
            stmt.setString(4, customer.getCusPhoneNumber());
            stmt.setString(5, customer.getCusEmail());
            stmt.executeUpdate();
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Customer read(int id) {
        try(Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID_SQL)){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                return mapResultSetToCustomer(rs);
            }
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void update(Customer customer) {
        try(Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)){
            stmt.setString(1, customer.getCusName());
            stmt.setDate(2, Date.valueOf(customer.getCusDoB()));
            stmt.setString(3, customer.getCusGender());
            stmt.setString(4, customer.getCusPhoneNumber());
            stmt.setString(5, customer.getCusEmail());
            stmt.setInt(6, customer.getCusId());
            stmt.executeUpdate();
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        try(Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE_SQL)){
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Customer> getAll() {
        List<Customer> customers = new ArrayList<>();
        try(Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL)){
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                customers.add(mapResultSetToCustomer(rs));
            }
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return customers;
    }

    @Override
    public List<Customer> searchByName(String searchTerm) {
        List<Customer> customers = new ArrayList<>();
        try(Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(SEARCH_SQL)){
            stmt.setString(1, "'"+"%"+searchTerm.toLowerCase()+"%"+"'");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                customers.add(mapResultSetToCustomer(rs));
            }
        }
        catch (Exception e) {
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
                rs.getString("cusEmail")

        );
    }
}
