/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.servlet.tiasm.repository;

/**
 *
 * @author macos
 */
import com.servlet.tiasm.model.Destination;
import java.util.List;

public interface IDestinationDAO extends IDAO<Destination>{

    // Thêm mới một điểm đến
    void create(Destination destination);

    // Lấy thông tin điểm đến theo ID
    Destination read(int id);

    // Cập nhật thông tin điểm đến
    void update(Destination destination);

    // Xóa điểm đến theo ID
    void delete(int id);

    // Lấy danh sách tất cả các điểm đến
    List<Destination> getAll();

    // Tìm kiếm điểm đến theo tên hoặc loại
    List<Destination> searchByNameOrType(String searchTerm);
}

