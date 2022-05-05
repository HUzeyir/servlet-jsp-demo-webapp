package com.mycompany.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "LoginSecurity", urlPatterns = {"/*"})
public class LoginSecurity implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;


        if (!request.getRequestURI().contains("login") && request.getSession().getAttribute("loggidIn") == null) {
            System.out.println("redirected to login servlet");
            response.sendRedirect("login");
        } else {
            System.out.println("filterChain doFilter worked");
            filterChain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() {

    }
}
