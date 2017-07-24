<%-- 
    Document   : applicationErrorPage
    Created on : Jun 16, 2011, 10:59:43 AM
    Author     : paul.pronab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application  Error</title>

        <LINK REL="SHORTCUT ICON" HREF="../Images/dbbl.ico"/>
        <title>Error Notification</title>
        <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <%

            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

        %>
        <script type="text/javascript">
            function Load()
            {
                document.getElementById("load").focus();
            }
        </script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-28654820-1']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

        </script>
    </head>
    <body style="background-color:White" onload="Load();">
        </br>
        <% String messageToDisplay = request.getParameter("messageToDisplay");%>
        <a name="1"></a>
        <input type="hidden" name="anchor" id="anchor" />
        <br /><br /><br />
        <div class="main_container mainwrap wrapadjust">
            <div class="noprint">
                <div class="content_header">

                    <center><h2>Message:</h2></center>
                </div>
            </div>


            <div id="trackingNo" class="idDisplay" style="color: #ff0000">Error ID: <%=messageToDisplay%></br></div>
            
        </div>
        <br />

        <br /><br />
        


        <div class="noprint">
            <table>
                <tr>
                    <td style="width:70%"></td>

                </tr>
            </table>
        </div>

    </body>
</html>
