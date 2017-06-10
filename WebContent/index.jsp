<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Vacation Manager</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
    <script>
 function validate () {
 
  if(document.getElementById( "from" ).value == "01/02/2016" || document.getElementById( "from" ).value == "01/26/2016"
    || document.getElementById( "to" ).value == "01/02/2016" || document.getElementById( "to" ).value == "01/26/2016")
   {
   alert( "Cann't apply leave on blocked day" );
   return false;
   }
 
  if ( document.getElementById( "leaveType" ).value == "" || document.getElementById( "leaveType" ).value == null ) {
   alert( "Please choose Leave type" );
   return false;
  }
  else if ( document.getElementById( "from" ).value == "" || document.getElementById( "from" ).value == null ) {
   alert( "Choose from date" );
   return false;
  }
  else if ( document.getElementById( "to" ).value == "" || document.getElementById( "to" ).value == null ) {
   alert( "Choose to date" );
   return false;
  }
  else if ( document.getElementById( "to" ).value < document.getElementById( "from" ).value) {
   alert( "to date cann't be smaller than from date" );
   return false;
  }
  else if ( document.getElementById( "comments" ).value == "" || document.getElementById( "comments" ).value == null ) {
   alert( "Enter comments" );
   return false;
  }
  else if ( document.getElementById( "comments" ).value.length > 20 ) {
   alert( "Only 20 charaters allowed in comments" );
   return false;
  }
  else {
   document.forms[ 'ApplyLeave' ].submit();
   return true;
  }
 }
    </script>
	
 <style>
#text
{
float:left;
width:100px;
}

/*CSS for dropdown box*/
select
{
width: 200px;
height: 29px;
border-radius: 3px;
border: 1px solid #CCC;
font-weight: 200;
font-size: 15px;
font-family: Calibri;
box-shadow: 1px 1px 5px #CCC;
}
select: hover
{
width: 200px;
height: 29px;
border-radius: 3px;
border: 1px solid #CCC;
font-weight: 200;
font-size: 15px;
font-family: Calibri;
box-shadow: 1px 1px 5px #CCC;
}

/*CSS for input textbox and password*/

input[type='text'], input[type='password']
{
width: 200px;
height: 29px;
border-radius: 3px;
border: 1px solid #CCC;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Calibri;
box-shadow: 1px 1px 5px #CCC;
}

input[type='text']:hover, input[type='password']:hover
{
width: 200px;
height: 29px;
border-radius: 3px;
border: 1px solid #aaa;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Calibri;
box-shadow: 1px 1px 5px #CCC;
}

/*CSS for textarea*/

textarea
{
width: 200px;
height: 90px;
border-radius: 3px;
border: 1px solid #CCC;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Calibri;
box-shadow: 1px 1px 5px #CCC;
}
textarea:hover
{
width: 200px;
height: 90px;
border-radius: 3px;
border: 1px solid #aaa;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Calibri;
box-shadow: 1px 1px 5px #CCC;
}

/*input type for submit button*/

input[type='submit']
{
width: 150px;
height: 34px;
border: 2px solid white;
background-color:#CCC;
}
input[type='submit']:hover
{
width: 150px;
height: 34px;
border: 2px solid white;
background-color:#000000;
color:#fff;
}

.leave
{
-webkit-background-clip: border-box;
-webkit-background-origin: padding-box;
-webkit-background-size: auto;
background-attachment: scroll;
background-clip: border-box;
background-color: rgb(204, 204, 204);
background-image: none;
background-origin: padding-box;
background-size: auto;
border-bottom-left-radius: 10px;
border-bottom-right-radius: 10px;
border-top-left-radius: 10px;
border-top-right-radius: 10px;
box-sizing: border-box;
color: rgb(255, 255, 255);
display: block;
float: left;
font-family: Calibri;
font-size: 13px;
font-weight: normal;
height: 22px;
line-height: 19px;
margin-right: 10px;
outline-color: rgb(90, 115, 142);
outline-style: none;
outline-width: 0px;
padding-bottom: 5px;
padding-left: 5px;
padding-right: 5px;
padding-top: 1px;
text-decoration: none;
width: 70px;
zoom: 1;
}

</style>

   <script src="https://code.jquery.com/jquery-latest.js"></script>
 <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion({collapsible: true ,active: false,heightStyle: "content"});
  } );
  </script>
 
  <script type="text/javascript">
$(document).ready(function() {
 $("#tablediv").hide();
     $("#to").change(function(event){
      var from = $('#from').val(); var to = $('#to').val(),
         url = "PopulateTable"
             + "?from=" + from
             + "&to=" + to;
           $.get(url,function(responseJson) {
            if(responseJson!=null){
                $("#requestTable").find("tr:gt(0)").remove();
                var table1 = $("#requestTable");
                table1.find("tr").remove();
                var rowNew = $("<tr style='height: 28px;'  class='media event'><th scope='col' style='padding-left: 15px;'>Request_ID</th> <th scope='col' style='padding-left: 15px;'>Leave Type</th> <th scope='col' style='padding-left: 15px;'>From</th> <th scope='col' style='padding-left: 15px;'>To</th> <th scope='col' style='padding-left: 15px;'>Status</th>     </tr>");
                rowNew.appendTo(table1);
                $.each(responseJson, function(key,value) {
                     var rowNew = $("<tr style='height: 26px;'  class='media event'><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td></tr>");
                        rowNew.children().eq(0).text(value['request_id']);
                        rowNew.children().eq(1).text("Sick Leave");
                        rowNew.children().eq(2).text(value['start_dt']);
                        rowNew.children().eq(3).text(value['end_dt']);
                        rowNew.children().eq(4).text(value['request_status']);
                        rowNew.appendTo(table1);
                });
                }
            });
            $("#tablediv").show();        
  });    
});


