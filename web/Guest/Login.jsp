<%-- 
    Document   : Login
    Created on : 23 Feb, 2024, 12:30:05 PM
    Author     : Blesson MS George
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1 align="center">Login</h1>
        <%
     if(request.getParameter("btn_submit")!=null){
             String email=request.getParameter("txt_email");
         String password=request.getParameter("txt_password");
        
         String selectadmin="select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
         ResultSet admin=con.selectCommand(selectadmin);
        
         String selectagency="select * from tbl_agency where agency_email='"+email+"' and agency_password='"+password+"'";
         ResultSet agency=con.selectCommand(selectagency);
         
      
         
         String selectuser="select * from tbl_user where user_email='"+email+"' and user_password='"+password+"'";
         ResultSet user=con.selectCommand(selectuser);
        
       
    
         
//         Agency
          if(agency.next()){
                session.setAttribute("agencyid", agency.getString("agency_id"));
                session.setAttribute("agencyname",agency.getString("agency_name"));
                response.sendRedirect("../Agency/HomePage.jsp");
             }

//         user
         else if(user.next()){
                session.setAttribute("userid", user.getString("user_id"));
                session.setAttribute("username", user.getString("user_name"));
                      session.setAttribute("plac", user.getString("place_id"));
                response.sendRedirect("../User/HomePage.jsp");
             }
//         Admin
         else if(admin.next()){
                session.setAttribute("adminid", admin.getString("admin_id"));
                session.setAttribute("adminname", admin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");
             }
       
         else{
            %>
            <script>
                alert("Email or Password Mistached");
                </script>
                <%
         }
     }
    %>
    <form method="post"> 
    <table border="2" align="center">
            <tr>
                <td>
                    Email

</td>
                <td>
                   <input type="text" name="txt_email">
                </td>
            </tr>
            <tr>
                <td>
                   Password
                </td>
           
                <td>
                    <input type="password" name="txt_password">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Login">
                </td>    
            
            </tr>
        </table>
    </form>
    </body>
</html>