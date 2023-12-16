<%@page import="com.cart.entities.User" %>
<%@page import="com.cart.entities.Category" %>
<%@page import="com.cart.dao.CategoryDao" %>
<%@page import="com.cart.FactoryProvider" %>
<%@page import="com.cart.helper.Helper" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>


<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
    
        session.setAttribute("message","You are not logged in !!");
        response.sendRedirect("login.jsp");
        return;
        
    }else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message","Your are not admin ! do not access this page");
            response.sendRedirect("login.jsp");
            
            return;
    }
    }

%>

<%
    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
    List<Category> list=cdao.getAllCategories();
    
    //getting count
    Helper help=new Helper();
    Map<String,Long> m=help.getCounts(FactoryProvider.getFactory());

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>


        <div style="max-width: 600px;" class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>


            <!--first row-->
            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px;" class="img-fluid rounded-circle" src="img/users.png" alt="user_icon"> 
                            </div>
                            <h5><%= m.get("userCount") %></h5>
                            <h5 class="text-uppercase text-muted">Users</h5> 
                        </div>

                    </div>
                </div>

                <!--second col-->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px;" class="img-fluid rounded-circle" src="img/categories.png" alt="user_icon"> 
                            </div>
                            <h5 class="mt-2"><%= list.size() %></h5>
                            <h5 class="text-uppercase text-muted">Categories</h5> 
                        </div>

                    </div>
                </div>


                <!--third col-->
                <div class="col-md-4 ">

                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px;" class="img-fluid rounded-circle" src="img/products.png" alt="user_icon"> 
                            </div>
                            <h5><%= m.get("productCount") %></h5>
                            <h5 class="text-uppercase text-muted">Products</h5> 
                        </div>

                    </div>
                </div>

            </div>

            <!--second row-->

            <div class="row mt-3">

                <!--second row first column-->
                <div  class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px;" class="img-fluid rounded-circle" src="img/addCategory.png" alt="user_icon"> 
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h5 class="text-uppercase text-muted">Add Categories</h5> 
                        </div>
                    </div>
                </div>

                <!--second row second column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px;" class="img-fluid rounded-circle" src="img/addProduct.png" alt="user_icon"> 
                            </div>
                            <p class="mt-2">Click here to add new Product</p>
                            <h5 class="text-uppercase text-muted">Add Products</h5> 
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--add category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div  class="modal-header custom-bg">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body">

                        <form action="AddCategoryServlet" method="post">


                            <div class="form-group">
                                <input type="text" class="form-control form-control-sm" name="catTitle" placeholder="Enter category title" required>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success btn-sm"> Add Category</button>
                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>


        <!--end of add category modal-->



        <!--add product modal-->



        <!-- Modal -->
        <div style="max-width: 400px;margin:auto;" class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--form-->

                        <form action="AddProductServlet" method="post" enctype="multipart/form-data">

                            <!--product title-->
                            <div class="form-group">
                                <input type="text" name="pName" class="form-control form-control-sm" placeholder="Enter title of product" required>
                            </div>

                            <!--product description-->
                            <div class="form-group">
                                <textarea style="height: 100px;" class="form-control" name="pDesc" placeholder="Enter product description"></textarea>
                            </div>

                            <!--product price-->
                            <div class="form-group">
                                <input type="number" name="pPrice" class="form-control form-control-sm" placeholder="Enter price of product" required>
                            </div>

                            <!--product discount-->
                            <div class="form-group">
                                <input type="number" name="pDiscount" class="form-control form-control-sm" placeholder="Enter product discount" required>
                            </div>

                            <!--product quantity-->
                            <div class="form-group">
                                <input type="number" name="pQuantity" class="form-control form-control-sm" placeholder="Enter product quantity" required>
                            </div>

                            <!--product categories-->




                            <div class="form-group">
                                <select name="catId" class="form-control form-control-sm">
                                    <option value="#">--Select--</option>

                                    <%
                                        for(Category c:list){
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle() %></option>

                                    <% } %>
                                </select>
                            </div>

                            <!--product file-->
                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label><br>
                                <input class="form-control-sm" type="file" name="pPic" id="pPic" required>
                            </div>

                            <!--submit button-->
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success btn-sm"> Add Product</button>
                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                            </div>
                        </form>



                        <!--end form-->


                    </div>

                </div>
            </div>
        </div>



        <!--end of add product modal-->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
