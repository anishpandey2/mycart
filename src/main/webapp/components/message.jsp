<%
String message=(String)session.getAttribute("message");

if(message!=null){

%>
<div class="alert alert-success alert-dismissible fade show mt-1" role="alert">
    <strong style="font-size: 13px;"><%= message %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>


<%
    }

session.removeAttribute("message");

%>