<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>    
  
  
  <!-- Start Content -->
  <div class="main" role="main" style="background-image: url(images/13.jpg); height:550px;">
    <div id="content" class="content full">
      
     <div class="col-md-4 col-sm-4 login-form">
                        	<h3 class="mylogin">Login</h3>
                        	<form action = "LoginServlet" method = "post">
                        	<%
                        	String login_msg=(String)request.getAttribute("error");  
							if(login_msg!=null){
						    	   out.println("<div><font color=red size=4px>"+login_msg+"</font></div><br>");
							}
							if(session == null || request.getAttribute("user")==null){
								out.println("<div><font color=red size=4px align=center>"+"Session Expired"+"</font></div><br>");
							}
						      %>
						      
                        		<div class="input-group">
  									<span class="input-group-addon"><i class="fa fa-user"></i></span>
  									<input type="text" name="username" class="form-control" placeholder="Username">
								</div>
                             <br>
                        		<div class="input-group">
  									<span class="input-group-addon"><i class="fa fa-lock"></i></span>
  									<input type="password" name="passwd" class="form-control" placeholder="Password">
								</div>
                             <div class="checkbox">
                             	
                             </div>
                             <button type="submit" class="btn btn-primary myloginsubmit">Login</button>
                             
                     		</form>
            			</div>
              			
    </div>
  </div>
  
  
  
 <%@ include file="footer.jsp"%>  