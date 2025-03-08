/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.tiasm.repository;

/**
 *
 * @author macos
 */
import com.servlet.tiasm.model.Hotel;
import java.util.List;

public interface IHotelDAO extends IDAO<Hotel>{

    // Thêm mới một khách sạn
    void create(Hotel hotel);

    // Lấy thông tin khách sạn theo ID
    Hotel read(int id);

    // Cập nhật thông tin khách sạn
    void update(Hotel hotel);

    // Xóa khách sạn theo ID
    void delete(int id);

    // Lấy danh sách tất cả các khách sạn
    List<Hotel> getAll();

    // Tìm kiếm khách sạn theo tên hoặc loại
    List<Hotel> searchByNameOrType(String searchTerm);
}

