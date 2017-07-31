/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.diit.sn.servlet;

import com.diit.sn.dal.gateway.SharingGateway;
import com.diit.sn.dal.gateway.UserGateway;
import com.diit.sn.dao.RegistrationInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paul
 */
public class UserProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserProfile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        UserGateway userGateway = new UserGateway();
        SharingGateway sharingGateway= new SharingGateway();
        System.out.println("inside UserProfile doGet");
        int regID = userGateway.getRegId(request.getParameter("email"));
        RegistrationInfo registrationInfo= new RegistrationInfo();
        registrationInfo=userGateway.getProfileInfo(request.getParameter("email"));
        session.setAttribute("walls", sharingGateway.getWalls(regID+"","OWNONLY"));
        
       // session.setAttribute("regId", regID + "");
        session.setAttribute("registrationInfo", registrationInfo);

//            url = basePath + "/message.jsp?messageToDisplay=You have been registered successfully.";
//            response.sendRedirect(url);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
        dispatcher.forward(request, response);
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
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
