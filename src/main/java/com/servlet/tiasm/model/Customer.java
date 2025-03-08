
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

    public Customer(int  cusId, String cusName, LocalDate cusDoB, String cusGender,
                    String cusPhoneNumber, String cusEmail) {
        this.cusId = cusId;
        this.cusName = cusName;
        this.cusDoB = cusDoB;
        this.cusGender = cusGender;
        this.cusPhoneNumber = cusPhoneNumber;
        this.cusEmail = cusEmail;
    }


    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }



    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public LocalDate getCusDoB() {
        return cusDoB;
    }

    public void setCusDoB(LocalDate cusDoB) {
        this.cusDoB = cusDoB;
    }

    public String getCusGender() {
        return cusGender;
    }

    public void setCusGender(String cusGender) {
        this.cusGender = cusGender;
    }

    public String getCusPhoneNumber() {
        return cusPhoneNumber;
    }

    public void setCusPhoneNumber(String cusPhoneNumber) {
        this.cusPhoneNumber = cusPhoneNumber;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }



    @Override
    public String toString() {
        return "Customer{" + ", cusId=" + cusId + ", cusName=" + cusName + ", cusDoB=" + cusDoB + ", cusGender=" + cusGender + ", cusPhoneNumber=" + cusPhoneNumber + ", cusEmail=" + cusEmail +'}';
    }
}

    
   

   