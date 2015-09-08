<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@ include file="myjs.jsp"%>
<link href="css/menu.css" rel="stylesheet" />
    
	<script src="js/jquery.big-slide.js"></script>


<script type="text/javascript">

$(document).ready(function() {
    $('.menu-link').bigSlide();
});


$(function () {
	$('.footable').footable();

  $('.footable').footable().bind('footable_filtering', function (e) {
  });

  $('.clear-filter').click(function (e) {
    e.preventDefault();
    $('.filter-state').val('');
    $('.footable').trigger('footable_clear_filter');
  });

  $('.edit').click(function (e) {

	  $('#adddepartment').css("display","block");
	  var tablerow = $(".footable input[type='checkbox']:checked").parents("td");
	  $("#saveaction").val('edit');  
	  if(tablerow.length==1)
	  {
		  var id = tablerow.attr("id");
		  $.ajax({
			  type:"post",
			  url:"DepartmentMasterServlet",
			  data:{action:"getdata",id:id},
			  success:function(data){
				  $.each(data, function(key,value){
					  $("#deptid").val(id);
					  $('select[name="groupname"]').val(value.groupname);
					  $.ajax({
					       type: "POST",
					       url: "TestCompanyServlet",
					       data:{groupid:value.groupname},
					       dataType : "json",
					       success: function(data){
					        var out = '';
					         $.each(data, function(key,value){
					          out = out + '<option value='+value.companyid+'>'+value.companyname+'</option>';
					         })
					         $('select[name="companyname"]').html(out);
					         
					       }
					  });
					  $('select[name="companyname"]').val(value.companyname);
					  $('input[name="deptname"]').val(value.departmentname);
				  })
			  }
		  });
		 
	  } 
	  else
	  {
		  alert("Select One Row Only..");
	  }        
	  
	  });


  $('.add').click(function (e) {

	 // alert("hi");
	  $('#adddepartment').css("display","block");
	  $("#saveaction").val('add');

	  //addform
	  //window.location = "http://www.google.com";
	  });

  $('.delete').click(function (e) {
	  var tablerow = $(".footable input[type='checkbox']:checked").parents("td");           
	  var id = tablerow.attr("id");
	  var slcted=confirm("Are You Sure You Want to delete?");
	  if(slcted==true)
	  {
		  $.ajax({
			  type:"post",
			  url:"DepartmentMasterServlet",
			  data:{action:"delete",id:id},
			  success:function(data){
				  if(data)
				  {
				  alert("Data deleted Successfully..");
				  }
				  window.location.reload();
			  },
			  error:function(){
				  alert("Some error occurred..");
			  }
		  });
		  //window.location = "http://www.google.com";
	  }
	  });

 


$('#change-page-size').change(function (e) {
	e.preventDefault();
	var pageSize = $(this).val();
	$('.footable').data('page-size', pageSize);
	$('.footable').trigger('footable_initialized');
});


$(document).ready(function(){
	$.ajax({
	     type: "POST",
	     url: "DepartmentMasterServlet",
	     dataType : "json",
	     success: function(data){
	     	var out = '';
	     		$.each(data, function(key,value){
	     			out = out + '<tr><td id = '+value.departmentid+'><input type="checkbox" name="selrow" value = '+value.departmentid+'></td><td>'+value.groupname+'</td>';
	     			out = out + '<td>'+value.companyName+'</td>';
	     			out = out + '<td>'+value.despartmentName+'</td></tr>';
	     		})
	     	$('.footable tbody').append(out).trigger('footable_redraw'); /* To set default page size */
	     		
	     }
	});

	$.ajax({
	     type: "POST",
	     url: "GroupMasterServlet",
	     dataType : "json",
	     success: function(data){
	     	var out = '';
	     		$.each(data, function(key,value){
	     			out = out + '<option value='+value.groupid+'>'+value.groupname+'</option>';
	     		})
	     	
	     		$('select[name="groupname"]').html(out);
	     }
	});

	$('select[name="groupname"]').change(function() {

		  var groupid=$('select[name="groupname"]').val();
		  $.ajax({
		       type: "POST",
		       url: "TestCompanyServlet",
		       data:{groupid:groupid},
		       dataType : "json",
		       success: function(data){
		        var out = '';
		         $.each(data, function(key,value){
		          out = out + '<option value='+value.companyid+'>'+value.companyname+'</option>';
		         })
		         $('select[name="companyname"]').html(out);
		         
		       }
		  });
		  
		  });
});



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
<center>
  <h2 ><a href="MainMaster.jsp" style="color: #7F0A97">Department Master</a></h2>
  </center>


<div class="main" role="main">
	<div class="wrap push" style="left: 0px; transition: left 300ms ease;">
        <a href="#menu" class="menu-link" >&#9776;</a>
    <div id="content" class="content full">
    
    <div class="col-md-6" id="adddepartment" style="margin-left: 25%;display: none;">
    <div class="displaydata"></div>	
    <button id="closebutton" style="margin:-10px; margin-left: 650px; background-color: #7F0A97;border-color: #7F0A97; display: block;" onclick="window.location.reload()">
    	<i class="fa fa-times" style="color: #FFF;"></i>
    </button>
    <form class="displayform" action="AddDepartmentServlet" method="post" style="display: block;">
    <input type = "hidden" name = 'saveaction' value = 'add' id="saveaction" />
    <input type = "hidden" name = 'deptid' value = '' id="deptid" />
    
    <div class="form-group">
    
    <div class="row">
    <div class="col-md-6">
    <label>Group Name:</label>
    <select name="groupname" class="form-control">
    </select>
    </div>
    <div class="col-md-6">
    <label>Company Name:</label>
    <select name="companyname" class="form-control">
    </select>
    </div>
    </div>
    
    <div class="row">
    <div class="col-md-6">
    <label>Department Name:</label>
    <input type="text" name="deptname" class="form-control" placeholder="Department Name" />
    </div>
    </div>
    </div>
    
    <div class="row">
    <div class="form-group" style="margin-left: 40%;">
    <input type="submit" value="Ok" class="btn btn-primary mybtn addbutton" />
    <input type="reset" value="Cancel" class="btn btn-primary mybtn">
    
    </div>
    </div>
    
    </form>
    </div>
    
    
    <div class="col-md-2" >
    
    </div>
    
     
  <div class="col-md-10" style="margin-left: 10%;">
    <input type="text" id="filter" placeholder="Search">
    <button type="button" class="btn btn-primary btn-sm mybtn clear-filter">Clear</button><!--
    <a class="clear-filter" title="clear filter" href="#clear">Clear</a> 
    --><div style="float: right;">
    <button type="button" class="btn btn-primary btn-sm mybtn edit">Edit</button>
    <button type="button" class="btn btn-primary btn-sm mybtn add">Add</button>
    <button type="button" class="btn btn-primary btn-sm mybtn delete">Delete</button>
    </div>
    &nbsp;&nbsp;&nbsp;
    PageSize:
    <select id="change-page-size">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
    </select>
    
    </div>
      
         <div class="pagination col-md-10" style="margin-left: 10%;">
    <table class="footable table" data-filter="#filter" data-page-navigation=".pagination" data-limit-navigation="5">
	<thead>
		<th data-sort-ignore="true"></th>
        <th>Group Name</th>
        <th>Company Name</th>
        <th>Department Name</th>
	</thead>
	<tbody> </tbody>
      <tfoot class="hide-if-no-paging">
		<tr>
			<td colspan="4">
				<div class="pagination pagination-centered"></div>
			</td>
		</tr>
		</tfoot>
    </table>
    </div>
          
           
  
           
       <br style="clear: both;">    
    
</div>
</div>










<%@ include file="footer.jsp"%>
    