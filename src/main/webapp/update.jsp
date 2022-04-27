<%@ page import="com.mycompany.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/18/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-color: rgba(109,140,94,0.91)">

<% User user = (User) request.getAttribute("user"); %>

<div class="container">

    <div class="row">
        <div class="col">
            <form action="user" method="post">
                <table class="table">

                    <tr>
                        <td>id:</td>
                        <td><%= user.getUserId() %>
                        </td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input class="form-control" type="text" name="name" value=" <%= user.getName() %> "/>
                        </td>
                    </tr>
                    <tr>
                        <td>Surname:</td>
                        <td>
                            <input class="form-control" type="text" name="surname" value=" <%= user.getSur_name() %> "/>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <input class="form-control" type="text" name="email" value=" <%= user.getEmail() %> "/>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <input class="form-control" type="password" name="password" value=" <%= user.getPassword() %> "/>
                        </td>
                    </tr>
                    <tr>
                        <td>Age:</td>
                        <td>
                            <%--<input type="text" name="age" value=" <%= user.getAge() %> "/>--%>
                            <input type="date" name="age" value="<%=user.getAge()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>About:</td>
                        <td><textarea rows="3" name="about" class="form-control"><%= user.getAbout() %></textarea></td>
                    </tr>
                    <tr>
                        <td>Birth Place:</td>
                        <td>
                            <input class="form-control" type="text" name="birthplace"
                                   value=" <%= user.getNationality().getBirthPlace() %> "/>
                        </td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td>
                            <input class="form-control" type="text" name="country" value=" <%= user.getNationality().getCountry() %> "/>
                        </td>
                    </tr>
                    <tr>
                        <td>Add Date:</td>
                        <td><%= user.getAddDate() %>
                        </td>
                    </tr>
                    <tr>
                        <td>Update Date:</td>
                        <td>
                            <%
                                if (user.getUpdateDate() != null) {
                                    out.print(user.getUpdateDate());
                                }%>

                        </td>
                    </tr>
                    <tr>
                        <td> Online</td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="search.jsp">
                                <button class=" btn btn-secondary" type="submit">GoTo HomePage</button>
                            </form>
                        </td>
                    </tr>
                </table>
                <input type="hidden" value="<%=user.getUserId()%>" name="updateUserId"/>
                <button style="margin-left: 15px" class=" btn btn-info" type="submit">Update</button>
            </form>
        </div>
    </div>

</div>


</body>
</html>
