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
                List<RegistrationInfo> listReistrationInfo;
                listReistrationInfo=(List<RegistrationInfo>)userSession.getAttribute("listReistrationInfo");
                walls= (List<WallItem>)userSession.getAttribute("walls");
                
                if(userSession.getAttribute("globalMessage") != null){
                    %>
                    <label><%=userSession.getAttribute("globalMessage")%> </label>>
                    <%
                }
                
                if (walls != null){
                System.out.println("Wall Items No: "+walls.size());
                }
                %>
        <h1>Home Page</h1>
        
                                 <form name='aspnetForm' method='post' action='UserOperationServlet' id='aspnetForm' >
                        <table>
                            <tr>
                         <td class="td_left labelwrap">
                        search by email:
                         </td>
                         <td>
                            
                             <input class="txt2" name="searchValue" type="text" maxlength="50" required id="searchValue" onBlur="changBackColor(this);"  />
                         </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                     <input type="submit" name="btnSeachProfile" value="Search Friend" id="btnSeachProfile" class="buttons" />
                                </td>
                            </tr>
                            
                            <table>
                                </form>
        <div>
            <%if(userSession.getAttribute("listReistrationInfo")!=null && !listReistrationInfo.isEmpty()){%>
            <table>
                <%
Iterator itrListProfile= listReistrationInfo.iterator();
RegistrationInfo profile= new RegistrationInfo();

while(itrListProfile.hasNext()){
    profile= (RegistrationInfo)itrListProfile.next();
    System.out.println("profile:"+profile);
}%>
                <tr>
                    <td><%=profile.getFirstName()+" "+profile.getLastName() %><td>
                    <td><a href="UserProfile?email=<%=profile.getEmailId() %>" >View Profile</a></td>
                </tr>
            </table>
            <%
}%>
            
        </div>
        
             <div class="center_flexible_content">
                        <h3>Photo</h3>
  
                        <img class="uploadimages" src="<%= basePath%>/PhotoServlet?regNo=<%=regId%>" alt="Picture" width="180" height="180" />

                    </div><br />
                    <div>
                         <form name='aspnetForm' method='post' action='UserOperationServlet' id='aspnetForm' >
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
                                     <input type="submit" name="btnSubmitStatus" value="Share" id="btnSubmitStatus" class="buttons" />
                                </td>
                            </tr>
                            
                            <table>
                                </form>
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
                            <td><%=wallItem.getUserName()%>:</td>
                            <td><%=wallItem.getStatus()%></td>
                            <%if(wallItem.getNoOfLike()!=0){ %>
                            <td>Likes: <%=wallItem.getNoOfLike()%></td>
                            <%}%>
                            <td><a href="UserOperationServlet?op=Like&uid=<%=wallItem.getUserId()%>&sid=<%=wallItem.getStatusid()%>">Like It</a></td>
                        <%if(wallItem.getNoOfDislike()!=0){ %>
                            <td>DisLikes: <%=wallItem.getNoOfDislike() %></td>
                            <%}%>
                            <td><a href="UserOperationServlet?op=DisLike&uid=<%=wallItem.getUserId()%>&sid=<%=wallItem.getStatusid()%>">DisLike It</a></td>
                        
                        </tr>
                        <%
                        }
                       }
                        %>
                        </table>
                    </div>
                        <div>
                             <div class="form_header" itemprop="description"><h3 style="text-align: right"><a href="UserOperationServlet?op=Logout">Log out</a></h3></div>
                        </div>
    </body>
</html>
