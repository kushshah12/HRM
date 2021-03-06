<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>    
<%@ page import="javax.servlet.*" %>

    <link href="css/menu.css" rel="stylesheet" />
    
	<script src="js/jquery.big-slide.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function() {
      $('.menu-link').bigSlide();
  });
  </script>

<div id="menu" class="panel" role="navigation" style="position: fixed; top: 0px; bottom: 0px; height: 100%; left: 0px; width: 15.625em; transition: left 300ms ease;">
        <ul>
            <li><a href="MainMaster.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Main Master</a></li>
            <li><a href="OtherMaster.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Other Master</a></li>
            <li><a href="EmployeeDetails.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Employee Master</a></li>
            <li><a href="Transaction.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Transactions</a></li>
            <li><a href="yearlyworking.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Yearly working</a></li>
             </ul>
    </div>
<div class="main" role="main" style="background-image: url(images/header.jpg); height:550px;">
<div class="wrap push" style="left: 0px; transition: left 300ms ease;">
        <a href="#menu" class="menu-link" >&#9776;</a>
 <div id="content" class="content full">
 
  <div class="featured-blocks">
   <div class="container">
   <h2 align="center" style="color: #7F0A97;"> Other Masters</h2><br>
    <div class="row" style="display: flex; justify-content: center;">
    
    <div class="col-md-2 col-sm-2 featured-block" > <a href="LeaveMaster.jsp"><img src="images/DB.jpg" alt="Document Managment" class="img-thumbnail"></a>
	     <h3>Holiday Master</h3>
    </div>
    <div class="col-md-2 col-sm-2 featured-block" > <a href="#"><img src="images/DB.jpg" alt="Document Managment" class="img-thumbnail"></a>
	     <h3>Leave Master</h3>
    </div>
    <div class="col-md-2 col-sm-2 featured-block" > <a href="QualificationMaster.jsp"><img src="images/DB.jpg" alt="Document Managment" class="img-thumbnail"></a>
	     <h3>Qualification Master</h3>
    </div>
    
    <div class="col-md-2 col-sm-2 featured-block" > <a href="EmployeeType.jsp"><img src="images/DB.jpg" alt="Document Managment" class="img-thumbnail"></a>
	     <h3>Employee Type Master</h3>
    </div>
    
    <div class="col-md-2 col-sm-2 featured-block" > <a href="AssetMaster.jsp"><img src="images/DB.jpg" alt="Document Managment" class="img-thumbnail"></a>
	     <h3>Asset Master</h3>
    </div>
    
    </div>
   </div>
  </div>
    
 </div>
 </div>
</div>

<%@ include file="footer.jsp"%>