
package com.servlet.tiasm.model;

import java.time.LocalDate;



/**
 *
 * @author Vinh
 * 03/03/2025
 */
public class Customer  {
    private int  cusId;
    private String cusName;
    private LocalDate cusDoB;
    private String cusGender;
    private String cusPhoneNumber;
    private String cusEmail;
    private int userID;

    public Customer(int cusId, String cusName, LocalDate cusDoB, String cusGender, String cusPhoneNumber, String cusEmail, int userID) {
        this.cusId = cusId;
        this.cusName = cusName;
        this.cusDoB = cusDoB;
        this.cusGender = cusGender;
        this.cusPhoneNumber = cusPhoneNumber;
        this.cusEmail = cusEmail;
        this.userID = userID;
    }

    public int getCusId() {
        return cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public LocalDate getCusDoB() {
        return cusDoB;
    }

    public String getCusGender() {
        return cusGender;
    }

    public String getCusPhoneNumber() {
        return cusPhoneNumber;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public int getUserID() {
        return userID;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public void setCusDoB(LocalDate cusDoB) {
        this.cusDoB = cusDoB;
    }

    public void setCusGender(String cusGender) {
        this.cusGender = cusGender;
    }

    public void setCusPhoneNumber(String cusPhoneNumber) {
        this.cusPhoneNumber = cusPhoneNumber;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "Customer{" + "cusId=" + cusId + ", cusName=" + cusName + ", cusDoB=" + cusDoB + ", cusGender=" + cusGender + ", cusPhoneNumber=" + cusPhoneNumber + ", cusEmail=" + cusEmail + ", userID=" + userID + '}';
    }

    
}

    
   

   