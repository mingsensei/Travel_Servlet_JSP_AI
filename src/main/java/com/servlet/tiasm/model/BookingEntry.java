/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.tiasm.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 *
 * @author HP
 */
class BookingEntry {
    private BaseModel service;
    private Date bookingStartDate;
    private Date bookingEndDate;
    private LocalDateTime bookingTime;
    
    public BookingEntry(Restaurant service, LocalDateTime bookingTime){
        this.service = service;
        this.bookingTime = bookingTime;
    }
    
    public BookingEntry(Destination service, LocalDateTime bookingTime){
        this.service =  service;
        this.bookingTime = bookingTime;
    }
    
    public BookingEntry(Hotel service, Date checkIn, Date checkOut){
        this.service =  service;
        
    }
    
    public Map<Destination,LocalDateTime> getTourist(){
        Map<Destination,LocalDateTime> DesMap = null;
        DesMap.put((Destination) service, bookingTime);
        return DesMap;
    }
    
    public Map<Restaurant,LocalDateTime> getRestaurant(){
        Map<Restaurant,LocalDateTime> ResMap = null;
        ResMap.put((Restaurant) service, bookingTime);
        return ResMap;
    }
    
    public Map<Hotel,Map<Date,Date>> getHotel(){
        Map<Hotel,Map<Date,Date>> hotelMap = new HashMap<>();
        Map<Date, Date> bookingDates = new HashMap<>();
        bookingDates.put(bookingStartDate, bookingEndDate);
        hotelMap.put((Hotel) service, bookingDates);
        return hotelMap;
    }
}