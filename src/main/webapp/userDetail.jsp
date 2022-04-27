<%@ page import="com.mycompany.daoInter.UserDaoInter" %>
<%@ page import="com.mycompany.context.Context" %>
<%@ page import="com.mycompany.bean.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HuzeyirPc
  Date: 4/18/2022
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%
    UserDaoInter udi = Context.instanceUserDao();

    String name = (String) request.getParameter("name");
    String surName = (String) request.getParameter("surname");

    List<User> users = udi.serchUsersByNameAndSurname(name, surName);

%>

<div class="col">
    <table class="table">
        <thead>
        <tr style="border-bottom: 1px solid dodgerblue">
            <td>Name:</td>
            <td>Surname:</td>
            <td>Email:</td>
            <td>Password:</td>
            <td>Age:</td>
            <td>Add date:</td>
            <td>About:</td>
            <td>Birth Place:</td>
            <td>Country:</td>
            <td>delete:</td>
            <td>edit:</td>
            <td>info:</td>
        </tr>
        </thead>
        <tbody>
        <%
            if ((name != null && surName != null) && !(name.isEmpty() && surName.isEmpty())) {
                for (int i = 0; i < users.size(); i++) {%>
        <tr>
            <td><%= users.get(i).getName() %>
            </td>
            <td><%= users.get(i).getSur_name() %>
            </td>
            <td><%= users.get(i).getEmail() %>
            </td>
            <td><%= users.get(i).getPassword() %>
            </td>
            <td><%= users.get(i).getAge() %>
            </td>
            <td><%= users.get(i).getAddDate() %>
            </td>
            <td><textarea rows="3" class="form-control"><%= users.get(i).getAbout() %></textarea></td>
            <td><%= users.get(i).getNationality().getBirthPlace() %>
            </td>
            <td><%= users.get(i).getNationality().getCountry() %>
            </td>
            <td>
                <form action="userSearch" method="post">
                    <button class="mybtn btn btn-danger" type="submit" ><i
                            class="fa-solid fa-user-minus"> </i></button>
                </form>
            </td>
            <td>
                <form action="userEdit" method="post">
                    <button class="mybtn btn btn-success" type="submit" ><i class="fa-solid fa-pen-clip"> </i>
                    </button>
                </form>
            </td>
            <td>
                <form action="userInfo" method="post">
                    <button class="mybtn btn btn-info" type="submit" ><i class="fa-solid fa-circle-info"></i>
                    </button>
                </form>

            </td>
        </tr>

        <% }
        } %>
        </tbody>
    </table>
</div>

</body>
</html>
