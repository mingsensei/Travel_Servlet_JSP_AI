package com.servlet.tiasm.model;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 *
 * @author Vinh 03/03/2025
 */
public class Hotel extends BaseModel {

    private int hotelAvailableRooms;
    private ArrayList<String> hotelService;
    private LocalTime hotelCheckInTime;
    private LocalTime hotelCheckOutTime;

    public Hotel( int travelId, String travelName, Address travelLocation, String travelDescription, int rating, BigDecimal pricePerPerson, String travelContactPhone, String travelContactEmail,int hotelAvailableRooms, ArrayList<String> hotelService, LocalTime hotelCheckInTime, LocalTime hotelCheckOutTime) {
        super(travelId, travelName, travelLocation, travelDescription, rating, pricePerPerson, travelContactPhone, travelContactEmail);
        this.hotelAvailableRooms = hotelAvailableRooms;
        this.hotelService = hotelService;
        this.hotelCheckInTime = hotelCheckInTime;
        this.hotelCheckOutTime = hotelCheckOutTime;
    }

    

    public int getHotelAvailableRooms() {
        return hotelAvailableRooms;
    }

    public void setHotelAvailableRooms(int hotelAvailableRooms) {
        this.hotelAvailableRooms = hotelAvailableRooms;
    }

    public ArrayList<String> getHotelService() {
        return hotelService;
    }

    public void setHotelService(ArrayList<String> hotelService) {
        this.hotelService = hotelService;
    }

    public LocalTime getHotelCheckInTime() {
        return hotelCheckInTime;
    }

    public void setHotelCheckInTime(LocalTime hotelCheckInTime) {
        this.hotelCheckInTime = hotelCheckInTime;
    }

    public LocalTime getHotelCheckOutTime() {
        return hotelCheckOutTime;
    }

    public void setHotelCheckOutTime(LocalTime hotelCheckOutTime) {
        this.hotelCheckOutTime = hotelCheckOutTime;
    }

    @Override
    public String toString() {
        return "Hotel{" + "hotelAvailableRooms=" + hotelAvailableRooms + ", hotelService=" + hotelService + ", hotelCheckInTime=" + hotelCheckInTime + ", hotelCheckOutTime=" + hotelCheckOutTime + '}';
    }

}
