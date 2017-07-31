/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diit.sn.dal.dbconnector;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


/**
 * Created on : Apr 21, 2012, 2:43:42 PM
 *
 * @author Paul Pronabananda Email :
 * pronab@gmail.com||paul.pronabananda@gmail.com Copyright: Dutch-Bangla Bank;
 * All rights reserved.
 */
public class ConnectionHandler {

    private static final String PROP_FILE = "dbinfo.properties";
    private static java.sql.Connection conn = null;
    private static final String url = "jdbc:mysql://";
    private static final String portNumber = "3306";
    private static final String selectMethod = "cursor";
    private static final String user = "root";
//    private static final String serverName = "10.76.12.101";
    private static final String serverName = "localhost";
    private static final String password = "123456";
//    private static final String serverName = "localhost";
//    private static final String password = "mukunda";
    private static final String databaseName = "SocialNetworkDemo";
//    private static final String password = "root";
//    private static final String databaseName = "@dm!nDb";


    // Constructor
    public ConnectionHandler() {
    }

    private static String getConnectionUrl() {
        return url + serverName + ":" + portNumber + "/" + databaseName;

    }

    public static java.sql.Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            System.out.println(getConnectionUrl());
            conn = DriverManager.getConnection(getConnectionUrl(), user, password);


        } catch (Exception ex) {
            System.out.println(ex);
        }
        return conn;
    }

    public void displayDbProperties() {
        java.sql.DatabaseMetaData dm = null;
        java.sql.ResultSet rs = null;
        try {
            conn = connect();
            if (conn != null) {
                dm = conn.getMetaData();
                System.out.println("Driver Information");
                System.out.println("\tDriver Name: " + dm.getDriverName());
                System.out.println("\tDriver Version: " + dm.getDriverVersion());
                System.out.println("\nDatabase Information ");
                System.out.println("\tDatabase Name: " + dm.getDatabaseProductName());
                System.out.println("\tDatabase Version: " + dm.getDatabaseProductVersion());
                System.out.println("Avalilable Catalogs ");
                rs = dm.getCatalogs();
                while (rs.next()) {
                    System.out.println("\tcatalog: " + rs.getString(1));
                }
                rs.close();
                rs = null;
                closeConnection();
            } else {
                System.out.println("Error: No active Connection");
            }
        } catch (Exception e) {
        }
        dm = null;
    }

    public static void closeConnection() {
        try {
            if (conn != null) {
                conn.close();
            }
            conn = null;
        } catch (Exception e) {
        }
    }

    public void readproperties() {
        try {
            Properties p = new Properties();
            p.load(this.getClass().getClassLoader().getResourceAsStream("dbinfo.properties"));

            System.out.println(p.getProperty("Directory"));
            System.out.println(p.getProperty("NumberOfFiles"));
            System.out.println(p.getProperty("Extension"));
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) throws Exception {
        ConnectionHandler myDbTest = new ConnectionHandler();
         myDbTest.displayDbProperties();
       // myDbTest.readproperties();
    }
}
