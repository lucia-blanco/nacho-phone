package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"es\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <!-- Latest compiled and minified CSS -->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("  <!-- jQuery library -->\r\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Popper JS -->\r\n");
      out.write("  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Latest compiled JavaScript -->\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilo.css\">\r\n");
      out.write("   \r\n");
      out.write("  <title>Login</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body id=\"fondo-principal\">\r\n");
      out.write("\t<div id=\"wrapper-login\" class=\"cover-container d-flex h-100 p-3 mx-auto flex-column text-center\">\r\n");
      out.write("\t\t<main role=\"main\" class=\"inner cover\">\r\n");
      out.write("      ");
 request.setCharacterEncoding("UTF-8"); 
      out.write("\r\n");
      out.write("      ");
 String mostrar = request.getParameter("q"); 
      out.write("\r\n");
      out.write("      <form action=\"validate.jsp\" method=\"get\" accept-charset=\"utf-8\" onsubmit=\"return validacion()\" id=\"formulario\" class=\"form-signin\">\r\n");
      out.write("        <h1 class=\"h1 mb-3 titulo\">NachoPhone</h1>\r\n");
      out.write("        <h5 class=\"h5 font-weight-normal\">Por favor, identifícate</h5>\r\n");
      out.write("        <span id=\"");
 out.print(mostrar); 
      out.write("\" style=\"display: none;\"class=\"alert alert-danger mt-3\" role=\"alert\">Correo electrónico o contraseña inválidos</span><br>\r\n");
      out.write("        <a style=\"margin-bottom: 5px; font-size: small;\" href=\"aLogin.jsp\">¿Eres admin?</a>\r\n");
      out.write("        <input type=\"email\" id=\"mail\" name=\"mail\" class=\"form-control form-group\" style=\"margin-top: 10px;\" placeholder=\"Correo electrónico\" required autofocus value=\"\">\r\n");
      out.write("        <input type=\"password\" id=\"password\" name=\"password\" value=\"\" class=\"form-control form-group\" placeholder=\"Contraseña\" required>\r\n");
      out.write("        <input id=\"button\" class=\"btn btn-lg btn-basic btn-block\" type=\"submit\" name=\"button\" value=\"Acceder\">\r\n");
      out.write("        <a href=\"registro.jsp\" id=\"registro\">Registrarse</a>\r\n");
      out.write("        <small class=\"mt-5 mb-3 text-muted\">© Nachophone 2018</small>\r\n");
      out.write("      </form>\r\n");
      out.write("    </main>\r\n");
      out.write("  </div>  \r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("    window.onload = function alert() {\r\n");
      out.write("      //mostrar = request.getParameter(\"q\");\r\n");
      out.write("      document.getElementById(\"cambia\").style.display = \"inline-block\";\r\n");
      out.write("    };\r\n");
      out.write("    \r\n");
      out.write("    window.onclick = function quitar() {\r\n");
      out.write("      document.getElementById(\"cambia\").style.display = \"none\";\r\n");
      out.write("    };\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");
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
