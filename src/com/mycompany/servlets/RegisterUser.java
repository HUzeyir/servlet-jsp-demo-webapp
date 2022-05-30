package com.mycompany.servlets;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.mycompany.bean.User;
import com.mycompany.context.Context;
import com.mycompany.daoInter.UserDaoInter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet(name = "RegisterUser", urlPatterns = {"/register"})
public class RegisterUser extends HttpServlet {

    private UserDaoInter udi = Context.instanceUserDao();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user2 = udi.serchUserByEmail(req.getParameter("email"));

        if (user2== null) {

            String name = req.getParameter("name");
            String surName = req.getParameter("surname");
            String email = req.getParameter("email");
            String ageString = req.getParameter("age");

            System.out.println("age: " + ageString);

            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            java.sql.Date age = null;
            java.util.Date date;
            try {
                date = formatter.parse(ageString);
                age = new java.sql.Date(date.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
                System.out.println("Exception bas verdi: " + e.getMessage());
            }

            String password1 = req.getParameter("password1");
            String password2 = req.getParameter("password2");

            BCrypt.Hasher haser = BCrypt.withDefaults();

            haser.hashToString(4, password1.toCharArray());

            User user = new User();
            user.setName(name);
            user.setSur_name(surName);
            user.setAge(age);
            user.setEmail(email);
            user.setPassword(password1);
            user.setAddDate(Timestamp.valueOf(LocalDateTime.now()));
            udi.addUser(user);
            resp.sendRedirect("login.jsp");
            System.out.println("Registered Sucessufully");
        }else{
            resp.sendRedirect("login");
        }



    }

}
