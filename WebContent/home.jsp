<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@ include file="myjs.jsp"%>

<link rel='stylesheet prefetch' href='https://cdn.jsdelivr.net/foundation/5.0.2/css/foundation.css'>
<link href="css/mtree.css" rel="stylesheet" type="text/css">
<style>
.mtree-demo .mtree {
  background: #EEE;
  margin: 20px auto;
  max-width: 320px;
  border-radius: 3px;
}

.mtree-skin-selector {
  text-align: center;
  background: #EEE;
  padding: 10px 0 15px;
}

.mtree-skin-selector li {
  display: inline-block;
  float: none;
}

.mtree-skin-selector button {
  padding: 5px 10px;
  margin-bottom: 1px;
  background: #BBB;
}

.mtree-skin-selector button:hover { background: #999; }

.mtree-skin-selector button.active {
  background: #999;
  font-weight: bold;
}

.mtree-skin-selector button.csl.active { background: #FFC000; }
</style>


<script src='http://cdnjs.cloudflare.com/ajax/libs/velocity/0.2.1/jquery.velocity.min.js'></script> 
<script src="js/mtree.js"></script> 

<script type="text/javascript">

function displayproject(dta)
{
	var companyid=dta.id;
	alert(companyid);
	var groupid=$(dta).parent().attr('id');
	alert(groupid);
	$.ajax({
	      type: "POST",
	      url: "HomeGroupMasterServlet",
	      data:{grpid:groupid,cmpid:companyid,action:"project"},
	      dataType:"json",
	      success: function(data){
	    	alert(data);
		      var out="";
		      $.each(data, function(key,value){
			      
			      out=out+"<tr id='"+value.projectid+"'>";
			      out=out+"<td></td><td></td><td><i class='fa fa-plus'></i></td>";
			      out=out+"<td>"+value.projectName+"</td></tr>";
		      })
				alert(out);
		      $("#"+groupid).append(out);
	      },
	      error: function(xhr, status, error) {
	    	  var err = eval("(" + xhr.responseText + ")");
	    	  alert(status);
	    	  alert(err);
	    	}
	    
	  });	
	 // alert(dta.id);
	  
}

function displaycompany(dta)
{
	var groupid=dta.id;
	$.ajax({
	      type: "POST",
	      url: "HomeGroupMasterServlet",
	      data:{grpid:groupid,action:"company"},
	      dataType:"json",
	      success: function(data){
		      var out="";
		      $.each(data, function(key,value){
			      
			      out=out+"<tr id='"+value.companyid+"'onclick='displayproject(this)'>";
			      out=out+"<td></td><td><i class='fa fa-plus'></i></td>";
			      out=out+"<td>"+value.companyName+"</td></tr>";
			     
		      })
		      $("#"+groupid).append(out);
	      },
	      error: function(xhr, status, error) {
	    	  var err = eval("(" + xhr.responseText + ")");
	    	  alert(status);
	    	  alert(err);
	    	}
	    
	  });
	
	
	
	 // alert(dta.id);
	  
}

$(function () {

	//groups
	$.ajax({
      type: "POST",
      url: "HomeGroupMasterServlet",
      data:{action:"grp"},
      dataType:"json",
      success: function(data){
    	
	      var out="";
	      $.each(data, function(key,value){
	    	 out=out+"<li value='"+value.groupid+"'>"+value.groupName;
	      $.each(value.company , function(key1 , value1){ // First Level
	    	  out=out+"<ul>";
	    	  out=out+"<li value='"+value1.companyid+"'>"+value1.companyName;
	    	 
	    	    $.each(value1.project , function(k , v ){  // The contents inside stars
	    	        //alert(v)
	    	        
	  	    	  out=out+"<li value='"+v.projectid+"'>"+v.projectName+"</li>";
	    	        
	    	        
	    	    });
	    	    out=out+"</ul>";
	    	    out=out+"</li>";

	    	});
	      out=out+"</ul>";
	      out=out+"</li>";
	      });
	      
	      
	     // $.each(data, function(key,value){
// 		      out=out+"<div id='1'>";
		      
// 		      out=out+"<tr id='"+value.groupid+"' onclick='displaycompany(this)'>";
// 		      out=out+"<td><i class='fa fa-plus'></i></td>";
// 		      out=out+"<td>"+value.groupName+"</td></tr>";
		      
		     
// 		      out=out+"</div>";
	     // })
			//alert(out);
	      $(".mtree").append(out);
                          
      }
  });
  
 


	


//table
	
	$('.footable').footable();

  $('.footable').footable().bind('footable_filtering', function (e) {
  });

  $('.clear-filter').click(function (e) {
    e.preventDefault();
    $('.filter-state').val('');
    $('.footable').trigger('footable_clear_filter');
  });

  $('.edit').click(function (e) {

	  var tablerow = $(".footable input[type='radio']:checked").parents("tr");           
	  var id = tablerow.attr("id");            
	  //var string = 'id='+ id ;

	  // post the filename to the delete page
	  //$.ajax({
	    //  type: "POST",
	      //url: "delete-event.php",
	      //data: string,
	      //cache: false,
	      //success: function(){
	        //          tablerow.css("background", "red");
	          //        tablerow.fadeOut(function() {
	            //          $(this).remove();
	              //    });
	      //}
	  //});
	  //return false;
	    //alert(JSON.stringify(tablerow));
	  });
//document.ready(function(){

	
//});

  $('.add').click(function (e) {

	 // alert("hi");
	  $('.addform').css("visibility","visible");

	  //addform
	  //window.location = "http://www.google.com";
	  });

  $('.delete').click(function (e) {
	  var tablerow = $(".footable input[type='radio']:checked").parents("tr");           
	  var id = tablerow.attr("id");
	  confirm("Are You Sure You Want to delete?");
	  window.location = "http://www.google.com";
	  });

 


$('#change-page-size').change(function (e) {
	e.preventDefault();
	var pageSize = $(this).val();
	$('.footable').data('page-size', pageSize);
	$('.footable').trigger('footable_initialized');
});


//10/8


//$(document).ready(function() {
  var mtree = $('ul.mtree');
  
  // Skin selector for demo
//   mtree.wrap('<div class=mtree-demo></div>');
//   var skins = ['bubba','skinny','transit','jet','nix'];
//   mtree.addClass(skins[0]);
//   $('body').prepend('<div class="mtree-skin-selector"><ul class="button-group radius"></ul></div>');
//   var s = $('.mtree-skin-selector');
//   $.each(skins, function(index, val) {
//     s.find('ul').append('<li><button class="small skin">' + val + '</button></li>');
//   });
//   s.find('ul').append('<li><button class="small csl active">Close Same Level</button></li>');
//   s.find('button.skin').each(function(index){
//     $(this).on('click.mtree-skin-selector', function(){
//       s.find('button.skin.active').removeClass('active');
//       $(this).addClass('active');
//       mtree.removeClass(skins.join(' ')).addClass(skins[index]);
//     });
//   })
//   s.find('button:first').addClass('active');
//   s.find('.csl').on('click.mtree-close-same-level', function(){
//     $(this).toggleClass('active'); 
//   });
//});








});

</script>
<div class="main" role="main">
      <div id="content" class="content full">

<div class="col-md-4" style="width: 24%;">

<ul class="mtree transit">
</ul>
  <!-- <ul class="mtree transit">
    <li value="africa"><a href="#">Africa</a>
      <ul>
        <li><a href="#">Algeria</a></li>
        <li><a href="#">Marocco</a></li>
        <li><a href="#">Libya</a></li>
        <li><a href="#">Somalia</a></li>
        <li><a href="#">Kenya</a></li>
        <li><a href="#">Mauritania</a></li>
        <li><a href="#">South Africa</a></li>
      </ul>
    </li>
    <li><a href="#">America</a>
      <ul>
        <li><a href="#">North-America</a>
          <ul>
            <li><a href="#">Canada</a></li>
            <li><a href="#">USA</a>
              <ul>
                <li><a href="#">New York</a></li>
                <li><a href="#">California</a>
                  <ul>
                    <li><a href="#">Los Angeles</a></li>
                    <li><a href="#">San Diego</a></li>
                    <li><a href="#">Sacramento</a></li>
                    <li><a href="#">San Francisco</a></li>
                    <li><a href="#">Bakersville</a></li>
                  </ul>
                </li>
                <li><a href="#">Lousiana</a></li>
                <li><a href="#">Texas</a></li>
                <li><a href="#">Nevada</a></li>
                <li><a href="#">Montana</a></li>
                <li><a href="#">Virginia</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li><a href="#">Middle-America</a>
          <ul>
            <li><a href="#">Mexico</a></li>
            <li><a href="#">Honduras</a></li>
            <li><a href="#">Guatemala</a></li>
          </ul>
        </li>
        <li><a href="#">South-America</a>
          <ul>
            <li><a href="#">Brazil</a></li>
            <li><a href="#">Argentina</a></li>
            <li><a href="#">Uruguay</a></li>
            <li><a href="#">Chile</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#">Asia</a>
      <ul>
        <li><a href="#">China</a></li>
        <li><a href="#">India</a></li>
        <li><a href="#">Malaysia</a></li>
        <li><a href="#">Thailand</a></li>
        <li><a href="#">Vietnam</a></li>
        <li><a href="#">Singapore</a></li>
        <li><a href="#">Indonesia</a></li>
        <li><a href="#">Mongolia</a></li>
      </ul>
    </li>
    <li><a href="#">Europe</a>
      <ul>
        <li><a href="#">North</a>
          <ul>
            <li><a href="#">Norway</a></li>
            <li><a href="#">Sweden</a></li>
            <li><a href="#">Finland</a></li>
          </ul>
        </li>
        <li><a href="#">East</a>
          <ul>
            <li><a href="#">Romania</a></li>
            <li><a href="#">Bulgaria</a></li>
            <li><a href="#">Poland</a></li>
          </ul>
        </li>
        <li><a href="#">South</a>
          <ul>
            <li><a href="#">Italy</a></li>
            <li><a href="#">Greece</a></li>
            <li><a href="#">Spain</a></li>
          </ul>
        </li>
        <li><a href="#">West</a>
          <ul>
            <li><a href="#">France</a></li>
            <li><a href="#">England</a></li>
            <li><a href="#">Portugal</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#">Oceania</a>
      <ul>
        <li><a href="#">Australia</a></li>
        <li><a href="#">New Zealand</a></li>
      </ul>
    </li>
    <li><a href="#">Arctica</a></li>
    <li><a href="#">Antarctica</a></li>
</ul>
 --></div>
<br style="clear: both;">
</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src='http://cdnjs.cloudflare.com/ajax/libs/velocity/0.2.1/jquery.velocity.min.js'></script> 
<script src="js/mtree.js"></script> 
<script>
$(document).ready(function() {
  var mtree = $('ul.mtree');
  
  // Skin selector for demo
//   mtree.wrap('<div class=mtree-demo></div>');
//   var skins = ['bubba','skinny','transit','jet','nix'];
//   mtree.addClass(skins[0]);
//   $('body').prepend('<div class="mtree-skin-selector"><ul class="button-group radius"></ul></div>');
//   var s = $('.mtree-skin-selector');
//   $.each(skins, function(index, val) {
//     s.find('ul').append('<li><button class="small skin">' + val + '</button></li>');
//   });
//   s.find('ul').append('<li><button class="small csl active">Close Same Level</button></li>');
//   s.find('button.skin').each(function(index){
//     $(this).on('click.mtree-skin-selector', function(){
//       s.find('button.skin.active').removeClass('active');
//       $(this).addClass('active');
//       mtree.removeClass(skins.join(' ')).addClass(skins[index]);
//     });
//   })
//   s.find('button:first').addClass('active');
//   s.find('.csl').on('click.mtree-close-same-level', function(){
//     $(this).toggleClass('active'); 
//   });
});
</script>
<script type="text/javascript">

//   var _gaq = _gaq || [];
//   _gaq.push(['_setAccount', 'UA-36251023-1']);
//   _gaq.push(['_setDomainName', 'jqueryscript.net']);
//   _gaq.push(['_trackPageview']);

//   (function() {
//     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
//     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
//     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
//   })();

</script>











<%@ include file="footer.jsp"%>
    