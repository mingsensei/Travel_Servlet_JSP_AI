package com.servlet.tiasm.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class BookingEntry {
    private BaseModel service;
    private LocalDateTime bookingStartDate;
    private LocalDateTime bookingEndDate;
    private LocalDateTime bookingTime;

    public BookingEntry(Restaurant service, LocalDateTime bookingTime) {
        this.service = service;
        this.bookingTime = bookingTime;
    }

    public BookingEntry(Destination service, LocalDateTime bookingTime) {
        this.service = service;
        this.bookingTime = bookingTime;
    }

    public BookingEntry(Hotel service, LocalDateTime checkIn, LocalDateTime  checkOut) {
        this.service = service;
        this.bookingStartDate = checkIn;
        this.bookingEndDate = checkOut;
    }

    public BookingEntry( BaseModel service, LocalDateTime bookingStartDate, LocalDateTime bookingEndDate, LocalDateTime bookingTime) {
        this.service = service;
        this.bookingStartDate = bookingStartDate;
        this.bookingEndDate = bookingEndDate;
        this.bookingTime = bookingTime;
    }

    public BaseModel getService() {
        return service;
    }

    public LocalDateTime getBookingStartDate() {
        return bookingStartDate;
    }

    public LocalDateTime getBookingEndDate() {
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

    public Map<Hotel, Map<LocalDateTime, LocalDateTime>> getHotel() {
        if (bookingStartDate == null || bookingEndDate == null) {
            return new HashMap<>();  // Avoid NullPointerException
        }
        Map<Hotel, Map<LocalDateTime, LocalDateTime>> hotelMap = new HashMap<>();
        Map<LocalDateTime, LocalDateTime> bookingDates = new HashMap<>();
        bookingDates.put(bookingStartDate, bookingEndDate);
        hotelMap.put((Hotel) service, bookingDates);
        return hotelMap;
    }
    public String getServiceType() {
    if (service instanceof Restaurant) {
        return "restaurant";
    } else if (service instanceof Destination) {
        return "destination";
    } else if (service instanceof Hotel) {
        return "hotel";
    }
    return "unknown";  // Default case if no match is found
}
}
