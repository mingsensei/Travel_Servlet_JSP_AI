package com.servlet.tiasm.model;

import java.math.BigDecimal;
import java.time.LocalTime;

/**
 * author vinh 3/3/2025
 */
public class Restaurant extends BaseModel {

    private String cuisineType;
    private LocalTime resOpeningHours;
    private LocalTime resClosingHours;

    public Restaurant(int travelId, String travelName, Address travelLocation, String travelDescription, int rating, BigDecimal pricePerPerson, String travelContactPhone, String travelContactEmail,String cuisineType, LocalTime resOpeningHours, LocalTime resClosingHours) {
        super(travelId, travelName, travelLocation, travelDescription, rating, pricePerPerson, travelContactPhone, travelContactEmail);
        this.cuisineType = cuisineType;
        this.resOpeningHours = resOpeningHours;
        this.resClosingHours = resClosingHours;
    }

    

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public LocalTime getResOpeningHours() {
        return resOpeningHours;
    }

    public void setResOpeningHours(LocalTime resOpeningHours) {
        this.resOpeningHours = resOpeningHours;
    }

    public LocalTime getResClosingHours() {
        return resClosingHours;
    }

    public void setResClosingHours(LocalTime resClosingHours) {
        this.resClosingHours = resClosingHours;
    }


    @Override
    public String toString() {
        return "Restaurant{" + "cuisineType=" + cuisineType + ", resOpeningHours=" + resOpeningHours + ", resClosingHours=" + resClosingHours + '}';
    }

}
