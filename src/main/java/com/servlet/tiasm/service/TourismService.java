package com.servlet.tiasm.service;

import com.servlet.tiasm.model.Destination;
import com.servlet.tiasm.model.Hotel;
import com.servlet.tiasm.model.Restaurant;
import com.servlet.tiasm.repository.DestinationDAO;
import com.servlet.tiasm.repository.HotelDAO;
import com.servlet.tiasm.repository.RestaurantDAO;

import java.util.List;

public class TourismService {

    // Tạo các đối tượng DAO
    private DestinationDAO destinationDAO = new DestinationDAO();
    private HotelDAO hotelDAO = new HotelDAO();
    private RestaurantDAO restaurantDAO = new RestaurantDAO();

    // Phương thức tạo mới đối tượng (create)
    public void add(Object entity) {
        if (entity instanceof Destination) {
            destinationDAO.create((Destination) entity);
            System.out.println("Đã thêm điểm đến: " + entity);
        } else if (entity instanceof Hotel) {
            hotelDAO.create((Hotel) entity);
            System.out.println("Đã thêm khách sạn: " + entity);
        } else if (entity instanceof Restaurant) {
            restaurantDAO.create((Restaurant) entity);
            System.out.println("Đã thêm nhà hàng: " + entity);
        } else {
            System.out.println("Loại đối tượng không hợp lệ.");
        }
    }

    // Phương thức cập nhật đối tượng
    public void update(Object entity) {
        if (entity instanceof Destination) {
            destinationDAO.update((Destination) entity);
            System.out.println("Đã cập nhật điểm đến: " + entity);
        } else if (entity instanceof Hotel) {
            hotelDAO.update((Hotel) entity);
            System.out.println("Đã cập nhật khách sạn: " + entity);
        } else if (entity instanceof Restaurant) {
            restaurantDAO.update((Restaurant) entity);
            System.out.println("Đã cập nhật nhà hàng: " + entity);
        } else {
            System.out.println("Loại đối tượng không hợp lệ.");
        }
    }

    // Phương thức xóa đối tượng theo ID
    public void delete(int id, Class<?> clazz) {
        if (clazz == Destination.class) {
            destinationDAO.delete(id);
            System.out.println("Đã xóa điểm đến với ID: " + id);
        } else if (clazz == Hotel.class) {
            hotelDAO.delete(id);
            System.out.println("Đã xóa khách sạn với ID: " + id);
        } else if (clazz == Restaurant.class) {
            restaurantDAO.delete(id);
            System.out.println("Đã xóa nhà hàng với ID: " + id);
        } else {
            System.out.println("Loại đối tượng không hợp lệ.");
        }
    }

    // Phương thức tìm kiếm theo ID
    public Object findById(int id, Class<?> clazz) {
        if (clazz == Destination.class) {
            return destinationDAO.read(id);
        } else if (clazz == Hotel.class) {
            return hotelDAO.read(id);
        } else if (clazz == Restaurant.class) {
            return restaurantDAO.read(id);
        } else {
            System.out.println("Không tìm thấy loại đối tượng.");
            return null;
        }
    }

    // Phương thức lấy tất cả các đối tượng
    public List<?> getAll(Class<?> clazz) {
        if (clazz == Destination.class) {
            return destinationDAO.getAll();
        } else if (clazz == Hotel.class) {
            return hotelDAO.getAll();
        } else if (clazz == Restaurant.class) {
            return restaurantDAO.getAll();
        } else {
            System.out.println("Không tìm thấy loại đối tượng.");
            return null;
        }
    }

    // Phương thức tìm kiếm theo tên hoặc loại
    public List<?> searchByNameOrType(String searchTerm, Class<?> clazz) {
        if (clazz == Destination.class) {
            return destinationDAO.searchByNameOrType(searchTerm);
        } else if (clazz == Hotel.class) {
            return hotelDAO.searchByNameOrType(searchTerm);
        } else if (clazz == Restaurant.class) {
            return restaurantDAO.searchByNameOrCuisine(searchTerm);
        } else {
            System.out.println("Không tìm thấy loại đối tượng.");
            return null;
        }
    }
}
