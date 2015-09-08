<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<head>
<link href="css/myformcss.css" rel="stylesheet" type="text/css" />
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="footable/css/footable.core.css" rel="stylesheet" type="text/css" />
<link href="footable/css/footable.standalone.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="footable/js/footable.js" type="text/javascript"></script>
<script src="footable/js/footable.filter.js" type="text/javascript"></script>
<script src="footable/js/footable.paginate.js" type="text/javascript"></script>
<script src="footable/js/footable.sort.js" type="text/javascript"></script>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link href="css/menu.css" rel="stylesheet" />
    
	<script src="js/jquery.big-slide.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function() {
      $('.menu-link').bigSlide();
  });
  
  $(function(){
	  
	  $( "#date" ).datepicker({
			dateFormat: "dd-mm-yy",
			yearRange: "1980:2020",
			changeMonth: true,
			changeYear: true,
			altFormat: "dd-mm-yy",
			navigationAsDateFormat: true,
		});
	  
	  $('.delete').click(function (e) {
			  var tablerow = $(".footable input[type='checkbox']:checked").parent("td");  
			  var id1 = tablerow.attr('id');
			  var ids = '';
			  var action = 'delete';
			  $.each(tablerow, function(id){
				  ids = id1;
			  });
			  confirm("Are You Sure You Want to delete?");
			  $.ajax({
				     type: "POST",
				     url: "HolidayServlet",
				     data:{action:"delete", id:ids},
				     success: function(){
				    	 location.reload();
				     }
			  });
			 // location.reload();
			  });
		
	  $('.edit').click(function (e) {
		  var tablerow = $(".footable input[type='checkbox']:checked").parent("td"); 
		  var tablerowlen = $(".footable input[type='checkbox']:checked").parent("td").length;
		  var id1 = tablerow.attr('id');
		  var action = 'edit';
		  if(tablerowlen == 0){
			  alert('Please select atleast one row');
		  } else if(tablerow > 1){
			  alert('You can select only one row at a time');
		  }else{
			  $.ajax({
				     type: "POST",
				     url: "HolidayServlet",
				     data:{action:"edit", id:id1},
				     success: function(data2){
				    	 $.each(data2, function(key,value){
					    	 $('#date').val(value.date1);
					    	 $('#leavecat').val(value.leaveCategory);
					    	 $('#leavename').val(value.leaveName);
					    	 $('#remark').val(value.remark)
					    	 $('#fyear').val(value.fname); 
					    	 $('#action1').val('editsave');
					    	 $('#id').val(id1);
				    	 });
				     }
			  });
		  }
		  //location.reload();
	  });
	  
	  $(document).ready(function(){
		  	 $.ajax({
		     type: "POST",
		     url: "HolidayServlet",
		     data : {action:"onload"},
		     dataType : "json",
		     success: function(data){
		     	
		     	var out = '';
		     		$.each(data, function(key,value){
		     			
		     			out = out + '<tr><td id = '+value.id+'><input type="checkbox" name="selrow" value = '+value.id+'></td><td>'+value.leaveName+'</td>';
		     			out = out + '<td>'+value.date1+'</td>';
		     			out = out + '<td>'+value.leaveCategory+'</td>';
		     			out = out + '<td>'+value.remark+'</td>';
		     			out = out + '<td>'+value.fname+'</td></tr>';
		     		})
		     		
		     	$('.footable tbody').append(out).trigger('footable_redraw'); /* To set default page size */
		     }
		});
		  	 
		  	  var i;
			  var out='<option>-select-</option>';
			  for(i=1980;i<= new Date().getFullYear();i++){
				  
				  out=out+'<option value='+i+'>'+i+'</option>';
				  
			  }
			  $('#fyear').html(out); 
			  
	  });
	  
	  
	 
	  //$('.footable').footable();

	//  $('.footable').footable().bind('footable_filtering', function (e) {
	 // });

	  $('.clear-filter').click(function (e) {
	    e.preventDefault();
	    $('.filter-state').val('');
	    $('.footable').trigger('footable_clear_filter');
	  });
	  
	  $('.filter-state').change(function (e) {
		    e.preventDefault();
		    $('.footable').trigger('footable_filter', {filter: $('#filter').val()});
		  });
	  

	  /* $(document).ready(function(){
			$.ajax({
			     type: "POST",
			     url: "BasicServlet",
			     dataType : "json",
			     success: function(data){
			     	
			     	var out = '';
			     		$.each(data, function(key,value){
			     			
			     			out = '<option id="'+value.company+'">'+value.company+'</option>';
			     		})
			     	$('#company').html(out); 
			     		
			     }
			});
			
		}); */
		
	  $('.sort-column').click(function (e) {
		    e.preventDefault();

		    //get the footable sort object
		    var footableSort = $('table').data('footable-sort');

		    //get the index we are wanting to sort by
		    var index = $(this).data('index');
			alert(index);
		    //get the sort order
		    var ascending = $(this).data('ascending');

		    footableSort.doSort(index, ascending);
		});
	
		
	 // $(document).ready(function(){
		//	alert('hi');
			
		//});
  });
  
  </script>
  </head>

