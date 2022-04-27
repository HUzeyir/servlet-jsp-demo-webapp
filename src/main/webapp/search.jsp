<%@ page import="com.mycompany.bean.User" %>
<%@ page import="com.mycompany.daoInter.UserDaoInter" %>
<%@ page import="com.mycompany.context.Context" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HuzeyirPc
  Date: 4/14/2022
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Page</title>
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <script src="assets/js/main.js"></script>
    <script src="https://kit.fontawesome.com/51c57d1876.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>

<%--<% User user = (User) request.getAttribute("user"); %>--%>

<%--Name: <input type="text" value="<%= user.getName() %>"/><br>--%>
<%--Sur Name: <input type="text" value="<%= user.getSur_name() %>"/><br>--%>
<%--Email: <input type="text" value="<%= user.getEmail() %>"/><br>--%>
<%--Password: <input type="text" value="<%= user.getPassword() %>"/><br>--%>
<%--Age: <input type="text" value="<%= user.getAge() %>"/><br>--%>
<%--Description: <textarea> <%= user.getAbout() %> </textarea> <br>--%>
<%--Add Date: <input type="text" value="<%= user.getAddDate() %>"/><br><br>--%>

<%
    UserDaoInter udi = Context.instanceUserDao();

    String name = (String) request.getParameter("name");
    String surName = (String) request.getParameter("surname");

    if (name == null && surName == null) {
        name = "";
        surName = "";
    }
    List<User> users = udi.serchUsersByNameAndSurname(name, surName);

%>

<div class="myContainer container">

    <div class="row">
        <%--form--%>
        <div class="col col=lg-4 col-md-4">
            <form action="search.jsp">
                <div class="form-group">
                    <label for="forname">Name</label>
                    <input placeholder="Type name" type="text" name="name" class="form-control" id="forname"
                           aria-describedby="nameHelp"
                           placeholder="Enter name">
                </div>
                <div class="form-group">
                    <label for="exampleSurname">Sername</label>
                    <input placeholder="Type surname" type="text" name="surname" class="form-control"
                           id="exampleSurname"
                           placeholder="Surname">
                </div>
                <button type="submit" class="btn btn-primary">Search or List</button>

            </form>
            <form action="userAdd.jsp">
                <button class="btn btn-primary" type="submit">Add<i class="fa-solid fa-user-plus"></i>
                </button>
            </form>
            <form action="login.jsp">
                <button class="btn btn-primary" type="submit">Sign out<i class="fa-solid fa-right-from-bracket"></i>
                </button>
            </form>
        </div>
        <%--end of form --%>

        <%--begin of table--%>
        <div class="col">
            <table class="table">
                <thead>
                <tr style="border-bottom: 1px solid dodgerblue">
                    <td>Name:</td>
                    <td>Surname:</td>
                </tr>
                </thead>
                <tbody>
                <%
                    //                                        if ((name == null && surName == null) && (name.isEmpty() && surName.isEmpty())) {
                    for (int i = 0; i < users.size(); i++) {%>
                <tr>
                    <td><%= users.get(i).getName() %>
                    </td>
                    <td><%= users.get(i).getSur_name() %>
                    </td>
                    <td>
                        <%--delete--%>
                        <form action="user" method="post">
                            <div style="float: left; margin-right: 10px">
                                <button onclick="forDeleteFunction('<%= users.get(i).getUserId() %>')" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="fa-solid fa-user-minus"> </i>
                                </button>
                            </div>
                            <!-- Button trigger modal -->
                        </form>
                        <%--update--%>
                        <form style="float: left; margin-right: 10px" action="user" method="post">
                            <input type="hidden" value="<%= users.get(i).getUserId() %>" name="update"/>
                            <button class="btn btn-success" type="submit"><i class="fa-solid fa-pen-clip"> </i>
                            </button>
                        </form>
                        <%--info--%>
                        <form style="float: left; " action="user" method="post">
                            <input type="hidden" value="<%= users.get(i).getUserId() %>" name="info"/>
                            <button class="btn btn-info" type="submit"><i class="fa-solid fa-circle-info"></i>
                            </button>
                        </form>
                        <%--add--%>
                    </td>
                </tr>
                <%
                        //                        }
                    } %>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Modal -->
<div style="position: fixed" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <div class="modal-footer">
                <form action="user" method="post">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <input type="hidden" value="" name="delete" id="idForDelete"/>
                    <button onclick="" type="submit" class="btn btn-danger">Remove</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
