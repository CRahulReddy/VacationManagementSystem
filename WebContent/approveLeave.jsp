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
			 if ( document.getElementById( "action" ).value == "" || document.getElementById( "action" ).value == null ) {
			alert( "Either approve or Reject" );
			return false;
		}
		
		else {
			document.forms[ 'authenticationEntryForm' ].submit();
			return true;
		}
	}
	

	function posturl (value)  {
	   alert("hi");
	     var myForm = document.createElement("form");
	    myForm.action="approveLeave.jsp?id="+value;// the href of the link
	     myForm.method="POST";
	     myForm.submit();
	     return false; // cancel the actual link
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
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Vacation Manager</span></a>
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
                  <li><a><i class="fa fa-home"></i> Home </a></li>
                  <li><a href="leaveHistory.jsp">Leave History</a></li>
                  <li><a href="profile.jsp"><i class="fa fa-edit"></i> Profile </a></li>
                </ul>
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
                  <div class="count"><%= (session.getAttribute("approved"))%></div>
                  <h3>Requests Approved</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-comments-o"></i></div>
                  <div class="count"><%= (session.getAttribute("pending"))%></div>
                  <h3>Requests Pending</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-sort-amount-desc"></i></div>
                  <div class="count"><%= (session.getAttribute("rejected"))%></div>
                  <h3>Requests Rejected</h3>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Dashboard <small>Vacation Manager</small></h2>
                    <div class="clearfix"></div>
                  </div>
                     <%
                    
                     int request_id = Integer.parseInt(request.getParameter("id"));
                        int user_id = (Integer)session.getAttribute("user_id") ;
                        Map<Integer,String> month = (Map<Integer,String>)(session.getAttribute("month"));
                       
                        Connection c1 = (Connection)request.getSession().getAttribute("connection");
                        Statement st = c1.createStatement();
               	ResultSet resultset;
               	resultset = st
            			.executeQuery("SELECT e.first_nm, e.middle_nm, e.last_nm, r.request_id, r.start_dt ,r.end_dt, r.comments, r.user_id "
            					+ "FROM EMPLOYEE e, REQUEST r "
            					+ "WHERE r.request_id=='"
            					+ request_id  + "'");
            	
            	String name="";
            	
            		if(resultset.getString(2)!=null && !resultset.getString(2).equals(" "))
        				name = resultset.getString(1)+" "+resultset.getString(2)+" "+resultset.getString(3);
        			else
        				name = resultset.getString(1)+" "+resultset.getString(3);
               	
               	%>
                  <div class="x_content" style="width:60%;">
                  
                    <div class="col-md-9 col-sm-12 col-xs-12">
                   
                       <div class="demo-container" style="height:280px">
<form id="LeaveRequest" name="LeaveRequest"
		action="LeaveRequest" method="post" >
		<input type="hidden" name="request_id" id="request_id" value="<%=request_id %>"/>
<div ></div><br/>
<div style="width:100%; padding-bottom: 9px;">
<div id="text" style="float :left"> Name </div><input style="float :left; width:116px;" id="name" name="name"  type="text" value="<%=name %>" readonly="readonly"/>
<div id="text" style="padding-left: 30px;width: 80px;"> User_ID </div><input style="float :left;  width:116px;" readonly="readonly" id="id" name="id"  type="text" value="<%=resultset.getString(8) %>"/>
</div>
<div style="width:100%;">
<br/><br/><div  id="text" id="text" style="float :left"> Leave Type</div>
<select id="leaveType" name = "leaveType" >
<option>Sick Leave</option>
</select><br/><br/>
</div>
<div>
<div id="text" style="float :left"> From </div><input style="float :left; width:116px;" id="from1" name="from1" placeholder="MM/DD/YYYY" type="text" readonly="readonly" value="<%=resultset.getString(5) %>"/>
<div id="text" style="padding-left: 30px;width: 80px;"> To </div><input style=" width:116px;" id="to1" name="to1" placeholder="MM/DD/YYYY" type="text" readonly="readonly" value="<%=resultset.getString(6) %>"/><br/><br/> 
</div>
<div>
<div id="text">Comments</div><input  id="comments" name = "comments" readonly="readonly" value="<%=resultset.getString(7) %>"/><br />
<br />
</div>
<div><div  id="text">Action</div>
<select id="action" name = "action">
<option>Approve</option>
<option>Reject</option>
</select><br/><br/></div>
<div>
<div  id="text"></div> <input onclick="return validate()" type="submit" name="submit" /> </div>
</form>   
                      </div>


                      
                     
               
                      </div>  
                     
                    </div>

                    
                  </div>
                </div>
              </div>
            </div>
   
<%--     <div class="row">
              <div class="col-md-4">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Requests Approved <small>Recent 5</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                 <%  
               
                
                 Class.forName("org.sqlite.JDBC");
     	     
                 try
                 {
                 
        	resultset = st
        			.executeQuery("SELECT date(start_dt) , user_id  FROM REQUEST WHERE updated_by='"
        					+ user_id + "' and  start_dt <= (datetime('now', 'localtime')) and request_status = 'approved' ");
        	while (resultset.next()) {
        		String date = resultset.getString(1);
        		System.out.println("date1: "+date);
        		String dates[] = date.split("-");
        	%>
                    <article class="media event">
                      <a class="leave">
                        <p class="month"><%= month.get(dates[1]) %> <strong><font size="3"><%= month.get(dates[2]) %></font></strong></p>
                       
                      </a>
                      <div class="media-body">
                        <a class="title" href="#"><%= resultset.getInt(2)%></a>
                       
                      </div>
                    </article>
               <% }
        	}
        	catch(Exception e)
        	{
        	e.printStackTrace();
        	}%>   
                    
                   
                    
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Requests Planned <small>Recent 5</small></h2>
                 
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                     <%  
                
                 st = c.createStatement();
        	resultset = st
        			.executeQuery("SELECT date(start_dt) , user_id  FROM REQUEST WHERE updated_by='"
        					+ user_id + "' and  start_dt > (datetime('now', 'localtime')) and    request_status ='approved'");
        	while (resultset.next()) {
        		String date = resultset.getString(1);
        		System.out.println("date2: "+date);
        		String dates[] = date.split("-");
        	%>
                  
                  
                    <article class="media event">
                      <a class="leave">
                        <p class="month"><%= month.get(dates[1]) %> <strong><font size="3"><%= month.get(dates[2]) %></font></strong></p>
                       
                      </a>
                      <div class="media-body">
                        <a class="title" href="#"><%= resultset.getInt(2)%></a>
                       
                      </div>
                    </article>
                     <% } %> 
                    
                  
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Requests Rejected <small>Recent 5</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                        <%  
                
                 st = c.createStatement();
        	resultset = st
        			.executeQuery("SELECT date(start_dt) , user_id FROM REQUEST WHERE updated_by='"
        					+ user_id + "' and    request_status ='rejected'");
        	while (resultset.next()) {
        		String date = resultset.getString(1);
        		System.out.println("date3: "+date);
        		String dates[] = null;
        		try
        		{
        			dates = date.split("-");
        		}
        		catch(Exception e)
        		{
        			e.printStackTrace();
        		}
        		 
        	%>
                    <article class="media event">
                      <a class="leave">
                        <p class="month"><%= month.get(dates[1]) %>  <strong><font size="3"><%= month.get(dates[2]) %></font></strong></p>
                       
                      </a>
                      <div class="media-body">
                        <a class="title" href="#"><%= resultset.getInt(2)%></a>
                       
                      </div>
                    </article>
                  
                   
                    <% } %> 
                  </div>
                </div>
              </div>
            </div> --%>
   
   
            </div>
          </div>

        <!-- /page content -->

      </div>
    </div>
<% c1.close(); %>
    <!-- jQuery -->
    <script src="js/jquery-1.9.1.min.js"></script>
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