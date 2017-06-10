<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
    
    function doNothing(value)
    {
    	if(value == "rejected")
    		{
    		alert("Leave already Rejected");
    		}
    	else if(value == "cancelled")
    		{
    		alert("Leave already Cancelled");
    		}
    }
    
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
   document.getElementById( "cancelbutton" ).value = false;
   document.forms[ 'authenticationEntryForm' ].submit();
   return true;
  }
 }

 function cancelRequest ()
 {
  document.getElementById( "cancelbutton" ).value = true;
  return true;
 }
 
 function checkBlockeddate()
 {
	 <%
	 Connection c = (Connection)request.getSession().getAttribute("connection");
	 Statement st5 = c.createStatement();
	 SimpleDateFormat dateformat3 = new SimpleDateFormat("MM/dd/yyyy");
	  ResultSet resultset7 = null; 
	  resultset7 = st5
  		    .executeQuery("SELECT date(blockday_dt) FROM ORG_BLOCKDAYS");
	  Date date3 = null;
	  while (resultset7.next()) {
		  String d = resultset7.getString(1);
		 // System.out.println("d1111"+d);
		  String ds[] = d.split(" ");
		  String dss[] = ds[0].split("-");
		   String date4 = dss[1]+"/"+dss[2]+"/"+dss[0];
	  //System.out.println("date4:"+ date4);
	  
	  %>
	  var from11 = $('#from').val(); var to11 = $('#to').val();

	 var datetime = Date.parse("<%= date4 %>");
	 var from1 =  Date.parse(from11);
     var to1 = Date.parse(to11);
    
     
	 if (( from1 <= datetime   && datetime <= to1 ) )
	 {
		 document.getElementById( "blockerror" ).style.display = "block";                 
	 }
	else
	{
	return false;
	}
     <% resultset7.close(); st5.close(); } %>
 }
 
 function checkHoliday()
 {
	 <%
	// Connection c = (Connection)request.getSession().getAttribute("connection");
	 Statement st6 = c.createStatement();
	 SimpleDateFormat dateformat6 = new SimpleDateFormat("MM/dd/yyyy");
	  ResultSet resultset6 = null; 
	  resultset6 = st6
  		    .executeQuery("SELECT date(holiday_dt) FROM ORG_HOLIDAYS");
	  Date date6 = null;
	  while (resultset6.next()) {
		  String d = resultset6.getString(1);
		 // System.out.println("d1111"+d);
		  String ds[] = d.split(" ");
		  String dss[] = ds[0].split("-");
		   String date4 = dss[1]+"/"+dss[2]+"/"+dss[0];
	 // System.out.println("date4:"+ date4);
	  
	  %>
	  var from11 = $('#from').val(); var to11 = $('#to').val();
	 
	 var datetime = Date.parse("<%= date4 %>");
	 var from1 =  Date.parse(from11);
     var to1 = Date.parse(to11);
     
     if (( from1 <= datetime   && datetime <= to1 ) )
     {
         document.getElementById( "holiday" ).style.display = "block";                 
     }
	else
	{
		return false;
	}
     <% } resultset6.close(); st6.close(); %>
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
font-family: Verdana;
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
font-family: Verdana;
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
font-family: Verdana;
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
font-family: Verdana;
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
font-family: Verdana;
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
font-family: Verdana;
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
font-family: 'Helvetica Neue', Roboto, Arial, 'Droid Sans', sans-serif;
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

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion({collapsible: true ,active: false,heightStyle: "content"});
  } );
  </script>
 
  <!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
  <script type="text/javascript">
