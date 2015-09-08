<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@ include file="myjs.jsp"%>

<link href="css/menu.css" rel="stylesheet">
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


  $('.add').click(function (e) {

	  $('#adddesignation').css("display","block");
	  $("#saveaction").val('add');
	  });


  
  $('.edit').click(function (e) {

	  var tablerow = $(".footable input[type='checkbox']:checked").parent("td").length;
	  var rowno = $(".footable input[type='checkbox']:checked").parent("td");
	  if(tablerow == 0){
		  alert('Please select atleast one row');
	  } else if(tablerow > 1){
		  alert('You can select only one row at a time');
	  }else{
		  $('#adddesignation').css("display","block");
		  $("#saveaction").val('edit');  
			  var id = rowno.attr("id");
			  $.ajax({
				  type:"post",
				  url:"DesignationMasterServlet",
				  data:{action:"getdata",id:id},
				  success:function(data){
					  $("#desgnid").val(id);
					  $.each(data, function(key,value){
						  $('#groupname').val(value.groupname);
						  $('#companyname').val(value.companyname);
						  $('#designationname').val(value.designationname);
						  $('#rolesresp').val(value.role);
					  });
				  }
			  });
			 
	  }
	  });



  $('.delete').click(function (e) {
	  var tablerow = $(".footable input[type='radio']:checked").parents("tr");           
	  var id = tablerow.attr("id");
	  var slcted=confirm("Are You Sure You Want to delete?");
	  if(slcted==true)
	  {
		  $.ajax({
			  type:"post",
			  url:"DesignationMasterServlet",
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

  $('select[name="groupname"]').change(function() {
	  
	  //alert("dropdown change.."+$(this).val());
	  var groupid=$('select[name="groupname"]').val();
	  $.ajax({
		     type: "POST",
		     url: "TestCompanyServlet",
		     dataType : "json",
		     data:{groupid:groupid},
		     success: function(data){
		    	 var out = '';
		     		$.each(data, function(key,value){
		     			out = out + '<option value='+value.companyid+'>'+value.companyname+'</option>';
		     		})
		     	
		     		$('select[name="companyname"]').html(out);
		     		
		     }
		});
	  
		
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
	     url: "DesignationMasterServlet",
	     dataType : "json",
	     success: function(data){
	     	var out = '';
	     		$.each(data, function(key,value){
	     			out = out + '<tr><td id = '+value.designationid+'><input type="checkbox" name="selrow" value = '+value.designationid+'></td><td>'+value.groupname+'</td>';
	     			out = out + '<td>'+value.companyName+'</td>';
	     			out = out + '<td>'+value.designationName+'</td>';
	     			out = out + '<td>'+value.role+'</td></tr>';
	     		})
	     		//alert(out);
	     	$('.footable tbody').append(out).trigger('footable_redraw'); /* To set default page size */
	     		
	     }
	});
//////////////////////////////////groupmaster....
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
  <h2 ><a href="MainMaster.jsp" style="color: #7F0A97;">Designation Master</a></h2>
  </center>
  
  



<div class="main" role="main">

<div class="wrap push" style="left: 0px; transition: left 300ms ease;">
        <a href="#menu" class="menu-link" >&#9776;</a>
    <div id="content" class="content full">
    
    <div class="col-md-6" id="adddesignation" style="margin-left: 25%;display: none;">
    <div class="displaydata"></div>	
    <button id="closebutton" style="margin:-10px; margin-left: 650px; background-color: #7F0A97;border-color: #7F0A97; display: block;" onclick="window.location.reload()">
    	<i class="fa fa-times" style="color: #FFF;"></i>
    </button>
    <form class="displayform" action="AddDesignationServlet" method="post" style="display: block;">
    <input type = "hidden" name = 'saveaction' value = 'add' id="saveaction" />
    <input type = "hidden" name = 'desgnid' value = '' id="desgnid" />
    
    <div class="form-group">
    
    <div class="row">
    <div class="col-md-6">
    <label>Group Name:</label>
    <select id="groupname" name="groupname" class="form-control">
    </select>
    </div>
    <div class="col-md-6">
    <label>Company Name:</label>
    <select id="companyname" name="companyname" class="form-control">
    </select>
    </div>
    </div>
    
    <div class="row">
    <div class="col-md-6">
    <label>Designation Name:</label>
    <input type="text" id="designationname" name="designationname" class="form-control" placeholder="Department Name" />
    </div>
     <div class="col-md-6">
    <label>Roles/Responsibilities:</label>
    <input type="text" id="rolesresp" name="rolesresp" class="form-control" placeholder="Roles/Responsibilities" />
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
        <th>Designation Name</th>
        <th>Roles/Responsibilities</th>
	</thead>
	<tbody> </tbody>
      <tfoot class="hide-if-no-paging">
		<tr>
			<td colspan="5">
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
    