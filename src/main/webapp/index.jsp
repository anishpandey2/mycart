

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.cart.FactoryProvider" %>
<%@page import="com.cart.dao.ProductDao" %>
<%@page import="com.cart.dao.CategoryDao" %>
<%@page import="java.util.List" %>
<%@page import="com.cart.entities.Product" %>
<%@page import="com.cart.entities.Category" %>
<%@page import="com.cart.helper.Helper" %>


<%
                    String cat=request.getParameter("category");
                    
                    ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                    List<Product> list=null;
                    if(cat==null){
                        list=dao.getAllProducts();
                    }
                    else if(cat.trim().equals("all")){
                        list=dao.getAllProducts();
                    }
                    else{
                        int cid=Integer.parseInt(cat.trim());
                        list=dao.getAllProductsById(cid);
                        }
                
                
                
            
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cdao.getAllCategories();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #e2e2e2;">
        <%@include file="components/navbar.jsp" %>


        <div class="container-fluid">
            <div class="row mt-3 ">




                <!--Show categories-->
                <div class="col-md-2">

                    <div class="list-group mt-4">

                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active form-control-sm">
                            All Products
                        </a>


                        <%
                        for(Category c:clist){
                
                        %>


                        <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action form-control-sm"><%= c.getCategoryTitle() %></a>


                        <%
                            }
                
                        %>

                    </div>

                </div>

                <!--Show products-->
                <div class="col-md-10">

                    <div class="row mt-4">

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing products-->

                                <%
                            
                                 for(Product p:list){

                                %>

                                <div class="card product-card" >
                                    <div class="container text-center">
                                        <img style="max-height: 200px; max-width: 100%;width: auto;" src="img/products/<%= p.getpPhoto() %>" class="card-img-top m-1" alt="...">
                                    </div>
                                    <div class="card-body text-center">
                                        <h6 class="card-title text-center"> <%= p.getpName() %></h6>

                                        <p style="font-size: 12px;" class="card-text">
                                            <%= Helper.get10Words(p.getpDesc()) %>
                                        </p>

                                    </div>


                                    <div class="card-footer text-center">

                                        <button style="font-size: 11px;" class="btn btn-sm custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>',<%= p.getPriceAfterApplyingDiscount() %>)">Add to cart</button>
                                        <button style="font-size: 11px;inline-box-align: inherit;" class="btn btn-sm btn-outline-success"> &#8377; <%=p.getPriceAfterApplyingDiscount()%>/- </button>
                                        <span style="font-size: 9px;" class="text-secondary discount-label">&#8377;<%=p.getpPrice()%>, <%=p.getpDiscount()%>% off</span>
                                    </div>

                                </div>


                                <%
                                    }

                                    if(list.size()==0){
                                        out.println("<h6>No items in this category</h6>");
                                    }
    
                                %>




                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>









    </body>
</html>
