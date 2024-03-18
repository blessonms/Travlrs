<%-- 
    Document   : package
    Created on : 9 Mar, 2024, 1:52:55 PM
    Author     : Blesson MS George
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package </title>
    </head>
    <body>
    <body>


        <table align="center">
            <tr>
                <%
                    int i = 0;
                    String selQry5 = "select * from tbl_package k inner join tbl_place p on k.place_id= p.place_id inner join tbl_district d on p.district_id=d.district_id inner join tbl_state s on s.state_id=d.state_id inner join tbl_country c on c.country_id=s.country_id";
                    ResultSet rs5 = con.selectCommand(selQry5);
                    while (rs5.next()) {
                        i++;

                %>
                <td>
                    <table border="1" style="margin: 10px">
                        <tr>
                            <td><img src="../Assets/Files/<%=rs5.getString("package_photo")%>" width="150" height="150"></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("package_name")%></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("package_details")%></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("country_name")%></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("state_name")%></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("district_name")%></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("place_name")%></td>
                        </tr>
                        <tr>
                            <td><%=rs5.getString("package_price")%></td>
                        </tr>
                    </table>
                </td>
                <%
                if(i==4)
                {
                    out.println("</tr><tr>");
                    i=0;
                }
                    }
                %>
        </table>   
    </body>

</html>
