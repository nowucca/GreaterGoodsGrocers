package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * A servlet to serve all web pages as JSP (Java Server Pages).
 */
@WebServlet(name = "PageServlet",
urlPatterns = {"/test"},
loadOnStartup = 1)
public class PageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        forwardToJsp(request, response, request.getServletPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // empty for now
    }

    // Forwards the request to [userPath].jsp
    protected void forwardToJsp(HttpServletRequest request,
                                HttpServletResponse response,
                                String userPath) {
        String url = "/WEB-INF/jsp" + userPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
