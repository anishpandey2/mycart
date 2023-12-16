<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
    
        session.setAttribute("message","You are not logged in!! login first");
        response.sendRedirect("login.jsp");
        return;
        
    }

%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #e2e2e2;">
        <%@include file="components/navbar.jsp" %>

        <div style=" font-size: 13px;" class="container">
            <div class="row mt-3">

                <div class="col-md-6">
                    <!--card-->

                    <div class="card">
                        <div class="card-header custom-bg">
                            <h5 class="text-center">Your selected items</h5>
                        </div>

                        <div class="card-body">
                            <div class="cart-body">

                            </div>
                        </div>

                    </div>



                </div>
                <div class="col-md-5 sm-mt-5 offset-md-1">
                    <!--form details-->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="text-center">Your details for order</h5>
                        </div>

                        <div class="card-body">
                            <form action="#">

                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control form-control-sm" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control form-control-sm" id="name" aria-describedby="nameHelp" placeholder="Enter name">
                                </div>
                                
                                <div class="form-group">
                                    <label for="contact">Your contact</label>
                                    <input value="<%= user.getUserPhone() %>" type="number" class="form-control form-control-sm" id="contact" aria-describedby="contactHelp" placeholder="Enter contact no">
                                </div>
                                
                                <div class="form-group">
                                    <label for="address">Your address</label>
                                    <textarea id="address" class="form-control" style="height: 100px; "placeholder="Enter shipping address"></textarea>
                                </div>
                                
                                <div class="form-group text-center">
                                    <button class="btn btn-sm btn-outline-success" data-toggle="modal" data-target="#order">Order now</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>


            <%@include file="components/common_modals.jsp" %>
            <%@include file="components/order_modal.jsp" %>
    </body>
</html>
