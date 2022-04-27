<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/19/2022
  Time: 8:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<form action="user" method="post">
    <table class="table">
        <tr>
            <td>Name:</td>
            <td><input class="form-control" type="text" name="name" placeholder="Type name here"/></td>
        </tr>
        <tr>
            <td>Surname:</td>
            <td><input class="form-control" type="text" name="surname" placeholder="Type surname here"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input class="form-control" type="email" name="email" placeholder="Type email here"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input class="form-control" type="password" name="password" placeholder="Type password here"/></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><input class="form-control" type="date" name="age" placeholder="Select date"/></td>
        </tr>
        <tr>
            <td>About:</td>
            <td><input class="form-control" type="text" name="about" placeholder="Type about here"/></td>
        </tr>

    </table>
    <button name="add" class="btn btn-secondary">Add<i class="fa-solid fa-user-plus"></i></button>
</form>

<form action="search.jsp">
    <button class="btn btn-secondary">GoTo HomePage</button>
</form>

</body>
</html>
