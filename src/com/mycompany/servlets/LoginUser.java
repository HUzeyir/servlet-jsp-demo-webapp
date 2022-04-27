package com.mycompany.servlets;

import com.mycompany.bean.User;
import com.mycompany.context.Context;
import com.mycompany.daoInter.UserDaoInter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginUser", urlPatterns = {"/login"})
public class LoginUser extends HttpServlet {


    UserDaoInter udi = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = udi.serchUserByEmail(email);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedIn", user);
            resp.sendRedirect("user");
        } else {


            resp.sendRedirect("index.html");
            return;
        }


        System.out.println(user);


        resp.sendRedirect("index.html");


    }

}
