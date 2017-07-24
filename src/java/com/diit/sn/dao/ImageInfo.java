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
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.image.BufferedImage;
import java.io.FileInputStream;


public class ImageInfo{

    private String imagePath;
    private String serialNo;
    private BufferedImage appPic;
    private String appPicName;
    private FileInputStream binaryPic;
  

    /**
     * @return the imagePath
     */
    public String getImagePath() {
        return imagePath;
    }

    /**
     * @param imagePath the imagePath to set
     */
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    /**
     * @return the serialNo
     */
    public String getSerialNo() {
        return serialNo;
    }

    /**
     * @param serialNo the serialNo to set
     */
    public void setSerialNo(String serialNo) {
        this.serialNo = serialNo;
    }

    /**
     * @return the appPic
     */
    public BufferedImage getAppPic() {
        return appPic;
    }

    /**
     * @param appPic the appPic to set
     */
    public void setAppPic(BufferedImage appPic) {
        this.appPic = appPic;
    }

  
    /**
     * @return the appPicName
     */
    public String getAppPicName() {
        return appPicName;
    }

    /**
     * @param appPicName the appPicName to set
     */
    public void setAppPicName(String appPicName) {
        this.appPicName = appPicName;
    }

    /**
     * @return the binaryPic
     */
    public FileInputStream getBinaryPic() {
        return binaryPic;
    }

    /**
     * @param binaryPic the binaryPic to set
     */
    public void setBinaryPic(FileInputStream binaryPic) {
        this.binaryPic = binaryPic;
    }

    @Override
    public String toString() {
        return "ImageInfo{" + "imagePath=" + imagePath + ", serialNo=" + serialNo + ", appPic=" + appPic + ", appPicName=" + appPicName + ", binaryPic=" + binaryPic + '}';
    }

    
}
