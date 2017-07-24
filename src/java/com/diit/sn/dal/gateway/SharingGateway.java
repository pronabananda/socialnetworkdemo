/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diit.sn.dal.gateway;

import com.diit.sn.dal.dbconnector.ConnectionHandler;
import com.diit.sn.dao.RegistrationInfo;
import com.diit.sn.dao.WallItem;
import java.io.File;
import java.io.FileInputStream;
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
public class SharingGateway {

    private Connection conn;
    Statement statement;
    ResultSet rslSet;

    public int saveStatus(int userId, String status) {

        System.out.println("Saving Status of regId:" + userId);
        String insertStatus = "insert into user_status(id, status,time) values(?,?,now())";

        int returnFlag = 0;

        try {
            conn = ConnectionHandler.connect();
            //       conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(insertStatus);
            pstmt.setInt(1, userId);
            pstmt.setString(2, status);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.toString());
            returnFlag = 9999999;
        } finally {

            return returnFlag;
        }
    }

    public List<WallItem> getWalls(String userId) {
        conn = ConnectionHandler.connect();
        List<WallItem> listWalls = new ArrayList<WallItem>();
         WallItem wallItem;
        try {
            statement = conn.createStatement();

            rslSet = statement.executeQuery("Select us.sl,us.Id,concat(u.lastname,' ',u.firstname) name,us.status FROM user_status us,users u where us.id="+userId+" and us.id=u.id order by time desc"); // conn.commit();
            while (rslSet.next()) {
                wallItem = new WallItem();
                System.out.println("Inside Retrieving ResultSet");
                wallItem.setStatusid(rslSet.getInt("sl"));
                wallItem.setUserId(rslSet.getInt("id"));
                wallItem.setStatus(rslSet.getString("status"));
                wallItem.setUserName(rslSet.getString("name"));
                listWalls.add(wallItem);
              
            }
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
            System.out.println("After retrieving Status:"+listWalls.size() );
            return listWalls;
        }
    }
}