$(document).ready(function() {
 $("#tablediv").hide();
     $("#to").change(function(event){
      var from = $('#from').val(); var to = $('#to').val(),
         url = "PopulateTable"
             + "?from=" + from
             + "&to=" + to;
      if(from !=null && from!=''&&  from!="")
	  {
	  document.getElementById( "holiday" ).style.display = "none";
	  document.getElementById( "blockerror" ).style.display = "none";
	  checkHoliday();
	  checkBlockeddate();
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


$(document).ready(function() {
 $("#tablediv").hide();
     $("#from").change(function(event){
      var from = $('#from').val(); var to = $('#to').val(),
         url = "PopulateTable"
             + "?from=" + from
             + "&to=" + to;
      if(to !=null && to!=''&&  to!="")
      {
   	  document.getElementById( "holiday" ).style.display = "none";
   	  document.getElementById( "blockerror" ).style.display = "none";
   	  checkHoliday();
   	  checkBlockeddate();
      
      
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
              <a href="index.jsp" class="site_title">
              	<img src="images//V_logo.png" style="width:30px;height:30px;margin-top:5px;"/>
              	<span> Vacation Manager</span>
              </a>
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
            <br />
            <!-- sidebar menu -->
           <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
               
                <ul class="nav side-menu">
                  <li><a href="index.jsp"><i class="fa fa-home"></i> Home </a></li>
                  <li><a href="leaveHistory.jsp"><i class="fa fa-desktop"></i> Leave History</a></li>
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
                  <h3>Leave balance</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-comments-o"></i></div>
                  <div class="count"><%= (session.getAttribute("pending"))%></div>
                  <h3>Leaves applied</h3>
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
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Dashboard <small>Leave Tracker</small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
               
                    <div class="col-md-9 col-sm-12 col-xs-12">
                 
                      <div class="demo-container" style="height:280px">
                      <%
                      //System.out.println(request);
                     // System.out.println((Boolean)request.getSession().getAttribute("applyLeave"));
                     
                      int user_id = (Integer)session.getAttribute("user_id") ;
                      Map<Integer,String> month = (Map<Integer,String>)(session.getAttribute("month"));
                     
                  //Connection c = (Connection)request.getSession().getAttribute("connection");
                      Statement st = c.createStatement();
                      Statement st1 = c.createStatement();
              ResultSet resultset = null;
              ResultSet resultset1= null;
              int request_id = Integer.parseInt(request.getParameter("request_id"));
                      try
                      {

              resultset1 = st1.executeQuery("SELECT type_cd,description FROM TIME_OFFS");
              String sql = "SELECT leave_Type,start_dt,end_dt,comments,request_status FROM REQUEST WHERE request_id='"
                      + request_id + "' ";
             // System.out.println(sql);
            		  
              resultset = st
                 .executeQuery(sql);
            /*   while (resultset1.next()) {
              if(resultset1.getInt(1)==resultset.getInt(1)) System.out.println("values: "+resultset1.getString(2)) ;
              
              } */
                     
                     
                      %>
 <form id="UpdateLeave" name="UpdateLeave"
  action="UpdateLeave" method="post" >
  <input type="hidden" name="cancelbutton" id="cancelbutton" value=false/> 
  
  <input type="hidden" name="request_id" id="request_id" value=<%= request_id %>>
<div ><h3 style="padding-left: 125px;">Update Leave <%if(null!=request.getSession().getAttribute("leaveUpdated") && (Boolean)request.getSession().getAttribute("leaveUpdated")) {  %> <small><font size="2" color="green"><b>Leaves Updated</b> </font></small><% }%></h3>
</div><br/>
<div id="text"> Leave Type</div>
<select id="leaveType" name = "leaveType" >
<option></option>
<% while (resultset1.next()) {
System.out.println("status: "+resultset.getString(5));%>
  <option value="<%= (resultset1.getInt(1)) %>"  <%if((resultset1.getInt(1))==((resultset.getInt(1)))){%> selected <%}%> ><%= (resultset1.getString(2)) %></option>
  <% } %>
</select><br/><br/>

<div id="text" style="float :left"> From </div><input value="<%= resultset.getString(2) %>" style="float :left; width:116px;" id="from" name="from" placeholder="MM/DD/YYYY" type="text"/>
<div id="text" style="padding-left: 30px;width: 80px;"> To </div><input value = "<%= resultset.getString(3) %>" style=" width:116px;" id="to" name="to" placeholder="MM/DD/YYYY" type="text"/><br/><br/>
<div id="text">Comments</div><textarea style="height: 63px;" id="comments" name = "comments"><%= resultset.getString(4) %></textarea><br />
<br />
<%if (resultset.getString(5).equals("pending") ) {%>
 <input style="margin-left: 50px;height: 26px; width: 116px;" onclick="return validate()" title="Update Leave" type="submit" name="Update" value="Update Leave"/>
 <input  style="height: 26px; width: 116px;" onclick="return cancelRequest()" title="Cancel Leave" type="submit" name="Cancel" value="Cancel Leave"/>
<% } else if(resultset.getString(5).equals("approved")) {%>

<input style="margin-left: 50px;height: 26px; width: 116px;"  disabled="disabled" onclick="return doNothing(<%=resultset.getString(5) %>)" title="Update Leave" type="submit" name="Update" value="Update Leave"/>
 <input style="height: 26px; width: 116px;" onclick="return cancelRequest()"  title="Cancel Leave" type="submit" name="Cancel" value="Cancel Leave"/>

<% } else {%>

<input disabled="disabled" style="margin-left: 50px;height: 26px; width: 116px;"   onclick="return doNothing(<%=resultset.getString(5) %>)" title="Update Leave" type="submit" name="Update" value="Update Leave"/>
 <input disabled="disabled" style="height: 26px; width: 116px;" onclick="return doNothing(<%=resultset.getString(5) %>)"  title="Cancel Leave" type="submit" name="Cancel" value="Cancel Leave"/>

<% } %>
<span id="blockerror" style="display:none; color:red"> Cann't apply leave containing blocked days</span>
<span id="holiday" style="display:none; color:blue"> Leaves contain Holiday</span>
</form> 
                      </div>
                    </div>
                 
 <% } catch(Exception e)
                      {
                      e.printStackTrace();
                      }
                      resultset.close(); resultset1.close();  st.close(); st1.close(); %>                
                    <div id="accordion"  class="col-md-3 col-sm-12 col-xs-12">
                    </div>
                  </div>
                </div>
              </div>
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
        <th scope="col" style="padding-left: 15px;">From</th>
        <th scope="col" style="padding-left: 15px;">To</th>
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