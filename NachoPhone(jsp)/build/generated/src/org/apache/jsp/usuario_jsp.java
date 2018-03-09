package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class usuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/usuario.css\">\n");
      out.write("    <script\n");
      out.write("  src=\"https://code.jquery.com/jquery-3.3.1.min.js\"\n");
      out.write("  integrity=\"sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=\"\n");
      out.write("  crossorigin=\"anonymous\"></script>\n");
      out.write("    \n");
      out.write("    <title></title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    ");
      
          String correo = request.getParameter("mail");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s = conexion.createStatement();
          ResultSet dato = s.executeQuery("SELECT * FROM USUARIO WHERE email= '" + correo + "' ");
          
        
    
      out.write("\n");
      out.write("    <div id=\"top\"><a href=\"index.jsp\" id=\"logo\">NachoPhone</a></div>\n");
      out.write("    <div id=\"dp\">\n");
      out.write("        ");

            while (dato.next()) {
            
                out.println("<div class='datos'>" +  dato.getString("nombre") + " " + dato.getString("apellido")  +    "</div>");
                out.println("<div class='datos'>" +  dato.getString("dni")    +    "</div>");
                out.println("<div class='datos'>" +  dato.getString("email")    +    "</div>");
                out.println("<div class='datos'>" +  dato.getString("tlfUsuario")    +    "</div></div>");
            }
            conexion.close();  
     //out.println("<form action='' method='get' accept-charset='utf-8'>");    
     out.println("<div id='consumo'>"); 
     out.println("<div id='lineas'>");
     out.println("<select id='numeros'onchange='elige()'> ");
            Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s2 = conexion2.createStatement();
          String tlf = "";

          ResultSet tel = s2.executeQuery("SELECT * FROM GASTO G JOIN USUARIO U ON (G.usuario = U.idUsuario) WHERE email= '" + correo + "' ");
          
          while (tel.next()) {  
           String t = tel.getString("telefono");
           out.println("<option value='" + t + "' >" + t + "</option>");
          
           }
            conexion2.close();
        
      out.write("\n");
      out.write("    \n");
      out.write("            </select>\n");
      out.write("             \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("            function elige(){\n");
      out.write("                console.log($( \"#numeros option:selected\" ).text());\n");
      out.write("                tlf = $( \"#numeros option:selected\" ).text();\n");
      out.write("           \n");
      out.write("                console.log(tlf);\n");
      out.write("                $(tlf).show();\n");
      out.write("                \n");
      out.write("         }\n");
      out.write("         window.onload = elige;\n");
      out.write("        </script>\n");
      out.write("      \n");
      out.write("        ");

        
       Class.forName("com.mysql.jdbc.Driver");
          Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s3 = conexion3.createStatement();
         
          
       ResultSet tar = s3.executeQuery("SELECT * FROM TARIFA T JOIN GASTO G ON (T.idTarifa=G.tarifa) WHERE telefono= '" + tlf + "' ");
    
        
        while (tar.next()) {  
          
           
        out.println("<div class='name'><strong>Tarifa </strong></div>");
        out.println("<div class='tarifa'>" + tar.getString("nomTarifa") + "</div>");
        out.println("<div class='name'><strong>Minutos </strong></div>");
        out.println("<div class='izquierda'>" + tar.getString("minTarifa") + "</div><div class='derecha'>" + (tar.getInt("minTarifa") - tar.getInt("minConsumidos")) + "</div>");
        out.println("<div class='name'><strong>Megas </strong></div>");
        out.println("<div class='izquierda'>" + tar.getString("mbTarifa") + "</div><div class='derecha'>" + (tar.getInt("mbTarifa") - tar.getInt("mbConsumidos")) + "</div>");
         }
            conexion3.close();
        
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
