package com.servlet.tiasm.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class BookingEntry {
    private BaseModel service;
    private Date bookingStartDate;
    private Date bookingEndDate;
    private LocalDateTime bookingTime;

    public BookingEntry(Restaurant service, LocalDateTime bookingTime) {
        this.service = service;
        this.bookingTime = bookingTime;
    }

    public BookingEntry(Destination service, LocalDateTime bookingTime) {
        this.service = service;
        this.bookingTime = bookingTime;
    }

    public BookingEntry(Hotel service, Date checkIn, Date checkOut) {
        this.service = service;
        this.bookingStartDate = checkIn;
        this.bookingEndDate = checkOut;
    }

    public BaseModel getService() {
        return service;
    }

    public Date getBookingStartDate() {
        return bookingStartDate;
    }

    public Date getBookingEndDate() {
        return bookingEndDate;
    }

    public LocalDateTime getBookingTime() {
        return bookingTime;
    }

    public Map<Destination, LocalDateTime> getTourist() {
        Map<Destination, LocalDateTime> desMap = new HashMap<>();
        desMap.put((Destination) service, bookingTime);
        return desMap;
    }

    public Map<Restaurant, LocalDateTime> getRestaurant() {
        Map<Restaurant, LocalDateTime> resMap = new HashMap<>();
        resMap.put((Restaurant) service, bookingTime);
        return resMap;
    }

    public Map<Hotel, Map<Date, Date>> getHotel() {
        if (bookingStartDate == null || bookingEndDate == null) {
            return new HashMap<>();  // Avoid NullPointerException
        }
        Map<Hotel, Map<Date, Date>> hotelMap = new HashMap<>();
        Map<Date, Date> bookingDates = new HashMap<>();
        bookingDates.put(bookingStartDate, bookingEndDate);
        hotelMap.put((Hotel) service, bookingDates);
        return hotelMap;
    }
}
