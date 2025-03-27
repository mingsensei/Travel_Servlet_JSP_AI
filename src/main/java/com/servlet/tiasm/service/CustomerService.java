package com.servlet.tiasm.service;

import com.servlet.tiasm.model.Customer;
import com.servlet.tiasm.model.User;
import com.servlet.tiasm.repository.CustomerDAO;
import com.servlet.tiasm.repository.UserDAO;
import com.servlet.tiasm.utils.PasswordUtil;
import java.util.List;

public class CustomerService implements ICustomerService {
    private final CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    @Override
    public void display() {
        List<Customer> customers = customerDAO.getAll();
        for (Customer customer : customers) {
            System.out.println(customer);
        }
    }

    @Override
    public void add(Customer customer) {
        customerDAO.create(customer);
        System.out.println("Customer added successfully.");
    }

    @Override
    public void update(Customer customer) {
        customerDAO.update(customer);
        System.out.println("Customer updated successfully.");
    }

    @Override
    public Customer findById(int id) {
        try {
            if(customerDAO.read(id) == null) System.out.println("Loi do ko co ng dung");
            return customerDAO.read(id);
        } catch (NumberFormatException e) {
            System.err.println("Invalid customer ID format.");
            return null;
        }
    }

    @Override
    public void delete(Customer customer) {
        customerDAO.delete(customer.getCusId());
        System.out.println("Customer deleted successfully.");
    }

    @Override
    public void save() {
        System.out.println("Save function not required as changes are committed instantly.");
    }
        public boolean changePassword(String email, String currentPassword, String newPassword) {
        UserDAO userDAO = new UserDAO();
        User user = userDAO.read(email);
    String storedHashedPassword = user.getPasswordHash(); // Lấy mật khẩu đã băm từ DB
    
    if (storedHashedPassword == null) {
        System.out.println("User not found.");
        return false;
    }

    // So sánh mật khẩu đã nhập sau khi băm với mật khẩu đã lưu
    if (!storedHashedPassword.equals(PasswordUtil.hashPassword(currentPassword))) {
        System.out.println("Current password is incorrect.");
        return false;
    }

    // Cập nhật mật khẩu mới (băm trước khi lưu)
    String hashedNewPassword = PasswordUtil.hashPassword(newPassword);
    user.setPasswordHash(hashedNewPassword);
    
    userDAO.update(user);
    System.out.println("Password updated successfully.");
    return true;
}
}
