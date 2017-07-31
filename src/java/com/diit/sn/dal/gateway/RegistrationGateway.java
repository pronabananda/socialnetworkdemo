/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diit.sn.dal.gateway;

import com.diit.sn.dal.dbconnector.ConnectionHandler;
import com.diit.sn.dao.ImageInfo;
import com.diit.sn.dao.RegistrationInfo;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paul.pronab
 */
public class RegistrationGateway {

    private Connection conn;
    private CallableStatement cs;

    String applicationID = "";

    public int saveApplication(RegistrationInfo registrationInfo) {
        String ROPE_FLAG = "RED";

        String errorPosition = "PINFOERR";
        int registrationId = 0;
        System.out.println("Save Application :registrationInfo:"+registrationInfo.toString());
//        System.out.println("imageInfo:" + imageInfo.toString());
//
//        File fBlob = new File(imageInfo.getImagePath() + "/" + imageInfo.getAppPicName());
//        FileInputStream is;
//        try {
//            is = new FileInputStream(fBlob);
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(RegistrationGateway.class.getName()).log(Level.SEVERE, null, ex);
//        }
//statement.setBinaryStream(1, is, (int) fBlob.length());
//statement.execute();

        try {
            conn = ConnectionHandler.connect();
            conn.setAutoCommit(false);
            cs = conn.prepareCall("{call SocialNetworkDemo.user_reg(?,?,?,?,?,?,?)}");    
            cs.setString(1, registrationInfo.getFirstName());
            cs.setString(2, registrationInfo.getLastName());
            //  cs.setString(3, registrationInfo.getDateOfBirth());
            cs.setString(3, registrationInfo.getEmailId());
            cs.setString(4, registrationInfo.getContactNo());
            cs.setString(5, registrationInfo.getCountryName());
            cs.setString(6, registrationInfo.getPassword());
            cs.registerOutParameter(7, 12);
            System.out.println("PersonalInfo assinged to procedure call successfully.");
            cs.execute();
            registrationId = Integer.parseInt(cs.getString(7));
    
            System.out.println("PROCEDURE PersonalInfo_Save executed successfully.");
            System.out.println((new StringBuilder()).append("SerialNo has been generated: ").append(applicationID).toString());

            System.out.println(registrationId);

            ROPE_FLAG = "GREEN";
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        } finally {

            return registrationId;
        }

    }

    public int savePhoto(ImageInfo imageInfo, int regId) {
        System.out.println("Inside savePhoto to save photo of regId:"+regId);
        String updatePhoto = "UPDATE users "
                + "SET profilephoto = ? "
                + "WHERE id=?";
        int returnFlag=0;

        try {
            conn = ConnectionHandler.connect();
            //       conn.setAutoCommit(false);
            System.out.println("Image Path:" + imageInfo.getImagePath() + "/" + imageInfo.getAppPicName());
            File file = new File(imageInfo.getImagePath() + "/" + imageInfo.getAppPicName());
            FileInputStream input = new FileInputStream(file);
            PreparedStatement pstmt = conn.prepareStatement(updatePhoto);
            pstmt.setBinaryStream(1, input);
            pstmt.setInt(2, regId);
            pstmt.executeUpdate();
            
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            returnFlag=9999999;
        } finally {

            return returnFlag;
        }

    }
}
