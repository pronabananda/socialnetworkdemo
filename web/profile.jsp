<%-- 
    Document   : home
    Created on : Jul 19, 2017, 1:03:18 PM
    Author     : paul
--%>

<%@page import="com.diit.sn.dao.RegistrationInfo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.diit.sn.dao.WallItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Networking Demo</title>
    </head>
    <body>
        <%
         String path = request.getContextPath();
                String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
       HttpSession userSession= request.getSession();
                String regId=(String)userSession.getAttribute("regId");
                List<WallItem> walls= new ArrayList<WallItem>();
                walls= (List<WallItem>)userSession.getAttribute("walls");
                if (walls != null){
                System.out.println("Wall Items No: "+walls.size());
                }
                RegistrationInfo registrationInfo= new RegistrationInfo();
                registrationInfo= (RegistrationInfo)userSession.getAttribute("registrationInfo");
                
                %>
        <h1>Home Page</h1>
             <div class="center_flexible_content">
                        <h3>Photo</h3>
  
                        <img class="uploadimages" src="<%= basePath%>/PhotoServlet?regNo=<%=regId%>" alt="Picture" width="180" height="180" />
<h3 style="text-align: right"><a href="UserOperationServlet?op=addFriend&frndId=<%=registrationInfo.getMemberId()%>">Add Friend</a>
                    </div>
                        <a >
                        <br />
                    <div>
<!--                         <form name='aspnetForm' method='post' action='UserOperationServlet' id='aspnetForm' >
                        <table>
                            <tr>
                         <td class="td_left labelwrap">
                        Your Status
                         </td>
                         <td>
                             <textarea rows="4" cols="50" id="txtStatus" name="txtStatus"> </textarea>
                         </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                     <input type="submit" name="btnSubmit" value="Share" id="btnSubmit" class="buttons" />
                                </td>
                            </tr>
                            
                            <table>
                                </form>-->
                    </div>
                    <div>
                        <table>
                            <tr><td>Name</td><td><%=registrationInfo.getFirstName()+" "+ registrationInfo.getLastName()%></td></tr>
                            <tr><td>email</td><td><%=registrationInfo.getEmailId() %></td></tr>
                            <tr><td>Contact No:</td><td><%=registrationInfo.getContactNo() %></td></tr>
                            <tr><td>Country</td><td><%=registrationInfo.getCountryName() %></td></tr>
                            <tr><td></td><td></td></tr>
                            
                        </table>
                        
                    </div>
                    <div>
                       <% if(walls != null) {%>
                        <table>
                        <%
                        
                        Iterator itrWall=walls.iterator();
                        WallItem wallItem= new WallItem();
                        while(itrWall.hasNext()){
                        wallItem=(WallItem) itrWall.next();
                        %>
                        <tr>
                            <td><%=wallItem.getUserName()%></td>
                            <td><%=wallItem.getStatus()%></td>
                            <%if(wallItem.getNoOfLike()!=0){ %>
                            <td>Likes: <%=wallItem.getNoOfLike()%></td>
                            <%}%>
                            <td><a href="UserOperationServlet?op=Like&uid=<%=wallItem.getUserId()%>&sid=<%=wallItem.getStatusid()%>">Like It</a></td>
                        </tr>
                        <%
                        }
                       }
                        %>
                        </table>
                    </div>
    </body>
</html>
