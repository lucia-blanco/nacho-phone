<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
      <% request.setCharacterEncoding("UTF-8"); %>
       <%
    try{
<<<<<<< HEAD
        String username = request.getParameter("mail");   
        String password = request.getParameter("password");
        out.println(username);
=======
        String mail = request.getParameter("mail");   
        String password = request.getParameter("pass");
        out.println(mail);
>>>>>>> 938f3da8fb7b72d467412b7677d82e0f6bf80cb6
        out.println(password);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");    
        PreparedStatement pst = conn.prepareStatement("Select email,passw from admin where email=? and passw=?");
        pst.setString(1, mail);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) {     
           //out.println("Valid login credentials");
           response.sendRedirect("admin.jsp?mail="+ mail);        
        } else {
           response.sendRedirect("aLogin.jsp?q=cambia");  
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }     
%>
    </body>
</html>
