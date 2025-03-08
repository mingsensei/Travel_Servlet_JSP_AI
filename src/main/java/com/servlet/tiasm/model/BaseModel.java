
package com.servlet.tiasm.model;

import java.math.BigDecimal;

public class BaseModel {

    /**
     *
     * @author Vinh 03/03/2025
     */

    private int travelId;
    private String travelName;
    private Address travelLocation;
    private String travelDescription;
    private int rating;
    private BigDecimal pricePerPerson;
    private String travelContactPhone;
    private String travelContactEmail;

    public BaseModel(int travelId, String travelName, Address travelLocation, String travelDescription, int rating, BigDecimal pricePerPerson, String travelContactPhone, String travelContactEmail) {
        this.travelId = travelId;
        this.travelName = travelName;
        this.travelLocation = travelLocation;
        this.travelDescription = travelDescription;
        this.rating = rating;
        this.pricePerPerson = pricePerPerson;
        this.travelContactPhone = travelContactPhone;
        this.travelContactEmail = travelContactEmail;
    }

    public int getTravelId() {
        return travelId;
    }

    public void setTravelId(int travelId) {
        this.travelId = travelId;
    }

    public String getTravelName() {
        return travelName;
    }

    public void setTravelName(String travelName) {
        this.travelName = travelName;
    }

    public Address getTravelLocation() {
        return travelLocation;
    }

    public void setTravelLocation(Address travelLocation) {
        this.travelLocation = travelLocation;
    }

    public String getTravelDescription() {
        return travelDescription;
    }

    public void setTravelDescription(String travelDescription) {
        this.travelDescription = travelDescription;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public BigDecimal getPricePerPerson() {
        return pricePerPerson;
    }

    public void setPricePerPerson(BigDecimal pricePerPerson) {
        this.pricePerPerson = pricePerPerson;
    }

    public String getTravelContactPhone() {
        return travelContactPhone;
    }

    public void setTravelContactPhone(String travelContactPhone) {
        this.travelContactPhone = travelContactPhone;
    }

    public String getTravelContactEmail() {
        return travelContactEmail;
    }

    public void setTravelContactEmail(String travelContactEmail) {
        this.travelContactEmail = travelContactEmail;
    }

    

}


