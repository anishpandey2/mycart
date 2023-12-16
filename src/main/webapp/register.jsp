

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #e2e2e2;">

        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-1 ">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img style="width:40px" src="img/register.png" />
                            </div>
                            <h4 class="text-center">Sign up here</h4>
                            <form action="RegisterServlet" method="post" style="font-size: 13px;">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control form-control-sm" id="name" aria-describedby="nameHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control form-control-sm" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control form-control-sm" id="password" aria-describedby="passwordHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="Phone">User Phone</label>
                                    <input name="user_phone" type="number" class="form-control form-control-sm" id="Phone" aria-describedby="PhoneHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="Phone">User Address</label>
                                    <textarea name="user_address" style="height: 105px;" class="form-control" placeholder="Enter your address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-sm btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-sm btn-outline-warning">Reset</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
