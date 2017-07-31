<%-- 
    Document   : registration
    Created on : Jul 17, 2017, 2:58:25 PM
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="datetimepicker_css.js"></script>
        <script type="text/javascript" src="ajaxjs.js"></script>
        <title>Registration: Social Networking Demo</title>
    </head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <body>
        <form name='aspnetForm' method='post' action='<%=basePath%>registrationConfirm.jsp' id='aspnetForm' enctype='multipart/form-data'>
            <h1>Registration</h1>
            <table>
                <tr>
                    <td class="td_left labelwrap">
                        Name
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <input class="txt2" name="txtFirstName" type="text" maxlength="50" required id="txtFirstName" onBlur="changBackColor(this);"  />
                        <input class="txt2" name="txtLastName" type="text" maxlength="50" required id="txtLastName" onBlur="changBackColor(this);" />
                    </td>
                </tr>
                <tr>
                    <td class="td_left labelwrap">
                        Email ID
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <input class="txt2" name="txtEmail" type="text" maxlength="50" required id="txtFatherName" onBlur="changBackColor(this);"  />

                    </td>
                </tr>
                <tr>
                    <td class="td_left labelwrap">
                        Date of Birth
                    </td>
                    <td class="td_center" >:</td>
                    <td class="td_right">
                        <!--   <input type="image" name="ibCalendar" id="ibCalendar" src="Images/calendar_button.png" alt="Click here to select date" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ibCalendar&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))" style="border-width:0px;" />
                                                                                                                                                                    position.getLastDate()                
                        --> 


                        <input class="txt3" type="text" value="" name="txtBirthDate" id="txtBirthDate" required  maxlength="25" size="12"  <span class="datepic"><a href="javascript:NewCssCal('txtBirthDate','ddmmyyyy')" ><img
                                    src="cal.gif" width="16" height="16" alt="Pick a date" ></a>
                            (dd/mm/yyyy)</span>
                    </td>
                </tr>
                <tr>
                    <td class="td_left">
                        Contact No.
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <span></span>
                        <input class="txt3" name="txtContactNo" type="text" maxlength="11" id="txtContactNo" required onBlur="changBackColor(this);" onKeyPress="return checkIt(event)" />
                    </td>
                </tr>
                <tr>
                    <td class="td_left">
                        Country
                    </td>
                    <td class="td_center">:</td>
                    <td>
                        <select name="ddlCountry" id="ddlCountry" class="applicantGenderlist">
                            <option value="Bangladesh">Bangladesh</option>
                            <option value="Pakistan">Pakistan</option>
                            <option value="India">India</option>
                            <option value="America">America</option>
                            <option value="Australia">Australia</option>
                            <option value="England">England</option>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>:</td>
                    <td><input class="txt2" name="txtPassword" type="password" maxlength="50" required id="txtPassword" onBlur="changBackColor(this);"/></td>
                </tr>
               
            </table>
            
                               <div id="divUploadPhotoDetail" class="divUploadPhotoDetail">

                                    <div class="center_flexible_content">
                                        <h3>Upload your Photo</h3>
                                        <input type="file" name="FileUploadImg" id="FileUploadImg" onchange="ValidateSingleInput(this, '30');"/>
                                        <span id="imgValidator" style="color:Red;display:none;">images only </span>
                                    </div>
                                    <div class="center_flexible_content" style="font-family:arial;color:green;font-size:10px;">Max. Size < 30kb, Extension:<b>.jpg </b></div>
                                </div>
            <table>
                 <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="btnSubmit" value="Next" id="btnSubmit" class="buttons" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