<!-- Site Showcase -->
<div id="menu" class="panel" role="navigation" style="position: fixed; top: 0px; bottom: 0px; height: 100%; left: 0px; width: 15.625em; transition: left 300ms ease;">
        <ul>
            <li><a href="MainMaster.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Main Master</a></li>
            <li><a href="OtherMaster.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Other Master</a></li>
            <li><a href="EmployeeDetails.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Employee Master</a></li>
            <li><a href="Transaction.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Transactions</a></li>
            <li><a href="yearlyworking.jsp" style="text-decoration:none"><i class="fa fa-database fa-fw"></i>  Yearly working</a></li>
             </ul>
    </div>
  <div class="site-showcase">
  </div>
  <!-- Start Content -->
  <div class="main" role="main">
  <div class="wrap push" style="left: 0px; transition: left 300ms ease;">
        <a href="#menu" class="menu-link" >&#9776;</a>
      <div id="content" class="content full">
        	<div class="container">
          		<div class="page">
                  <div class="row">
                  	<div class="col-md-12">
                                	<form action="HolidayServlet" method="post">
    
									    <div class="form-group">
									    <div class="row">
									    <input type = "text" name = "action1" id="action1" value = "save" style="visibility: hidden;"/>
									    <input type = "text" name = "id" id="id" style="visibility: hidden;"/>
									    </div>
									    <fieldset>
									   
									   <div class="row">
									   <div class="col-md-6">
									    <label>Date<span style="color: red;"> *</span></label>
									   	<input type="text" name="date" id="date" class="form-control" placeholder="Date" required>
									    </div>
									   
									    <div class="col-md-6">
									    <label>Leave Category<span style="color: red;"> *</span></label>
									    <select id="leavecat" name="leavecat" class="form-control" required="required">
									    <option id="blank"></option>
									    <option id="reg">Regional</option>
									    <option id="nat">National</option>
									    </select>
									    </div>
									    </div>
									    
									    <div class="row">
									    <div class="col-md-6">
									    <label>Leave Name<span style="color: red;"> *</span></label>
									    <input type="text" name="leavename" id = "leavename" class="form-control" placeholder="Leave Name" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Remarks</label>
									   	<input type="text" name="remarks" id = "remark" class="form-control" placeholder="Remarks" required/>
									    </div>
									    </div>
									    
									    <div class="row">
									    <div class="col-md-6">
									    <label>Financial Year<span style="color: red;"> *</span></label>
									   	<select id="fyear" name="fyear" class="form-control" required="required">
									   	</select>
									    </div>
									    </div>
									    
									    <div class="row">
									    <div class="form-group" style="margin-left: 45%;">
    									<input type="submit" value="Save" class="btn btn-primary mybtn addbutton" />
										<input type="reset" value="Reset" class="btn btn-primary mybtn">
										</div>    
										</div>
									
									     </fieldset>
									     </div>
									 </form>
									    </div>
                              </div>
                            </div>
                            </div>
                          <!-- End Toggle --> 
			
	<div class="col-md-10" style="margin-left: 10%">
    	<input type="text" id="filter" placeholder="Search">
    	
   		<button type="button" class="btn btn-primary btn-sm mybtn clear-filter">Clear</button>
   		<div style="float: right;">
    			<button type="button" class="btn btn-primary btn-sm mybtn edit">Edit</button>
    			<button type="button" class="btn btn-primary btn-sm mybtn delete">Delete</button>
    		</div>
    </div>
			
    <div class="pagination col-md-10" style="margin-left: 10%;">
        <table class="footable table" id="datasource" data-page-size="5" data-filter="#filter" data-page-navigation=".pagination" data-limit-navigation=5>
			<thead>
				<th data-sort-ignore="true"></th>
				<th> Holiday Name </th>
                <th> Holiday Date </th>
				<th> Category </th>
				<th> Remarks </th>
				<th> Financial Year</th>
				</thead>
			<tbody>	</tbody>
			<tfoot class="hide-if-no-paging">
				<tr>
					<td colspan="6" style="border-color: #7F0A97">
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