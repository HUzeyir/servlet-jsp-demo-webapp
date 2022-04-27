package com.mycompany.servlets;

import com.mycompany.bean.Nationality;
import com.mycompany.bean.User;
import com.mycompany.context.Context;
import com.mycompany.daoInter.UserDaoInter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

    private UserDaoInter udi = Context.instanceUserDao();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.sendRedirect("search.jsp");
        System.out.println("search page was called");
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {


        if (request.getParameter("delete") != null) {

            int deleteId = Integer.parseInt(request.getParameter("delete"));
            boolean isDelete = udi.deleteUser(deleteId);
            System.out.println(isDelete);
            if (isDelete) {
                response.sendRedirect("search.jsp");
            }
        }
    }

    protected void sendUserForUpdatePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int updateId = Integer.parseInt(request.getParameter("update"));
        User user = udi.getUserbyId(updateId);

        request.setAttribute("user", user);
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("updateUserId"));
        User user = udi.getUserbyId(id);

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String ageString = request.getParameter("age");

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        Date date;
        java.sql.Date age = null;
        try {
            date = formatter.parse(ageString);
            age = new java.sql.Date(date.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("Exception bas verdi: " + e.getMessage());
        }

        String about = request.getParameter("about");
        String birthPlace = request.getParameter("birthplace");
        String country = request.getParameter("country");

        Nationality nat = new Nationality(birthPlace, country);
        user.setName(name);
        user.setSur_name(surname);
        user.setEmail(email);
        user.setPassword(password);
        user.setAge(age);
        user.setAbout(about);
        user.setNationality(nat);
        user.setUpdateDate(Timestamp.valueOf(LocalDateTime.now()));
        udi.updateUser(user);
        response.sendRedirect("search.jsp");
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String ageString = request.getParameter("age");

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        java.sql.Date age = null;
        try {
            Date date = formatter.parse(ageString);
            age = new java.sql.Date(date.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("Exception bas verdi: " + e.getMessage());
        }

        String about = request.getParameter("about");
        User user = new User();
        user.setName(name);
        user.setSur_name(surname);
        user.setEmail(email);
        user.setPassword(password);
        user.setAge(age);
        user.setAbout(about);
        user.setAddDate(Timestamp.valueOf(LocalDateTime.now()));

        udi.addUser(user);
        System.out.println("Added");
        response.sendRedirect("search.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("add") != null) {
            add(request, response);
        }
        if (request.getParameter("update") != null) {
            sendUserForUpdatePage(request, response);
        }
        if (request.getParameter("delete") != null) {
            delete(request, response);
        }
        if (request.getParameter("info") != null) {
            int infoId = Integer.parseInt(request.getParameter("info"));
        }
        if (request.getParameter("updateUserId") != null) {
            update(request, response);
        }

//        if (request.getParameter("register") != null) {
//
//        }

//        if (request.getParameter("signIn") != null) {
//
//            String email=request.getParameter("email");
//            String password=request.getParameter("password");
//            response.sendRedirect("search.jsp");
//        }


    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("register.jsp");


    }
}
