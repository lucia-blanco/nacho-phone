package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/login.css\">\n");
      out.write("    <title>Login</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <h2>NachoPhone</h2>\n");
      out.write("\n");
      out.write("    <form action=\"prueba.php\" method=\"get\" accept-charset=\"utf-8\" onSubmit=\"return validacion()\" id=\"formulario\">\n");
      out.write("        <label for=\"tlf\">Correo electrónico </label><br>\n");
      out.write("        <input type=\"text\" id=\"mail\" name=\"mail\" value=\"\" /><span id=\"elmail\" style=\"display: none; color: red;\"> El correo eléctronico no es válido</span><br>\n");
      out.write("        <label for=\"contraseña\">Contraseña </label><br>\n");
      out.write("        <input type=\"password\" id=\"contraseña\" name=\"contraseña\" value=\"\" /><span id=\"elpass\" style=\"display: none; color: red;\"> La contraseña no es válida</span><br/>\n");
      out.write("\n");
      out.write("        <input id=\"button\" type=\"submit\" name=\"button\" value=\"Acceder\">\n");
      out.write("\n");
      out.write("        <a href=\"registro.html\">\n");
      out.write("            <div id=\"registro\">Registrarse</div>\n");
      out.write("        </a>\n");
      out.write("    </form>\n");
      out.write("</body>\n");
      out.write("<script type=\"text/javascript\" src=\"js/login.js\"></script>\n");
      out.write("\n");
      out.write("</html>\n");
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