$(document).ready(function() {
 $("#tablediv").hide();
     $("#from").change(function(event){
      var from = $('#from').val(); var to = $('#to').val(),
         url = "PopulateTable"
             + "?from=" + from
             + "&to=" + to;
      if(to !=null && to!=''&&  to!="")
       {
      
      
           $.get(url,function(responseJson) {
            if(responseJson!=null){
                $("#requestTable").find("tr:gt(0)").remove();
                var table1 = $("#requestTable");
                table1.find("tr").remove();
                var rowNew = $("<tr style='height: 28px;'  class='media event'><th scope='col' style='padding-left: 15px;'>Request_ID</th> <th scope='col' style='padding-left: 15px;'>Leave Type</th> <th scope='col' style='padding-left: 15px;'>From</th> <th scope='col' style='padding-left: 15px;'>To</th> <th scope='col' style='padding-left: 15px;'>Status</th>     </tr>");
                rowNew.appendTo(table1);
                $.each(responseJson, function(key,value) {
                     var rowNew = $("<tr style='height: 26px;'  class='media event'><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td></tr>");
                        rowNew.children().eq(0).text(value['request_id']);
                        rowNew.children().eq(1).text("Sick Leave");
                        rowNew.children().eq(2).text(value['start_dt']);
                        rowNew.children().eq(3).text(value['end_dt']);
                        rowNew.children().eq(4).text(value['request_status']);
                        rowNew.appendTo(table1);
                });
                }
            });
            $("#tablediv").show();  
       }
  });    
});
</script>

  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><img src="images//V_logo.png" style="widht:20px;height:20px"></i> <span>Vacation Manager</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile" style="height:30px;">
             
              <div style="width:230px;float:right;padding:0px 0px 10px 0px" class="profile_info">
     		<center>
                <span>Welcome,</span>
                <h2><%= (session.getAttribute("name"))%></h2><%= (session.getAttribute("userType"))%>
    		</center>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br/><br/>
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
               
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home </a></li>
                  <li><a><i class="fa fa-desktop"></i>Leave History</a></li>
                  <li><a href="profile.jsp"><i class="fa fa-edit"></i> Profile </a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <%= (session.getAttribute("name"))%>
                   <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="Login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>

        <!-- page content -->
        <div class="right_col" role="main" style="min-height:562px;">
          <div class="">
            <div class="row top_tiles">
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-caret-square-o-right"></i></div>
                  <div class="count"><%= (session.getAttribute("balance"))%></div>
                  <h3>Leave Balance</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-comments-o"></i></div>
                  <div class="count"><%= (session.getAttribute("pending"))%></div>
                  <h3>Leaves Applied</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-sort-amount-desc"></i></div>
                  <div class="count"><%= (session.getAttribute("approved"))%></div>
                  <h3>Leaves Approved</h3>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Apply Leave</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                      <div class="demo-container" style="height:300px">
                      <%
                      System.out.println(request);
                      System.out.println((Boolean)request.getSession().getAttribute("applyLeave"));
                      if((Boolean)request.getSession().getAttribute("applyLeave")) { %><div><span style="color: green">Leaves Applied </span></div><% }%>
<form id="ApplyLeave" name="ApplyLeave"
  action="ApplyLeave" method="post" >

<br/>
<div id="text"> Leave Type</div>
<select id="leaveType" name = "leaveType">
<option></option>
<option>PTO</option>
<option>Sick</option>
<option>Unpaid</option>
<option>Training</option>
<option>Remote</option>
</select><br/><br/>
<div id="text"> From </div><input style="width:110px;" id="from" name="from" placeholder="MM/DD/YYYY" type="text"/><br/><br/>
<div id="text"> To </div><input style=" width:110px;" id="to" name="to" placeholder="MM/DD/YYYY" type="text"/><br/><br/>
<div id="text">Comments</div><textarea id="comments" name = "comments"></textarea><br />
<br />
<input onclick="return validate()" type="submit" name="submit" />
</form>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
               <div class="col-md-6">
               <iframe src="https://public.tableau.com/views/VMS/Dashboard1?:embed=y&:display_count=yes&:toolbar=no&:showVizHome=no"shy width="550" height="600">
            </iframe></div>
            </div>
           
                <div class="row" >
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Leaves Requests <small>applied in above period</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
            <div id="tablediv">
<table cellspacing="0" id="requestTable">
<thead>
    <tr style="height: 28px;"  class="media event">
        <th scope="col" style="padding-left: 15px;">Request_ID</th>
        <th scope="col" style="padding-left: 15px;">Leave Type</th>
        <th scope="col" >From</th>
        <th scope="col" >To</th>
        <th scope="col" style="padding-left: 15px;">Status</th>      
    </tr>
    </thead>
</table>
</div>  
               
                 
                  </div>
                </div>
              </div>

              </div>
           
            </div>
          </div>

        <!-- /page content -->
      </div>
    </div>
    <!-- jQuery -->
   <!--  <script src="js/jquery-1.9.1.min.js"></script> -->
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
 
 <!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
 $(document).ready(function(){
  var date_input=$('input[name="to"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  date_input.datepicker({
   format: 'mm/dd/yyyy',
   container: container,
   todayHighlight: true,
   autoclose: true,
  })
 })
 
 $(document).ready(function(){
  var date_input=$('input[name="from"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  date_input.datepicker({
   format: 'mm/dd/yyyy',
   container: container,
   todayHighlight: true,
   autoclose: true,
  })
 })
</script>

  </body>
</html>