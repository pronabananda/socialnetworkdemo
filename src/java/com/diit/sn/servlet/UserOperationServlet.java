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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author paul
 */
public class UserOperationServlet extends HttpServlet {

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
            out.println("<title>Servlet UserOperationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserOperationServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
         String path = request.getContextPath();
         UserGateway userGateway= new UserGateway();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        String serialNo = null;
        String url = "";
        SharingGateway sharingGateway= new SharingGateway();
         HttpSession userSession = request.getSession();
        if(request.getParameter("op").equals("Like")){
            sharingGateway.addLike(request.getParameter("uid"),request.getParameter("sid"));
            System.out.println("addling like for uid:"+request.getParameter("uid")+"sid: "+request.getParameter("sid"));
            }
       
        int feedback=9;
        if(request.getParameter("op").equals("addFriend")){
        feedback=userGateway.addFriend(Integer.parseInt(userSession.getAttribute("regId").toString()), Integer.parseInt(request.getParameter("frndId")));
        if(feedback==0){
        userSession.setAttribute("globalMessage", "Friend Added Successfully");
        }
        }
        
            //    userGateway.getRegId(request.getParameter("loginId").toString());

        String regId = (String) request.getParameter("uid");

        userSession.setAttribute("walls", sharingGateway.getWalls(regId));

//            url = basePath + "/message.jsp?messageToDisplay=You have been registered successfully.";
//            response.sendRedirect(url);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
        
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
        HttpSession userSession = request.getSession();
        UserGateway userGateway = new UserGateway();
        SharingGateway sharingGateway= new SharingGateway();
        List<RegistrationInfo> listReistrationInfo= new ArrayList<RegistrationInfo>();
        System.out.println("inside doPost of UserOperation Servlet");
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    //    userGateway.getRegId(request.getParameter("loginId").toString());

        String regId = (String) userSession.getAttribute("regId");
        
        if(request.getParameter("btnSubmitStatus")!=null){
             System.out.print("Inside New Status Posting");
        String status=(String)request.getParameter("txtStatus");
        System.out.println(regId+ " :"+status);
      //  if(regId !=null)
        sharingGateway.saveStatus(Integer.parseInt(regId),status);
        }
        userSession.setAttribute("walls", sharingGateway.getWalls(regId));
        
        if(request.getParameter("btnSeachProfile")!=null)
        {
         System.out.print("Inside Search Friend");
        String searchValue= request.getParameter("searchValue");

        listReistrationInfo=userGateway.getProfileList(searchValue);
        System.out.println("Profile List Size: "+listReistrationInfo.size());
        userSession.setAttribute("listReistrationInfo", listReistrationInfo);
        }
//            url = basePath + "/message.jsp?messageToDisplay=You have been registered successfully.";
//            response.sendRedirect(url);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);

//        System.out.println("Not Autheticated");
//                   url = basePath + "/message.jsp?messageToDisplay=You have been registered successfully.";
//           response.sendRedirect(url);
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
