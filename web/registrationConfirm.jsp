<%-- 
    Document   : registration
    Created on : Jul 17, 2017, 2:58:25 PM
    Author     : paul
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.diit.sn.util.RSA"%>
<%@page import="com.diit.sn.dao.ImageInfo"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.diit.sn.dao.RegistrationInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="datetimepicker_css.js"></script>
        <script type="text/javascript" src="ajaxjs.js"></script>
        <title>Registration Confirmation</title>
    </head>

    <body>
        <form name='aspnetForm' method='post' action='registration' id='registrationForm'>
            <%
                BigInteger[] imageName = new BigInteger[100];
                ImageInfo imageInfo = new ImageInfo();
                String photo = "";
                String imagePath = getServletConfig().getServletContext().getRealPath("uploadedImages");
                DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
                String path = request.getContextPath();
                String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
                RegistrationInfo registrationInfo = new RegistrationInfo();
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (!isMultipart) {
                } else {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    try {
                        items = upload.parseRequest(request);

                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    }

                    Iterator itr = items.iterator();
                    while (itr.hasNext()) {

                        FileItem item = (FileItem) itr.next();
                        System.out.println(item.getFieldName());
                        if (item.isFormField()) {
                            String name = item.getFieldName();
                             System.out.println("Form Field:"+item.getFieldName());
                            String value = item.getString();

                            if (name.equals("txtFirstName")) {
                                System.out.println("txtFirstName:" + value);
                                registrationInfo.setFirstName(value.trim());
                            }
                            if (name.equals("txtLastName")) {
                                System.out.println("txtLastName:" + value);
                                registrationInfo.setLastName(value.trim());
                            }
                            if (name.equals("txtEmail")) {
                                registrationInfo.setEmailId(value.trim());
                            }
                            if (name.equals("txtBirthDate")) {
                                registrationInfo.setDateOfBirth(value.trim());
                            }
                            if (name.equals("txtContactNo")) {
                                registrationInfo.setContactNo(value.trim());
                            }
                            if (name.equals("ddlCountry")) {
                                registrationInfo.setCountryName(value.trim());
                            } 
                        }
                            else {

                                try {
                                    int j = 0;
                                    String itemName = item.getName();
                                    // String path =(String) new File(config.getServletContext().getRealPath("/")).getParent() ;
                                    path = (String) path.replace(File.separatorChar, '/');
                                    RSA rsa = new RSA(30);
                                    // logger.info("RSA = " + rsa.getPrivateKey());
                                    //Local
                                    // File savedFile = new File(path +"/project/zhornyak/uploadedFiles/"+itemName);
                                    //Server

                                    imageName[j + 1] = rsa.getPrivateKey();
                                    imageInfo.setImagePath(imagePath);
                                    // File savedFile = new File("C:\\Images"+"\\"+imageName[j+1]+itemName) ;
                                    //File savedFile = new File(imagePath+"/"+imageName[j+1]+itemName) ;
                                    File savedFile = new File(imagePath + "/" + imageName[j + 1] + itemName);
                                    //File savedFile  = new File("c:\\abc.txt");

                                    item.write(savedFile);

                                    j = j + 1;

                                    System.out.println("File Size:" + savedFile.length() + "  J===" + j);

                                    if (savedFile.length() > 30720 && j == 1) {

                                        j = 34;
                                        // response.sendRedirect(basePath+"/onlineApplication");
                                    } else if (savedFile.length() < 1 && j == 1) {
                                    }

                                    if (j == 1) {
                                        photo = imageName[j] + itemName;
                                        System.out.println("Applicant Image Name: " + photo);
                                        imageInfo.setAppPicName(photo);

                                        try {
                                            imageInfo.setAppPic(ImageIO.read(savedFile));

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println(e.getMessage().toString());
                                }

                            
                        }
                    }
                }

                            HttpSession userSession = request.getSession();
                            userSession.setAttribute("registrationInfo", registrationInfo);

            %>
            <h1>Registration</h1>
            <table>
                <tr>
                    <td class="td_left labelwrap">
                        Full Name
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <%=registrationInfo.getFirstName()%>
                        <%=registrationInfo.getLastName()%>
                    </td>
                </tr>
                <tr>
                    <td class="td_left labelwrap">
                        Email ID
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <%=registrationInfo.getEmailId()%>

                    </td>
                </tr>
                <tr>
                    <td class="td_left labelwrap">
                        Date of Birth
                    </td>
                    <td class="td_center" >:</td>
                    <td class="td_right">
                        <%=registrationInfo.getDateOfBirth()%>
                    </td>
                </tr>
                <tr>
                    <td class="td_left">
                        Contact No.
                    </td>
                    <td class="td_center">:</td>
                    <td class="td_right">
                        <%=registrationInfo.getContactNo()%>
                    </td>
                </tr>
                <tr>
                    <td class="td_left">
                        Country
                    </td>
                    <td>
                        <%=registrationInfo.getCountryName()%>
                    </td>

                <div id="divUploadPhotoDetail" class="divUploadPhotoDetail">

                    <div class="center_flexible_content">
                        <h3>Photo</h3>
                        <%
                            System.out.println("IMAGE SOURCE====" + imagePath + "\\" + imageInfo.getAppPicName());
                            userSession.setAttribute("imageInfo", imageInfo);
                        %>
                        <img class="uploadimages" src="<%= basePath%>/ImageServlet?imgpath=<%=imagePath + "/" + imageInfo.getAppPicName()%>" alt="Picture" width="180" height="180" />
                        <span id="imgValidator" style="color:Red;display:none;">images only </span>

                    </div><br />
                    <div class="center_flexible_content">Maximum size of Image is 30kb</div>
                </div>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="btnSubmit" value="Confirm" id="btnSubmit" class="buttons" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
