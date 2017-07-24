/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.diit.sn.dao;

import java.util.Objects;

/**
 *
 * @author paul
 */
public class RegistrationInfo {
    private String memberId;
    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String countryName;
    private String emailId;
    private String contactNo;

    public RegistrationInfo(String firstName, String lastName, String dateOfBirth, String countryName, String emailId, String contactNo) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.countryName = countryName;
        this.emailId = emailId;
        this.contactNo = contactNo;
    }

    public RegistrationInfo() {
    }

    
    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    @Override
    public String toString() {
        return "RegistrationInfo{" + "memberId=" + memberId + ", firstName=" + firstName + ", lastName=" + lastName + ", dateOfBirth=" + dateOfBirth + ", countryName=" + countryName + ", emailId=" + emailId + ", contactNo=" + contactNo + '}';
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 79 * hash + Objects.hashCode(this.memberId);
        hash = 79 * hash + Objects.hashCode(this.firstName);
        hash = 79 * hash + Objects.hashCode(this.lastName);
        hash = 79 * hash + Objects.hashCode(this.dateOfBirth);
        hash = 79 * hash + Objects.hashCode(this.countryName);
        hash = 79 * hash + Objects.hashCode(this.emailId);
        hash = 79 * hash + Objects.hashCode(this.contactNo);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final RegistrationInfo other = (RegistrationInfo) obj;
        if (!Objects.equals(this.memberId, other.memberId)) {
            return false;
        }
        if (!Objects.equals(this.firstName, other.firstName)) {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) {
            return false;
        }
        if (!Objects.equals(this.dateOfBirth, other.dateOfBirth)) {
            return false;
        }
        if (!Objects.equals(this.countryName, other.countryName)) {
            return false;
        }
        if (!Objects.equals(this.emailId, other.emailId)) {
            return false;
        }
        if (!Objects.equals(this.contactNo, other.contactNo)) {
            return false;
        }
        return true;
    }
    
    
}
