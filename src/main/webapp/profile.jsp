<%@page import="com.cart.entities.User" %>


<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
    
        session.setAttribute("message","You are not logged in !!");
        response.sendRedirect("login.jsp");
        return;
        
    }
%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #e2e2e2;">
        <%@include file="components/navbar.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3 mt-3">
                    <div class="card">
                        <div  class="card-header text-center custom-bg">
                            <h4>Your Profile</h4>
                        </div>
                        
                        <div class="card-body">
                            <div class="form-group">
                                    <p style="display: inline; font-weight: bold;">Your Name :</p>
                                    <p style="display: inline;">&nbsp;<%= user.getUserName() %></p>
                                    
                            </div>
                            <div class="form-group">
                                    <p style="display: inline; font-weight: bold;">Your Email :</p>
                                    <p style="display: inline;">&nbsp;<%= user.getUserEmail() %></p>
                                    
                            </div>
                            <div class="form-group">
                                   <p style="display: inline; font-weight: bold;">Your Contact no. :</p>
                                    <p style="display: inline;">&nbsp;<%= user.getUserPhone() %></p>
                                     
                                </div>

                                <div class="form-group">
                                    <p style="display: inline; font-weight: bold;">Your Address :</p>
                                    <p style="display: inline;">&nbsp;<%= user.getUserAddress() %></p>
                                </div>
                                
                                <div class="form-group">
                                    <p style="display: inline; font-weight: bold;">User Type :</p>
                                    <p style="display: inline;">&nbsp;<%= user.getUserType() %></p>
                                </div>
                                
                                <div class="form-group text-center">
                                    <button class="btn btn-outline-success btn-sm" onclick="goToEditProfile()">Edit here</button>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
