
package com.servlet.tiasm.model;
/**
 *
 * @author Vinh
 * 03/03/2025
 */

public class Address{
    private String city;
    private String district;
    private String street;
    private String number;

    public Address(String city, String district, String street, String number) {
        this.city = city;
        this.district = district;
        this.street = street;
        this.number = number;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return  number + ", " +street+ ", " + district + ", " +  city ;
    }
    
}
