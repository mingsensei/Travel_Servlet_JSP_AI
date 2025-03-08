package com.servlet.tiasm.service;

/*
*@author Hồ Trun Hiếu
*@date 3/3/2025 
*/

public interface Service<T> {
    void display();
    
    void add(T entity);
    
    void update(T entity);
    
    T findById(String id);
    
    void delete(T Entity);
    
    void save();
    
}