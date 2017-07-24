/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.diit.sn.servlet;

import com.diit.sn.dal.dbconnector.ConnectionHandler;
import com.diit.sn.dal.gateway.PhotoGateway;
import com.diit.sn.dao.ImageInfo;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paul
 */
public class PhotoServlet extends HttpServlet {
// final static PhotoGateway photoGateway = new PhotoGateway();


    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
             out.println("<html>");
             out.println("<head>");
             out.println("<title>Servlet certificateServlet</title>");  
             out.println("</head>");
             out.println("<body>");
             out.println("<h1>Servlet certificateServlet at " + request.getContextPath () + "</h1>");
             out.println("</body>");
             out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        List<ImageInfo> appImageInfoList;
        ImageInfo appImage;
        int slNo;
        Connection conn;
        Statement statement;

        HttpSession session = request.getSession();;



        ByteArrayOutputStream localBuffer = new ByteArrayOutputStream();
        BufferedOutputStream servletOutput = new BufferedOutputStream(response.getOutputStream());
        String regNo = request.getParameter("regNo");
        
        System.out.println("Retrieving photo of " + regNo);
        
        //String pOc = request.getParameter("pOc");
        //slNo = Integer.parseInt(pOc);



        try {
            /**
             * Refactor to a Data Access Object *
             */
            ResultSet rslSet;
            System.out.println("Before DB Connection");
            conn = ConnectionHandler.connect();
                 System.out.println("After DB Connection");

            statement = conn.createStatement();
              System.out.println("After createStatement");
            
            rslSet = statement.executeQuery("Select profilephoto FROM users where id='" + regNo + "'"); // conn.commit();



            try {
                
                if (rslSet.next()) {
                    System.out.println("Inside Retrieving ResultSet");
                    BufferedInputStream imageData = new BufferedInputStream(rslSet.getBinaryStream("profilephoto"));
                    
                    int len = 0;
                    byte[] buffer = new byte[1024 * 1024];
                    while ((len = imageData.read(buffer)) >= 0) {
                        localBuffer.write(buffer, 0, len);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e.toString());
            } finally {
                conn.close();
            }

            /**
             * Code needed in the Servlet *
             */
            byte[] imageBytes = localBuffer.toByteArray();
            response.setContentType("image/jpeg");
            response.setContentLength(imageBytes.length);
            //   response.setHeader("Content-disposition", "inline; filename=\"" + getImageName(request) + "\"");


            servletOutput.write(imageBytes);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            servletOutput.flush();
            servletOutput.close();
            localBuffer.close();
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
