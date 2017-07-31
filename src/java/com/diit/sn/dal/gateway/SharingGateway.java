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
        String insertStatus = "insert into user_status(id, status,time,like_no) values(?,?,now(),0)";

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

    public List<WallItem> getWalls(String userId, String type) {
        System.out.println("retrieving status of :"+userId);
        conn = ConnectionHandler.connect();
        List<WallItem> listWalls = new ArrayList<WallItem>();
         WallItem wallItem;
        try {
            statement = conn.createStatement();

  if(type.equals("OWNONLY")){
            rslSet = statement.executeQuery("Select us.sl,us.Id,concat(u.lastname,' ',u.firstname) name,us.status, us.like_no,us.dislike_no FROM user_status us,users u where us.id="+userId+" and us.id=u.id order by time desc"); // conn.commit();
  }else{
            rslSet = statement.executeQuery("Select us.sl,us.Id,concat(u.lastname,' ',u.firstname) name,us.status, \n" +
"us.like_no,us.dislike_no FROM user_status us,users u\n" +
" where (us.id="+userId+" or us.id in (Select friend_id from friend_linkage where id="+userId+" )) and us.id=u.id order by time desc");
  }      
            while (rslSet.next()) {
                wallItem = new WallItem();
                System.out.println("Inside Retrieving ResultSet");
                wallItem.setStatusid(rslSet.getInt("sl"));
                wallItem.setUserId(rslSet.getInt("id"));
                wallItem.setStatus(rslSet.getString("status"));
                wallItem.setUserName(rslSet.getString("name"));
                wallItem.setNoOfLike(rslSet.getInt("like_no"));
                wallItem.setNoOfDislike(rslSet.getInt("dislike_no"));
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
    
    public int addLike(String uid, String sid){
    conn = ConnectionHandler.connect();
    int returnVal=9;
     try {
            statement = conn.createStatement();
            returnVal = statement.executeUpdate("update user_status set like_no=like_no+1 where sl="+sid); // conn.commit();
            conn.close();
            returnVal=0;
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
            
            return returnVal;
        }
    }
    
       public int addDisLike(String uid, String sid){
    conn = ConnectionHandler.connect();
    int returnVal=9;
     try {
            statement = conn.createStatement();
            returnVal = statement.executeUpdate("update user_status set dislike_no=dislike_no+1 where sl="+sid); // conn.commit();
            conn.close();
            returnVal=0;
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
            
            return returnVal;
        }
    }
}
