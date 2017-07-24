/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.diit.sn.dao;

/**
 *
 * @author paul
 */
public class WallItem {
    private int statusid;
    private String userName;
    private int userId;
    private String status;
    private int noOfLike;

    public int getStatusid() {
        return statusid;
    }

    public void setStatusid(int statusid) {
        this.statusid = statusid;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getNoOfLike() {
        return noOfLike;
    }

    public void setNoOfLike(int noOfLike) {
        this.noOfLike = noOfLike;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    
}
