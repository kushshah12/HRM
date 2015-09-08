<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Basic Page Needs
  ================================================== -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="format-detection" content="telephone=no">
<!-- CSS
  ================================================== -->
  <style type="text/css">
  
  .logout {
	background-color: #7F0A97;
	border-color: #7F0A97;
	
	}
  </style>
<link href="css/mycss.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="plugins/prettyphoto/css/prettyPhoto.css" rel="stylesheet" type="text/css">
<link href="plugins/owl-carousel/css/owl.carousel.css" rel="stylesheet" type="text/css">
<link href="plugins/owl-carousel/css/owl.theme.css" rel="stylesheet" type="text/css">
<!--[if lte IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
<!-- Color Style -->
<link class="alt" href="colors/color1.css" rel="stylesheet" type="text/css">
<link href="style-switcher/css/style-switcher.css" rel="stylesheet" type="text/css">
<!-- SCRIPTS
  ================================================== -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="js/modernizr.js"></script><!-- Modernizr -->

<title>HIS-ERP</title>    
<link rel="shortcut icon" href="images/icon.ico" />
<%
  String userName = "Login";
  try{
	  
	  if(request.getAttribute("user")!= null){
	  	userName = (String)request.getAttribute("user");
	  	session.setAttribute("name", userName);
	  }
	  if(userName.equalsIgnoreCase("Login") && session.getAttribute("name")!=null){
		  userName = (String)session.getAttribute("name");
	  }
  }catch(Exception e){
  }
  
  String time1=(String)request.getAttribute("time");  
  String time = "";
	if(time1!=null){
		time = "Last Login At "+time1;
		session.setAttribute("time", time);
	}
	if(time.equalsIgnoreCase("") && session.getAttribute("time")!=null){
		time = (String)session.getAttribute("time");
	}
  %>
<script type="text/javascript">
$(function () {
$(".logout").click( function()
		
        {
	alert('Are you sure do you want to Logout?');
			$.ajax({
			     type: "POST",
			     url: "LoginServlet",
			     data:{action:"logout", username:"<%= (String)session.getAttribute("name") %>"},
			     success: function(){
			    	 document.location.href='/HumanResource/login.jsp';
			     }
		  });
			$.session.clear();
			location.reload();
			
        });
     
$(document).ready(function(){
	<%-- console.log('<%= (String)session.getAttribute("name") %>');--%>
	
	var login= '<%= (String)session.getAttribute("name") %>'; 
	if(login == 'null'){
		var path = location.pathname;
		if(path !='/HumanResource/login.jsp'){
			alert('Please Login in to application');
			document.location.href='/HumanResource/login.jsp';
			
		}
	}
});

$('.dropdown').click(function(){
	var path = location.pathname;
	alert(path);
	if(path !='/HumanResource/login.jsp'){
		$('.dropdown').attr('class','dropdown open');
	}
	
},2000);
     
});

</script>

</head>
<body class="home">
<!--[if lt IE 7]>
	<p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
<![endif]-->
<div class="body">
  <!-- Start Site Header -->
  <header class="site-header">
    <div class="top-header hidden-xs">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-6">
            <ul class="horiz-nav pull-left">
              <li class="dropdown">
              	<%-- <a href="login.jsp">
              		<i class="fa fa-user" style="margin:8px;">&nbsp;&nbsp;<%=userName %></i> 
              	</a> --%>
              </li>
              </ul>
          </div>
          <div class="col-md-8 col-sm-6">
            <ul class="horiz-nav pull-right">
                 <!--  <li><a href="http://instagram.com/" target="_blank"><i class="fa fa-instagram" style="margin:8px;"></i></a></li>
                  <li><a href="http://facebook.com/" target="_blank"><i class="fa fa-facebook" style="margin:8px;"></i></a></li>
                  <li><a href="http://twitter.com/" target="_blank"><i class="fa fa-twitter" style="margin:8px;"></i></a></li> -->
                  <div class=dropdown>
                  <button class="fa fa-user btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">  <%=userName %>
					  <span class="caret"></span>
				  </button>
				  <div class="dropdown-menu col-md-12 col-sm-12 col-xs-12" style="width: 220px;">
					   <div style="margin-top:5px;font-weight:bold"><%=time%></div>
				  <div class="col-md-12 col-sm-12 col-xs-12" style="padding:0;background-color:#e2e2e2;height:40px;margin-top: 5px;">
				  <hr style="border-color: #afafaf;clear: both;margin-bottom: -10px;margin-top:-1px">
				  <div class="col-md-6 col-sm-6 col-xs-6"></div>
				  <div class="col-md-6 col-sm-6 col-xs-6">
				  <button type="button" id= "logout" class="fa fa-sign-out btn btn-primary btn-sm mybtn logout" style="margin-top: 20px; margin-left: 10px;" onclick="function();">  Logout</button>
				  </div>
				  </div>
				  </div>
                  </div>
              </ul>
              
            </div>
        </div>
      </div>
    </div>
    <div class="middle-header">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-8 col-xs-8">
             <h1 class="logo"><br><a> HIS-ERP-HRM</a> </h1>
           </div>
          <div class="col-md-8 col-sm-4 col-xs-4">
          <!--<h1 class="logo"> <a href="index.html"><img src="images/logo1.png" alt="Logo"></a> </h1>
          
              --><div class="contact-info-blocks hidden-sm hidden-xs">
              </div>
               <a href="#" class="visible-sm visible-xs menu-toggle"><i class="fa fa-bars"></i></a> 
          </div>
        </div>
      </div>
    </div>
<!--     <div class="main-menu-wrapper">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <nav class="navigation">
              <ul class="sf-menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="about.html">Features</a>
                <ul class="dropdown">
                    <li><a href="agents.html">Document Management</a></li>
                    <li><a href="agent-detail.html">Accounting</a></li>
                    <li><a href="my-properties.html">Stationary Management</a></li>
                    <li><a href="submit.html">Taxation</a></li>
                    <li><a href="pricing.html">Redevelpoment</a></li>
                    <li><a href="login.html">OUV-Management</a></li>
                    <li><a href="404.html">Communication Management</a></li>
                  </ul>
                
                </li>
                <li><a href="login.html">Pricing</a></li>
                 <li><a href="login.html">Blog</a></li> 
                 <li><a href="login.html">Testimonials</a></li>
                <li><a href="contact.html">Contact Us</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div> -->
  </header>
  <!-- End Site Header -->