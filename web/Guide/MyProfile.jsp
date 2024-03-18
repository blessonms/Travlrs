<%-- 
    Document   : MyProfile
    Created on : 23 Feb, 2024, 12:31:34 PM
    Author     : Blesson MS George
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProfile </title>
    </head>
    <body>
        <%
            String selqry = "select* from tbl_guide where guide_id='" + session.getAttribute("guideid") + "' ";
            
            ResultSet s1 = con.selectCommand(selqry);
            s1.next();
        %>
        <table border=2" align="center">
            <tr>
                <td colspan="2" align="center"><img src="../Assets/Files/<%=s1.getString("guide_photo")%>" width="150" height="150"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=s1.getString("guide_name")%></td>  
            </tr>
            <tr>
                <td>Email</td>
                <td><%=s1.getString("guide_email")%></td>  
            </tr>
            <tr>
                <td>Address</td>
                <td><%=s1.getString("guide_address")%></td>  
            </tr>

            <tr>
                <td>Contact</td>
                <td><%=s1.getString("guide_contact")%></td>  
            </tr>
            
            <tr>
                <td colspan="2" align="center"><a href="EditProfile.jsp" value="">Edit Profile</a></td>
            </tr> 
        </table>
    </body>
</html>
