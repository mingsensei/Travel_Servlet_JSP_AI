package com.servlet.tiasm.repository;

import com.servlet.tiasm.model.User;

import com.servlet.tiasm.model.User;
import java.util.List;

public interface IUserDAO {
    void create(User user); // Thêm user mới
    User read(String email); // Tìm user theo email
    void update(User user); // Cập nhật thông tin user
    void delete(String email); // Xóa user theo email
    List<User> getAll(); // Lấy danh sách tất cả user
}

