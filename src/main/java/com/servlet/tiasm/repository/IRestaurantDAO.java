/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.servlet.tiasm.repository;

/**
 *
 * @author macos
 */
import com.servlet.tiasm.model.Restaurant;
import java.util.List;

public interface IRestaurantDAO extends IDAO<Restaurant> {

    // Thêm mới một nhà hàng
    void create(Restaurant restaurant);

    // Lấy thông tin nhà hàng theo ID
    Restaurant read(int id);

    // Cập nhật thông tin nhà hàng
    void update(Restaurant restaurant);

    // Xóa nhà hàng theo ID
    void delete(int id);

    // Lấy danh sách tất cả các nhà hàng
    List<Restaurant> getAll();

    // Tìm kiếm nhà hàng theo tên hoặc loại món ăn
    List<Restaurant> searchByNameOrCuisine(String searchTerm);
}

