<%-- 
    Document   : index
    Created on : Jul 12, 2017, 4:50:51 PM
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Networking Demo</title>
    </head>
    <body>
        <h1>Social Network Demo</h1>
          <div class="form_header" itemprop="description"><h3 style="text-align: right"><a href="registration">Signup</a></h3></div>
    
           <form name='aspnetForm' method='post' action='login' id='aspnetForm' >
            <h1>Sing in</h1>
            <table>
                <tr>
                    <td class="td_left labelwrap">
                        Login ID
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <input class="txt2" name="loginId" type="text" maxlength="50" required id="loginId" onBlur="changBackColor(this);"  />
                    </td>
                </tr>
                <tr>
                    <td class="td_left labelwrap">
                       Password
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <input class="txt2" name="txtPassword" type="password" maxlength="50" required id="txtPassword" onBlur="changBackColor(this);"/>
                    </td>
                </tr>
                
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
