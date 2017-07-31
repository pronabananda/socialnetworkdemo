/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diit.sn.dal.gateway;

import com.diit.sn.dal.dbconnector.ConnectionHandler;
import com.diit.sn.dao.ImageInfo;
import com.diit.sn.dao.RegistrationInfo;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author paul
 */
public class UserGateway {

    private Connection conn;
    Statement statement;
    ResultSet rslSet;

    String applicationID = "";

    public String getPassword(String userId) {
        conn = ConnectionHandler.connect();
        String password="";



        try {
        statement = conn.createStatement();
        
        rslSet = statement.executeQuery("Select password FROM users where email='" + userId + "'"); // conn.commit();
            if (rslSet.next()) {
                System.out.println("Inside Retrieving ResultSet");
                password=(String)rslSet.getString("password");
                System.out.println("Retrieved Password: "+password);
            }
                conn.close();
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
        return password;
        }
    }
    
        public int addFriend(int userId, int friendId) {

        System.out.println("Adding Friend for:" + userId+" with "+friendId);
        String insertStatus = "insert into friend_linkage(id, friend_id,time,status) values(?,?,now(),0)";

        int returnFlag = 0;

        try {
            conn = ConnectionHandler.connect();
            //       conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(insertStatus);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, friendId);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.toString());
            returnFlag = 9999999;
        } finally {

            return returnFlag;
        }
    }
    
    
    
    public int getRegId(String userId) {
        conn = ConnectionHandler.connect();
        int regId=0;

        try {
        statement = conn.createStatement();
        
        rslSet = statement.executeQuery("Select id FROM users where email='" + userId + "'"); // conn.commit();
            if (rslSet.next()) {
                System.out.println("Inside Retrieving ResultSet");
                regId=rslSet.getInt("id");
                System.out.println("Retrieved userID: "+userId);
            }
                conn.close();
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
        return regId;
        }
    }
    
    public RegistrationInfo getProfileInfo(String userId) {
        conn = ConnectionHandler.connect();
        RegistrationInfo registrationInfo= new RegistrationInfo();

        try {
        statement = conn.createStatement();
        
        rslSet = statement.executeQuery("Select * FROM users where email='" + userId + "'"); // conn.commit();
            if (rslSet.next()) {
                System.out.println("Inside Retrieving ResultSet");
                registrationInfo.setFirstName(rslSet.getString("firstname"));
                registrationInfo.setLastName(rslSet.getString("lastname"));
                registrationInfo.setCountryName(rslSet.getString("country"));
                registrationInfo.setContactNo(rslSet.getString("contact"));
                registrationInfo.setEmailId(rslSet.getString("email"));
                registrationInfo.setMemberId(rslSet.getString("id"));
                System.out.println("Retrieved userID: "+userId);
            }
                conn.close();
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
        return registrationInfo;
        }
    }

        public List<RegistrationInfo> getProfileList(String userId) {
        conn = ConnectionHandler.connect();
        RegistrationInfo registrationInfo= new RegistrationInfo();
        List<RegistrationInfo> listRegisteredUsers= new ArrayList<RegistrationInfo>();
        try {
        statement = conn.createStatement();
         
        rslSet = statement.executeQuery("Select * FROM users where email like '%" + userId + "%'"); // conn.commit();
            if (rslSet.next()) {
                System.out.println("Inside Retrieving ResultSet");
                registrationInfo.setFirstName(rslSet.getString("firstname"));
                registrationInfo.setLastName(rslSet.getString("lastname"));
                registrationInfo.setCountryName(rslSet.getString("country"));
                registrationInfo.setContactNo(rslSet.getString("contact"));
                registrationInfo.setEmailId(rslSet.getString("email"));
                registrationInfo.setMemberId(rslSet.getString("id"));
                System.out.println("Retrieved userID: "+userId);
                listRegisteredUsers.add(registrationInfo);
            }
                conn.close();
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
        return listRegisteredUsers;
        }
    }
}
