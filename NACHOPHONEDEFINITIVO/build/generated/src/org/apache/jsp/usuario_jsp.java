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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"\">\r\n");
      out.write("<head><meta charset=\"utf-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <!-- Latest compiled and minified CSS -->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">\r\n");
      out.write("  <!-- jQuery library -->\r\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("  <!-- Popper JS -->\r\n");
      out.write("  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\"></script>\r\n");
      out.write("  <!-- Latest compiled JavaScript -->\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilo.css\">\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <script\r\n");
      out.write("  src=\"https://code.jquery.com/jquery-3.3.1.min.js\"\r\n");
      out.write("  integrity=\"sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=\"\r\n");
      out.write("  crossorigin=\"anonymous\"></script>\r\n");
      out.write("  \r\n");
      out.write("  <title>Usuario</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body onload='showFields(document.getElementById(\"numeros\").value)'>\r\n");
      out.write("  \r\n");
      out.write("  ");
      
    String correo = request.getParameter("mail");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
    Statement s = conexion.createStatement();
    ResultSet dato = s.executeQuery("SELECT * FROM USUARIO WHERE email= '" + correo + "' ");
    out.println(correo);
  
      out.write("\r\n");
      out.write("\r\n");
      out.write("  <nav class=\"navbar navbar-expand-md fixed-top\">\r\n");
      out.write("\t\t<a href=\"usuario.jsp\" id=\"logo-navbar\">NachoPhone</a>\r\n");
      out.write("\t</nav>\r\n");
      out.write("  <main role=\"main\">\r\n");
      out.write("    <div class=\"jumbotron\">\r\n");
      out.write("      <div class=\"container\">\r\n");
      out.write("          ");
 
          while (dato.next()) {
              out.println("<h1 id='bienvenida' class='display-3'>Bienvenido, ") + dato.getString("nombre") + "</h1>");
              
       out.println("</div>");
     out.println("</div>");
       out.println("<div class='container-fluid'>");
         out.println("<div class='row'>");
           out.println("<div class='col-md-6'>");
              out.println("<h2>" +  dato.getString("nombre") + " " + dato.getString("apellido")  +    "</h2>");
              out.println("<h4>" +  dato.getString("dni")    +    "</h4>");
              out.println("<h4>" +  dato.getString("email")    +    "</h4>");
              out.println("<h4>" +  dato.getString("tlfUsuario")    +    "</h4>");
            }
            conexion.close();
          
      out.write(" \r\n");
      out.write("          <form method=\"get\" action=\"uModificaDatos.jsp\">\r\n");
      out.write("            <input style='display: none;' type=\"text\" name=\"mail\" value=\"");
 out.println(correo); 
      out.write("\"/>\r\n");
      out.write("            <button type=\"submit\"> Modificar </button>\r\n");
      out.write("          </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-md-6\">\r\n");
      out.write("        ");

          out.println("<div id='consumo'>"); 
          out.println("<div id='lineas'>");
          out.println("<form action='uLineaSelec.jsp' method='GET'>");
          out.println("<select name= 'numeros' id='numeros' onchange='showFields(this.value)' > ");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
          Statement s2 = conexion2.createStatement();

          ResultSet tel = s2.executeQuery("SELECT * FROM GASTO G JOIN USUARIO U ON (G.usuario = U.idUsuario) WHERE email= '" + correo + "' ");
          while (tel.next()) {  
            String t = tel.getString("telefono");
            out.println("<option value='" + t + "' >" + t + "</option>");
          }
          conexion2.close();
        
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        </select><br/><br/>\r\n");
      out.write("        <div id=\"Show_update\" style=\"color:black;\">To Update the designation...</div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </main> \r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("  function showFields(string1){\r\n");
      out.write("    var xRequest1;\r\n");
      out.write("    if(string1==\"\"){\r\n");
      out.write("      document.getElementById(\"Show_update\").innerHTML=\"\";\r\n");
      out.write("      return;\r\n");
      out.write("    }\r\n");
      out.write("    if(window.XMLHttpRequest){\r\n");
      out.write("      xRequest1=new XMLHttpRequest();\r\n");
      out.write("    }else{\r\n");
      out.write("      xRequest1=new ActiveXObject(\"Microsoft.XMLHTTP\");\r\n");
      out.write("    }\r\n");
      out.write("    xRequest1.onreadystatechange=function(){\r\n");
      out.write("      if((xRequest1.readyState==4) && (xRequest1.status==200)){\r\n");
      out.write("        document.getElementById(\"Show_update\").innerHTML=xRequest1.responseText;\r\n");
      out.write("      }\r\n");
      out.write("    };\r\n");
      out.write("    xRequest1.open(\"get\",\"cargaTarifa.jsp?q=\"+string1,\"true\");\r\n");
      out.write("    xRequest1.send();\r\n");
      out.write("  }\r\n");
      out.write("  </script>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
