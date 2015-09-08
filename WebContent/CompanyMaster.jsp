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

	  var tablerow = $(".footable input[type='checkbox']:checked").parent("td").length;
	  var rowno = $(".footable input[type='checkbox']:checked").parent("td").attr('id');
	  if(tablerow == 0){
		  alert('Please select atleast one row');
	  } else if(tablerow > 1){
		  alert('You can select only one row at a time');
	  }else{
		  $.ajax({
			     type: "POST",
			     url: "GroupMasterServlet",
			     dataType : "json",
			     success: function(data){
			     	var out = '';
			     		$.each(data, function(key,value){
			     			alert(value.groupid);
			     			if(value.groupid == rowno){
			     				$('#closebutton').css("display","none");
				     				$(".displaydata form").each(function(){
				     					var status = $(".displaydata form").css("display");
					     				if(status == 'block' || status == 'none'){
					     					$(".displaydata form").css("display","none");
					     				}
				     				});
				     				
					     			out = '<button style="margin:-10px; margin-left: 650px; background-color: #7F0A97;border-color: #7F0A97;" onclick="location.href=\'/HumanResource/GroupMaster.jsp\'">'
						     	    +'<i class="fa fa-times" style="color: #FFF;"></i></button>'
					     			+'<form action="AddGroupServlet" method="post" id="editform" style="display: block;">'+'<div class="row">'+'<div class="form-group">'
					     			+'<div class="col-md-6" style="display: none;">'
					     			+'<input type = "hidden" name = "id" style="visibility: hidden;" value="'+value.groupid+'"></input>'
					     			+'<input type = "text" name = "save" value="edit" style="visibility: hidden;"/>'
					     		    +'</div>'
					     		    +'<div class="col-md-6">'+'<label>Group Name:</label>'
					     		    +'<input type="text" name="groupName" class="form-control" placeholder="City Name"value=\"'+value.groupname+'\" required/>'+'</div>'
					     		    +'</div>'+'</div>'
					     		    +'<div class="row">'+'<div class="form-group" style="margin-left: 40%;">'
					     		    +'<input type="submit" value="Ok" class="btn btn-primary mybtn editbutton" />'
					     		    +'<input type="reset" value="Cancel" class="btn btn-primary mybtn"  style="margin-left: 5%;">'
					     		    +'</div></div>'
					     		    +'</form>';
					     			$("#addcity").css("display","block");
					     			$(".displayform").css("display","none");
			     				
			     		}
			     		})
			     	$('.displaydata').append(out); /* To set default page size */
			     		
			     }
		  });
  }
	  });

 $('.add').click(function () {
	  var action = 'add';
	  $.ajax({
		     type: "POST",
		     url: "GroupMaster.jsp",
		     data:{action:"add"},
		     success: function(){
		    	 $("#addcity").css("display","block");
		     }
	  });
	  });

  $('.delete').click(function (e) {
	  var tablerow = $(".footable input[type='checkbox']:checked").parent("td");  
	  var id1 = tablerow.attr('id');
	  var ids = '';
	  var action = 'delete';
	  var out = '';
	  $.each(tablerow, function(id){
		  ids = id1;
	  });
	  confirm("Are You Sure You Want to delete?");
	  $.ajax({
		     type: "POST",
		     url: "ZoneMasterServlet",
		     data:{action:"delete", id:ids},
		     success: function(id){
		     }
	  });
	  location.reload();
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
	     url: "GroupMasterServlet",
	     dataType : "json",
	     success: function(data){
	    	 console.log(data);
	     	var out = '';
	     		$.each(data, function(key,value){
	     			out = out + '<tr><td id = '+value.groupid+'><input type="checkbox" name="selrow" value = '+value.groupid+'></td><td>'+value.groupid+'</td>';
	     			out = out + '<td>'+value.groupname+'</td></tr>';
	     		})
	     	$('.footable tbody').append(out).trigger('footable_redraw'); 
	     		
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
  <h2 ><a href="MainMaster.jsp" style="color: #7F0A97">Company Master</a></h2>
  </center>
<div class="main" role="main">
<div class="wrap push" style="left: 0px; transition: left 300ms ease;">
        <a href="#menu" class="menu-link" >&#9776;</a>
    <div id="content" class="content full">
    
    <div class="col-md-6" id="addcity" style="margin-left: 25%; display: none;">
    <div class="displaydata"></div>	
    <button id="closebutton" style="margin:-10px; margin-left: 650px; background-color: #7F0A97;border-color: #7F0A97; display: block;" onclick="location.href='/HumanResource/GroupMaster.jsp'">
    	<i class="fa fa-times" style="color: #FFF;"></i>
    </button>
    <form class="displayform" action="AddGroupServlet" method="post" style="display: block;">
    <input type = "text" name = 'save' value = 'add' style="visibility: hidden;"/>
    <div class="row">
    <div class="form-group">
    <div class="col-md-6" style="justify-content: center;">
    <label>Group Name:</label>
    <input type="text" name="groupName" class="form-control" placeholder="Group Name" required/>
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
    
    
    <div class="col-md-2" > </div>
    
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
		<th>Group Id</th>
        <th>Company Id</th>
        <th>Company Name</th>
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
       <div class = "data" style="visibility: hidden;"> </div>    
       <br style="clear: both;">    
    
</div>
</div>
</div>

<%@ include file="footer.jsp"%>