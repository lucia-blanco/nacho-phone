<%@page import="java.sql.*"%>
  <%
    String userid = request.getParameter("mail");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachophone","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from usuario where email='" + userid + "' and passw='" + pwd + "'");
    if (rs.next()) {
      session.setAttribute("userid", userid);
      //out.println("welcome " + userid);
      //out.println("<a href='logout.jsp'>Log out</a>");
      response.sendRedirect("usuario.jsp");
    } else { %>
      <script type="text/javascript">
        alert("Correo o contrase�a inv�lidos, por favor pulsa 'Aceptar' e int�ntalo de nuevo");
        window.location.href = "index.jsp"; 
      </script> 
      <%
      //response.sendRedirect("index.jsp");
      %>
      
    <%
    }
  %>