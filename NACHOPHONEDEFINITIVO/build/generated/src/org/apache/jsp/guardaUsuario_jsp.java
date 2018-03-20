package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class guardaUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/usuario.css\">\r\n");
      out.write("    <script\r\n");
      out.write("  src=\"https://code.jquery.com/jquery-3.3.1.min.js\"\r\n");
      out.write("  integrity=\"sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=\"\r\n");
      out.write("  crossorigin=\"anonymous\"></script>\r\n");
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("    <title></title>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("  ");
 request.setCharacterEncoding("UTF-8"); 
      out.write("\r\n");
      out.write("    ");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
      Statement s = conexion.createStatement();

      
      // Comprueba la existencia del mail de usuario introducido
      String consultaMail = "SELECT * FROM USUARIO WHERE email='"+ request.getParameter("mail") + "'";      
      
      ResultSet existe = s.executeQuery (consultaMail);
      existe.last();
      
      if (existe.getRow() != 0) {
         response.sendRedirect("registro.jsp?q=cambia");
      } else { 
        String insercion = "INSERT INTO USUARIO (email, passw, dni, nombre, apellido, tlfUsuario) VALUES ("
          
          + " '" + request.getParameter("mail")
          + "', '" + request.getParameter("password")
          + "', '" + request.getParameter("dni")
          + "', '" + request.getParameter("nombre")
          + "', '" + request.getParameter("apellido")
          + "', '" + request.getParameter("tlf") + "')";
        s.execute(insercion);
        response.sendRedirect("admin.jsp?mail=" + request.getParameter("mail"));
      }
      conexion.close();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
