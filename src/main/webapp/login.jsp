
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #e2e2e2;">
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-5 offset-md-3 mt-5">
                    <div class="card">

                        <div class="card-header custom-bg text-white text-center">
                            <h4>Login here</h4>
                        </div>

                        <%@include file="components/message.jsp" %>

                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control form-control-sm" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> 
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control form-control-sm" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="text-center mb-3">
                                    <a style="font-size: 13px;" href="register.jsp">if not registered click here</a>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0 btn-sm">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0 btn-sm">Reset</button>
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
