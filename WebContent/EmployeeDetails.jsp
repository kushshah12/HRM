<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>    
<%@ page import="javax.servlet.*" %>
	
	<link href="css/myformcss.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="css/menu.css" rel="stylesheet" />
    
	<script src="js/jquery.big-slide.js"></script>
	<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function() {
      $('.menu-link').bigSlide();
  });
  
  $(function(){ $( "#joiningdate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});

$( "#offerdate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});
$( "#confirmdate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});
$( "#retirment" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});
$( "#enddate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});

$( "#birthdate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1950:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});

$( "#issuedate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});

$( "#handoverdate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});

$( "#dateofissue" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
	});

$( "#validdate" ).datepicker({
		dateFormat: "dd-mm-yy",
		yearRange: "1980:2020",
		changeMonth: true,
		changeYear: true,
		altFormat: "dd-mm-yy",
		navigationAsDateFormat: true,
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
<div class="main" role="main">
  <div class="wrap push" style="left: 0px; transition: left 300ms ease;">
        <a href="#menu" class="menu-link" >&#9776;</a>
        
      <div id="content" class="content full">
        	<div class="container">
          		<div class="page">
                  <div class="row">
                  	<div class="col-md-12">
                          <div class="accordion" id="toggleArea">
                            <div class="accordion-group panel">
                              <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseOne"> Basic Details <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseOne" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Salutation<span style="color: red;"> *</span></label>
									    <select id="societyname" name="societyname" class="form-control" required="required">
									    <option id="Mr">Mr</option>
									    <option id="Mrs">Mrs</option>
									    <option id="Mrs">Miss</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Full Name<span style="color: red;"> *</span></label>
									    <input type="text" name="buildingname" class="form-control" placeholder="Full Name" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>User ID</label>
									   	<input type="text" name="userid" class="form-control" placeholder="User Id" required/>
									    </div>
									
										<div class="col-md-6">
									    <label>Date Of Joining<span style="color: red;"> *</span></label>
									   	<input type="text" name="joiningdate" id="joiningdate" class="form-control" placeholder="Date Of Joining" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Date Of Birth<span style="color: red;"> *</span></label>
									   	<input type="text" name="birthdate" id="birthdate" class="form-control" placeholder="Date Of Birth" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Gender</label>
									   	<select id="gender" name="gender" class="form-control">
									   	<option id="male">Male</option>
									   	<option id="female">Female</option>
									   	<option id="not">Not Applicable</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Company</label>
									   	<select id="company" name="company" class="form-control">
									    </select>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- End Toggle --> 
                              <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseTwo"> Employment Details <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseTwo" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Status<span style="color: red;"> *</span></label>
									    <select id="status" name="status" class="form-control" required="required">
									    <option id="active">Active</option>
									    <option id="left">Left</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Employment Type<span style="color: red;"> *</span></label>
									    <select id="emptype" name="emptype" class="form-control" required="required">
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Holiday List</label>
									   	<input type="text" name="userid" class="form-control" placeholder="Holiday List" required/>
									    </div>
									
										<div class="col-md-6">
									    <label>Offer Date<span style="color: red;"> *</span></label>
									   	<input type="text" name="offerdate" id="offerdate" class="form-control" placeholder="Offer Date" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Confirmation Date<span style="color: red;"> *</span></label>
									   	<input type="text" name="confirmdate" id="confirmdate" class="form-control" placeholder="Confirmation Date" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Contract End Date<span style="color: red;"> *</span></label>
									   	<input type="text" name="enddate" id="enddate" class="form-control" placeholder="Contract End Date" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Date Of Retirement<span style="color: red;"> *</span></label>
									   	<input type="text" name="retirment" id="retirment" class="form-control" placeholder="Date Of Retirement" required>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                          <br><br>
                          <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseThree"> Assets Allocated <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseThree" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Date of Issue<span style="color: red;"> *</span></label>
									   	<input type="text" name="issuedate" id="issuedate" class="form-control" placeholder="Date Of Issue" required>
									    </div>
									   
									    <div class="col-md-6">
									    <label>Asset Master<span style="color: red;"> *</span></label>
									    <select id="asset" name="asset" class="form-control" required="required">
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Remarks</label>
									   	<input type="text" name="remarks" class="form-control" placeholder="Remarks" required/>
									    </div>
									
									    <div class="col-md-6">
									    <label>Handover Date<span style="color: red;"> *</span></label>
									   	<input type="text" name="handoverdate" id="handoverdate" class="form-control" placeholder="Handover Date" required>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                          <br><br>
                          <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseFour"> Job Profile <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseFour" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Branch/Site Name<span style="color: red;"> *</span></label>
									   	<select id="branch" name="branch" class="form-control" required="required">
									    </select>
									    </div>
									   
									    <div class="col-md-6">
									    <label>Department<span style="color: red;"> *</span></label>
									   	<select id="department" name="department" class="form-control" required="required">
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Designation<span style="color: red;"> *</span></label>
									   	<select id="designation" name="designation" class="form-control" required="required">
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Company Email<span style="color: red;"> *</span></label>
									   	<input type="text" name="companyemail" class="form-control" placeholder="Company Email" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Notice(Days)</label>
									   	<input type="text" name="noticedays" class="form-control" placeholder="Notice Days"/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Salary Mode<span style="color: red;"> *</span></label>
									   	<select id="salarymode" name="salarymode" class="form-control" required="required">
									   	<option id="Bank">Bank</option>
									   	<option id="Cash">Cash</option>
									   	<option id="Cheque">Cheque</option>
									    </select>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                          <br><br>
                          <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapsesixth"> Organization Profile <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapsesixth" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Reports to<span style="color: red;"> *</span></label>
									   	<select id="reportto" name="reportto" class="form-control" required="required">
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Leave Approver<span style="color: red;"> *</span></label>
									   	<select id="leaveapprover" name="leaveapprover" class="form-control" required="required">
									    </select>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                          <br><br>
                          <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseFifth"> Contact Details <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseFifth" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Cell Number<span style="color: red;"> *</span></label>
									   	<input type="text" name="cellnumber" class="form-control" placeholder="Cell Number" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>LandLine Number<span style="color: red;"> *</span></label>
									   	<input type="text" name="landlinenumber" class="form-control" placeholder="LandLine Number" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Personal Email<span style="color: red;"> *</span></label>
									   	<input type="text" name="personalemail" class="form-control" placeholder="Personal Email" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Permanent Address Type<span style="color: red;"> *</span></label>
									   	<select id="addtype" name="addtype" class="form-control" required="required">
									   	<option id="rented">Rented</option>
									   	<option id="owned">Owned</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Permanent Address<span style="color: red;"> *</span></label>
									   	<input type="text" name="permanentadd" class="form-control" placeholder="Permanent Address" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Present Address</label>
									   	<input type="text" name="presentadd" class="form-control" placeholder="Present Address"/>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                          <br><br>
                          <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseseventh"> Emergency Contact Details <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseseventh" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Emergency Contact<span style="color: red;"> *</span></label>
									   	<input type="text" name="emecontact" class="form-control" placeholder="Emergency Contact" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Relation<span style="color: red;"> *</span></label>
									   	<input type="text" name="relation" class="form-control" placeholder="Relation" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Emergency Phone<span style="color: red;"> *</span></label>
									   	<input type="text" name="emephone" class="form-control" placeholder="Emergency Phone" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Current Address Type<span style="color: red;"> *</span></label>
									   	<select id="curraddtype" name="curraddtype" class="form-control" required="required">
									   	<option id="rented">Rented</option>
									   	<option id="owned">Owned</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Current Address<span style="color: red;"> *</span></label>
									   	<input type="text" name="currentadd" class="form-control" placeholder="Current Address" required/>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                          <br><br>
                          <div class="accordion-heading togglize"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseeight"> Personal Details <i class="fa fa-plus-circle"></i> <i class="fa fa-minus-circle"></i> </a> </div>
                              <div id="collapseeight" class="accordion-body collapse">
                                <div class="accordion-inner">
                                	<form action="BuildingServlet" method="post">
    
									    <div class="row">
									    <div class="form-group">
									    <input type = "text" name = "save" value = "add" style="visibility: hidden;"/>
									    <fieldset >
									   
									    <div class="col-md-6">
									    <label>Passport Number<span style="color: red;"> *</span></label>
									   	<input type="text" name="passno" class="form-control" placeholder="Passport Number" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Date of Issue<span style="color: red;"> *</span></label>
									   	<input type="text" name="issuedate" id="dateofissue" class="form-control" placeholder="Date Of Issue" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Valid Upto<span style="color: red;"> *</span></label>
									   	<input type="text" name="validdate" id="validdate" class="form-control" placeholder="Valid Upto" required>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Place of Issue<span style="color: red;"> *</span></label>
									   	<input type="text" name="issueplace" class="form-control" placeholder="Place of Issue" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Marital Status<span style="color: red;"> *</span></label>
									   	<select id="maritalstatus" name="maritalstatus" class="form-control" required="required">
									   	<option id="single">Single</option>
									   	<option id="married">Married</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Blood Group<span style="color: red;"> *</span></label>
									   	<select id="bloodgroup" name="bloodgroup" class="form-control" required="required">
									   	<option id="op">O+</option>
									   	<option id="on">O-</option>
									   	<option id="ap">A+</option>
									   	<option id="an">A-</option>
									   	<option id="bp">B+</option>
									   	<option id="bp">B-</option>
									   	<option id="abp">AB+</option>
									   	<option id="abn">AB-</option>
									    </select>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Family Background<span style="color: red;"> *</span></label>
									   	<input type="text" name="familybackground" class="form-control" placeholder="Family Background" required/>
									    </div>
									    
									    <div class="col-md-6">
									    <label>Health Details<span style="color: red;"> *</span></label>
									   	<input type="text" name="healthdetails" class="form-control" placeholder="Health Details" required/>
									    </div>
									    
									     </fieldset>
									     </div>
									     </div>
									 </form>
                                
                                </div>
                            </div>
                          <!-- End Toggle -->
                    	</div>
                  </div>
        		</div>
      		</div>
      		</div>
    	</div>
  </div>




<%@ include file="footer.jsp"%>   