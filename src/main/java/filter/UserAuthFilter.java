package filter;


import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/homePage","/books","/books/add","/authors","/authors/add"})
public class UserAuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        User user = (User) req.getSession().getAttribute("active");
        if (user==null) {
            HttpServletResponse resp = (HttpServletResponse) servletResponse;
            resp.sendRedirect("/");
        } else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }
    @Override
    public void destroy() {
    }
}
