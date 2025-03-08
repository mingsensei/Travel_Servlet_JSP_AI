/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.tiasm.repository;

import java.util.List;

/**
 *
 * @author macos
 */
public interface IDAO<T> {

    // Thêm một đối tượng mới vào cơ sở dữ liệu
    void create(T entity);

    // Lấy đối tượng từ cơ sở dữ liệu bằng ID
    T read(int id);

    // Cập nhật thông tin của một đối tượng trong cơ sở dữ liệu
    void update(T entity);

    // Xóa một đối tượng khỏi cơ sở dữ liệu
    void delete(int id);

    // Lấy tất cả đối tượng từ cơ sở dữ liệu
    List<T> getAll();
}
