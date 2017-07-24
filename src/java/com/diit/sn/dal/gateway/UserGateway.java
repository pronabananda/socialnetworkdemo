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

}
