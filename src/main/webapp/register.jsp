<%--
  Created by IntelliJ IDEA.
  User: HuzeyirPc
  Date: 4/20/2022
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                            <form action="register" method="post">
                                <div class="form-outline mb-4">
                                    <input name="name" type="text" id="form3Example1cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example1cg">Your Name</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input name="surname"  type="text" id="form3Example12cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example12cg">Your Surname</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input name="age"  type="date" id="form3Example122cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example122cg">Your Surname</label>
                                </div>
                                <div  class="form-outline mb-4">
                                    <input name="email" type="email" id="form3Example3cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example3cg">Your Email</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input name="password1" type="password" id="form3Example4cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example4cg">Password</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input namme="password2" type="password" id="form3Example4cdg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="submit"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                                        Register
                                    </button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="register" class="fw-bold text-body"><u>Login
                                    here</u></a></p>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
