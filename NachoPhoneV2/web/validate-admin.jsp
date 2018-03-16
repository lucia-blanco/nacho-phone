<%@page import="java.sql.*"%>
  <%
    String userid = request.getParameter("mail");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachophone","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM admin WHERE email='" + userid + "' AND passw='" + pwd + "'");
    if (rs.next()) {
      session.setAttribute("userid", userid);
      //out.println("welcome " + userid);
      //out.println("<a href='logout.jsp'>Log out</a>");
      response.sendRedirect("admin.jsp");
    } else { 
   %>
      <script type="text/javascript">
        window.location.href = "aLogin.jsp";
        window.onload(alert("Correo o contraseña inválidos, por favor pulsa 'Aceptar' e inténtalo de nuevo"));
      </script> 
    <%
      //response.sendRedirect("index.jsp");
    }
  %>